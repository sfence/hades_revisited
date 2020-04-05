local planet_sky = function(player)
	player:set_sky({type="regular", clouds=true, sky_color={
		day_sky = "#F0E3B0",
		day_horizon = "#F0E3B0",
		dawn_sky = "#807340",
		dawn_horizon = "#807340",
		night_sky = "#4C3B18",
		night_horizon = "#4C3B18",
		fog_tint_type = "custom",
		fog_sun_tint = "#201C10",
		fog_moon_tint = "#201C10",
	}})
	player:set_stars({visible=false})
end

local init_sky = function(player)
	player:set_moon({visible=false})
	player:set_sun({visible=true, sunrise_visible=false, scale=0.5})
	player:set_clouds({color="#FFFF72B8", density=0.7, height=200, thickness=24})
	planet_sky(player)
end

minetest.register_on_joinplayer(init_sky)

