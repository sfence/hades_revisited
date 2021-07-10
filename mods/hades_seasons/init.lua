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

-- Returns season ID (see above) of a given day
-- * day (optional): Days since world creation (if not given, uses minetest.get_day_count())
hades_seasons.get_season = function(day)
	if not day then
		day = minetest.get_day_count()
	end
	local season = math.floor(day / hades_seasons.SEASON_LENGTH) % hades_seasons.SEASONS
	return season
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
In the world of Hades Revisited, the distance from the sun is what
makes the seasons.

Hades' orbit around its star is an ellipsis centered on (0,0)
with the star being on the "left" (negative X) focal point
of the ellipsis.
On (0, -ORBIT_HORIZONTAL_DISTANCE_OF_FOCAL_POINT), to be precise.
Why is the star on the focal point, you ask? Because it
makes the math easier! :D

Hades revolves counter-clockwise around the star.

Here's a diagram (not to scale!):

                 Summer begins
                 v
               .............
              .             .
Summer       .               .
solstice >>> .   S           H <<< Spring begins / New Year
             .               .
              .             .
               .............
                 ^
                 Fall begins

H = Hades (on day 0)
S = Sun

Spring begins at 0°.
Summer begins at 120°.
Fall begins at 240°.

New Year's is at 0°, Hades is the furthest away at that point.
Summer Solstice is at 180°, Hades is the closest at that point.
There is no "Winter Soltice" because there is no winter. :P
]]

--[[ The following values are required for the ellipsis calculation.
These values have been chosen by experimentation in a way for the
following effect: The distance to the star will greatly change during
spring and fall and is the farthest on New Year's but during
summer the distance is the closest and also won't change as much.

Note the values themselves are arbitrary, its the ratio between those
values that matters. For the final "star size", some
scaling and offsetting is still required.
]]

local ORBIT_HORIZONTAL_LENGTH_FROM_CENTER = 1
local ORBIT_VERTICAL_LENGTH_FROM_CENTER = 0.5
local ORBIT_HORIZONTAL_DISTANCE_OF_FOCAL_POINT = 0.75

-- Get Hades' Cartesian distance from its star, given a day of the year.
-- This function gives a "raw" value with abitrary upper
-- and lower bounds. Some scaling needs to be done
-- for it to be useful.
-- * day_in_year (optional): The day in the year to calculate with.
--                           Defaults to current day.
local get_distance_from_star_raw = function(day_in_year)
	if not day_in_year then
		day_in_year = hades_seasons.get_day_in_year()
	end
	local a = ORBIT_HORIZONTAL_LENGTH_FROM_CENTER
	local b = ORBIT_VERTICAL_LENGTH_FROM_CENTER
	local e = ORBIT_HORIZONTAL_DISTANCE_OF_FOCAL_POINT

	-- convert day-of-year to angle (0..2pi)
	local alpha = (day_in_year / hades_seasons.YEAR_LENGTH) * (math.pi*2)

	-- ellipsis calculations to get the distance
	local x = a * math.cos(alpha)
	local y = b * math.sin(alpha)
	local distance = math.sqrt(math.pow(x + e, 2) + math.pow(y, 2))
	return distance
end

local MAX_DISTANCE_FROM_STAR = get_distance_from_star_raw(0) -- New Year's
local MIN_DISTANCE_FROM_STAR = get_distance_from_star_raw(hades_seasons.YEAR_LENGTH/2) -- Summer soltice
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

