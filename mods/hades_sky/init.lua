-- Update sky color. If players not specified update sky for all players.
local update_sky_player = function(player)
	local r = 0xF0
	local g = 0xE3
	local b = 0xB0

	local NISVAL = 0.05 -- Clouds RGB value at night
	local DASVAL = 1 -- Clouds RGB value in daytime
	local difsval = DASVAL - NISVAL
	local sval
	local time = minetest.get_timeofday()
	if time >= 0.5 then
		time = 1 - time
	end
	-- Sky brightness transitions:
	-- First transition (24000 -) 4500, (1 -) 0.1875
	-- Last transition (24000 -) 5750, (1 -) 0.2396
	if time <= 0.1875 then
		sval = NISVAL
	elseif time >= 0.2396 then
		sval = DASVAL
	else
		sval = NISVAL + ((time - 0.1875) / 0.0521) * difsval
	end

	player:set_sky({r=r*sval, g=g*sval, b=b*sval, a=255}, "plain", nil, true)
end

local update_sky = function()
	local players = minetest.get_connected_players()
	for _, player in ipairs(players) do
		update_sky_player(player)
	end
end

local timer = 0
local sky_update_interval = 1
minetest.register_globalstep(function(dtime)
	if #minetest.get_connected_players() == 0 then
		return
	end

	-- Regular updates based on interval
	timer = timer + dtime
	if timer >= sky_update_interval then
		update_sky()
		timer = 0
	end

end)

local init_sky = function(player)
	update_sky_player(player)
	player:set_clouds({color="#FFFF72B8", density=0.7, height=200, thickness=24})
end

minetest.register_on_joinplayer(init_sky)
minetest.register_on_respawnplayer(init_sky)

