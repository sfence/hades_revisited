-- Upper and lower pounds of the size of the "sun" (=Hades' star)
local SUN_SIZE_MIN = 0.5
local SUN_SIZE_MAX = 1.25

-- Every X seconds, the sky updates for players.
-- Sadly required since we don't have a callback for day change yet.
-- A downside of this is that if time_speed is very high, the sky
-- won't update fast enough.
local SEASON_SKY_UPDATE_TIME = 180

local dawn_sky = "#807340"
local dawn_horizon = "#807340"
local night_sky = "#4C3B18"
local night_horizon = "#4C3B18"
local fog_tint_type = "custom"
local fog_sun_tint = "#201C10"
local fog_moon_tint = "#201C10"

local planet_sky = function(player)
	player:set_sky({type="regular", clouds=true})
	player:set_stars({visible=false})
end

local callbacks = {}

local season_sky = function(player)
	if not player or not player:is_player() then
		return
	end

	-- Seasons change the sky color and size of Hades' star
	local season = hades_seasons.get_season()

	local sky, sun_scale, clouds

	-- Sky color is per-season with hard cut off
	-- so there's a visual distinction
	if season == hades_seasons.SEASON_SPRING then
		sky = "#F0E3B0"
		clouds = { color="#FFFF72B8" }
	elseif season == hades_seasons.SEASON_SUMMER then
		sky = "#EFD7AF"
		clouds = { color="#FFDC72B8" }
	elseif season == hades_seasons.SEASON_FALL then
		sky = "#EFCCAF"
		clouds = { color="#FFB972B8" }
	else
		minetest.log("error", "[hades_sky] hades_seasons.get_season() returned invalid season!")
		return
	end

	-- Sun size is determined on a per-day basis, it just serves
	-- as eye-candy
	local diy = hades_seasons.get_day_in_year()

	-- Get normalized distance from star
	local distance = hades_seasons.get_distance_from_star_normalized(diy)
	-- Calculate sun size
	local sun_scale = 1 - distance
	sun_scale = sun_scale * (SUN_SIZE_MAX - SUN_SIZE_MIN)
	sun_scale = sun_scale + SUN_SIZE_MIN

	player:set_sky({type="regular", sky_color={
		day_sky = sky,
		day_horizon = sky,

		dawn_sky = dawn_sky,
		dawn_horizon = dawn_horizon,
		night_sky = night_sky,
		night_horizon = night_horizon,
		fog_tint_type = fog_tint_type,
		fog_sun_tint = fog_sun_tint,
		fog_moon_tint = fog_moon_tint,
	}})
	player:set_clouds(clouds)
	player:set_sun({
		scale = sun_scale,
	})
end

callbacks.init_sky = function(player)
	player:set_moon({visible=false})
	player:set_sun({visible=true, sunrise_visible=false})
	player:set_clouds({density=0.7, height=200, thickness=24})
	player:set_sky({type="regular", clouds=true})
	player:set_stars({visible=false})
	planet_sky(player)
	season_sky(player)
end

callbacks.season_sky_repeater = function(player)
	if not player or not player:is_player() then
		return
	end
	season_sky(player)
	minetest.after(SEASON_SKY_UPDATE_TIME, callbacks.season_sky_repeater, player)
end

minetest.register_on_joinplayer(callbacks.init_sky)
minetest.register_on_joinplayer(callbacks.season_sky_repeater)
