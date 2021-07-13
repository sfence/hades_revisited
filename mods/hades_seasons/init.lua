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

