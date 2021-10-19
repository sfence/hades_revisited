local S = minetest.get_translator("hades_seasons")

hades_seasons = {}

-- Number of days in a season
hades_seasons.SEASON_LENGTH = 10
-- How many seasons there are
hades_seasons.SEASONS = 3
-- How many days in a year
hades_seasons.YEAR_LENGTH = hades_seasons.SEASON_LENGTH * hades_seasons.SEASONS

-- Season IDs
hades_seasons.SEASON_SPRING = 0
hades_seasons.SEASON_SUMMER = 1
hades_seasons.SEASON_FALL = 2

hades_seasons.SEASON_IDS = {
	hades_seasons.SEASON_SPRING,
	hades_seasons.SEASON_SUMMER,
	hades_seasons.SEASON_FALL,
}

hades_seasons.SEASON_NAMES = {
	[hades_seasons.SEASON_SPRING] = S("Spring"),
	[hades_seasons.SEASON_SUMMER] = S("Summer"),
	[hades_seasons.SEASON_FALL] = S("Fall"),
}

-- When the season is forced, this contains the season ID of the forced season.
-- Otherwise, it is nil.
local forced_season = nil

-- Declare function name for callbacks here, define it below
local call_on_season_change_callbacks

-- Returns season ID (see above) of a given day.
-- * day (optional): Days since world creation (if not given, uses minetest.get_day_count())
-- Note: This function might return nil if no day is given because
-- minetest.get_day_count() might fail before the game is fully loaded
hades_seasons.get_season = function(day)
	if forced_season then
		return forced_season
	end
	if not day then
		day = minetest.get_day_count()
		if not day then
			return nil
		end
	end
	local season = math.floor(day / hades_seasons.SEASON_LENGTH) % hades_seasons.SEASONS
	return season
end

-- Returns the current year (starts counting at 0).
-- * day (optional): Days since world creation (if not given, uses minetest.get_day_count())
hades_seasons.get_year = function(day)
	if not day then
		day = minetest.get_day_count()
	end
	local year = math.floor(day / hades_seasons.YEAR_LENGTH)
	return year
end

-- Returns the day within the current season (starts counting at 0).
-- * day (optional): Days since world creation (if not given, uses minetest.get_day_count())
hades_seasons.get_day_in_season = function(day)
	if not day then
		day = minetest.get_day_count()
	end
	local day_in_season = day % hades_seasons.SEASON_LENGTH
	return day_in_season
end

-- Returns the day within the current year (starts counting at 0).
-- * day (optional): Days since world creation (if not given, uses minetest.get_day_count())
hades_seasons.get_day_in_year = function(day)
	if not day then
		day = minetest.get_day_count()
	end
	local day_in_year = day % hades_seasons.YEAR_LENGTH
	return day_in_year
end

--[[
In the world of Hades Revisited, the distance from Apollo,
the star around planet Hades revolves, is what makes the
seasons ... somehow. Don't ask me why, it's just a game! :D

Hades has an elliptic orbit around Apollo. The
ellipsis is centered on (0,0) in an imaginary coordinate system
with the star being on the "left" (negative X) focal point
of the ellipsis. On (0, -ORBIT_STAR_TO_CENTER), to be precise.
The star lies on the focal point for simplicity.
Many other things, like axial tilt are ignored for simplicity.

Hades revolves counter-clockwise around Apollo.

Here's a diagram (not to scale!):

                 Summer begins
                 v
               .............
              .      |      .
Summer       .       |       .
solstice >>> .   A~~~0-------H <<< Spring begins / New Year
             .               .
              .             .
               .............
                 ^
                 Fall begins

(X coordinates go right, Y coordinates go up)

  H = Hades (on day 0)
  A = Apollo (Hades' star), lies on a focal point
  . = Orbit
  0 = Center of the orbit (at coordinates 0,0)
  | = Semi-minor axis
  - = Semi-major axis
  ~ = ORBIT_STAR_TO_CENTER

Spring begins at 0°.
Summer begins at 120°.
Fall begins at 240°.

New Year's is at 0°, Hades is the furthest away at that point.
Summer Solstice is at 180°, Hades is the closest at that point.
The "other" solstice is at 0°, at New Year's.
(There is no "Winter Soltice" because there is no winter :P)
]]

--[[ The following values are required for the ellipsis calculation.
These values have been chosen by experimentation in a way for the
following effect: The distance to the star will greatly change during
spring and fall and is the farthest on New Year's but during
summer the distance is the closest and also won't change as much.

Note the values themselves are arbitrary and unit-less, its the
ratio between those values that matters. For the final "size"
of Apollo in the sky, some scaling and offsetting is still required.
]]

local ORBIT_SEMI_MAJOR_AXIS = 1 -- lies on the X (horizontal) axis
local ORBIT_SEMI_MINOR_AXIS = 0.5 -- lies on the Y (vertical) axis
local ORBIT_STAR_TO_CENTER = 0.75 -- see diagram

-- Get Hades' Cartesian distance from Apollo, given a day of the year.
-- This function gives a "raw" value with abitrary upper
-- and lower bounds. Some scaling needs to be done
-- for this value to be useful.
-- * day_in_year (optional): The day in the year to calculate with.
--                           Defaults to current day.
local get_distance_from_star_raw = function(day_in_year)
	if not day_in_year then
		day_in_year = hades_seasons.get_day_in_year()
	end
	local a = ORBIT_SEMI_MAJOR_AXIS
	local b = ORBIT_SEMI_MINOR_AXIS
	local e = ORBIT_STAR_TO_CENTER

	-- convert day-of-year to angle (0..2pi)
	local alpha = (day_in_year / hades_seasons.YEAR_LENGTH) * (math.pi*2)

	-- ellipsis calculations to get the distance
	local x = a * math.cos(alpha)
	local y = b * math.sin(alpha)
	local distance = math.sqrt(math.pow(x + e, 2) + math.pow(y, 2))
	return distance
end

local MAX_DISTANCE_FROM_STAR = get_distance_from_star_raw(0) -- New Year's
local MIN_DISTANCE_FROM_STAR = get_distance_from_star_raw(hades_seasons.YEAR_LENGTH/2) -- Summer solstice
local DISTANCE_DIFFERENCE = MAX_DISTANCE_FROM_STAR - MIN_DISTANCE_FROM_STAR

-- Get Hades' relative distance from its star, given a day of the year.
-- The output is always between 0.0 and 1.0.
-- 0.0 = min distance from star; 1.0 = max distance from star
-- * day_in_year (optional): The day in the year to calculate with.
--                           Defaults to current day.
hades_seasons.get_distance_from_star_normalized = function(day_in_year)
	if not day_in_year then
		day_in_year = hades_seasons.get_day_in_year()
	end
	-- Get raw distance
	local distance_from_star = get_distance_from_star_raw(day_in_year)

	-- Apply offsets and scaling to convert distance
	-- into the actual size of the star
	local k = distance_from_star - MIN_DISTANCE_FROM_STAR
	local l = DISTANCE_DIFFERENCE - k
	local s = l / DISTANCE_DIFFERENCE
	s = 1 - s
	return s
end

-- Force-set season to given season or nil to disable force-setting
hades_seasons.force_set_season = function(season)
	forced_season = season
	call_on_season_change_callbacks()
end

minetest.register_chatcommand("season", {
	privs = { settime=true },
	params = S("[ spring | summer | fall | natural ]"),
	description = S("Force-set the season or show the current season"),
	func = function(name, param)
		param = string.trim(param)
		if param == "spring" then
			hades_seasons.force_set_season(hades_seasons.SEASON_SPRING)
			minetest.log("action", "Season was force-set to spring by "..name)
			return true, S("Season is now forced to be spring until the game is shut down.")
		elseif param == "summer" then
			hades_seasons.force_set_season(hades_seasons.SEASON_SUMMER)
			minetest.log("action", "Season was force-set to summer by "..name)
			return true, S("Season is now forced to be summer until the game is shut down.")
		elseif param == "fall" then
			hades_seasons.force_set_season(hades_seasons.SEASON_FALL)
			minetest.log("action", "Season was force-set to fall by "..name)
			return true, S("Season is now forced to be fall until the game is shut down.")
		elseif param == "natural" then
			hades_seasons.force_set_season(nil)
			minetest.log("action", "Season force-setting has been disabled by "..name)
			return true, S("Seasons are now based on the day in year.")
		elseif param == "" then
			local season = hades_seasons.get_season()
			local season_str
			if season == hades_seasons.SEASON_SPRING then
				season_str = S("spring")
			elseif season == hades_seasons.SEASON_SUMMER then
				season_str = S("summer")
			elseif season == hades_seasons.SEASON_FALL then
				season_str = S("fall")
			end
			if forced_season then
				return true, S("Current season is @1 (forced).", season_str)
			else
				return true, S("Current season is @1.", season_str)
			end
		else
			return false
		end
	end,
})

-- Returns the given total day as a nicely-formatted string.
-- * day: total day (optional, defaults to current day)
function hades_seasons.get_date_str(day)
	local year = hades_seasons.get_year(day)
	local season = hades_seasons.get_season(day)
	local season_str = hades_seasons.SEASON_NAMES[season]
	local day_in_season = hades_seasons.get_day_in_season(day)
	local str = S("Day @1 of @2, Year @3", day_in_season+1, season_str, year+1)
	return str
end

minetest.register_chatcommand("date", {
	privs = {},
	params = "",
	description = S("Show the current date"),
	func = function(name, param)
		return true, hades_seasons.get_date_str()
	end,
})


-- Callback functions when the season changed
hades_seasons.registered_on_season_changes = {}

-- Keep track of previous season for on_season_change
local previous_season

-- Registers func to be called on season change.
-- * func: Function that is called with the current season as argument
-- Note: This function is currently based on polling,
-- so it often will not communicate season changes immediately.
-- TODO: Make sure this callback fires immediately at midnight
-- when a season changed
hades_seasons.register_on_season_change = function(func)
	table.insert(hades_seasons.registered_on_season_changes, func)
end

-- (this function is local (see above))
call_on_season_change_callbacks = function()
	local season = hades_seasons.get_season()
	if not season then
		return false
	end
	if not previous_season then
		previous_season = season
		return true
	elseif season == previous_season then
		return true
	end
	previous_season = season
	for _,callback in pairs(hades_seasons.registered_on_season_changes) do
		callback(season)
	end
	return true
end

-- Every X seconds, the season is checked if it was changed for
-- triggering the callbacks.
-- Sadly required since we don't have a callback for day change yet.
-- A downside of this is that if time_speed is very high, this
-- won't update fast enough.
local SEASON_CHECK_UPDATE_TIME = 180

-- Call the callbacks every SEASON_CHECK_UPDATE_TIME seconds
local function callback_repeater()
	local ret = call_on_season_change_callbacks()
	local time
	if ret then
		time = SEASON_CHECK_UPDATE_TIME
	else
		time = 3
	end
	minetest.after(time, callback_repeater)
end

minetest.register_on_mods_loaded(callback_repeater)
