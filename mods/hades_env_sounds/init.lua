-- Parameters

local radius = 8 -- Node search radius around player

local around_nodes = {
	{ nodes = {"hades_core:water_flowing"}, sound = "env_sounds_water", min_gain = 0.7 },
	{ nodes = {"hades_core:lava_flowing"}, sound = "hades_env_sounds_flowing_lava", min_gain = 0.4 },
	{ nodes = {"hades_core:lava_source"}, sound = "hades_env_sounds_lava_source", min_gain = 1.0 },
}

-- End of parameters

-- Update sound for player

local function update_sound(player)
	local player_name = player:get_player_name()
	local ppos = player:get_pos()
	local areamin = vector.subtract(ppos, radius)
	local areamax = vector.add(ppos, radius)

	for a=1, #around_nodes do
		local nodes = around_nodes[a].nodes
		local wpos, _ = minetest.find_nodes_in_area(areamin, areamax, nodes)
		local total = #wpos
		if total > 0 then
			-- Find average position
			local wposav = vector.new()
			for _, pos in ipairs(wpos) do
				wposav.x = wposav.x + pos.x
				wposav.y = wposav.y + pos.y
				wposav.z = wposav.z + pos.z
			end
			wposav = vector.divide(wposav, total)

			minetest.sound_play(
				around_nodes[a].sound,
				{
					pos = wposav,
					to_player = player_name,
					gain = math.min(0.04 + total * 0.004, around_nodes[a].min_gain),
				},
				false
			)
		end
	end
end


-- Update sound 'on joinplayer'

minetest.register_on_joinplayer(function(player)
	update_sound(player)
end)

minetest.register_on_respawnplayer(function(player)
	minetest.after(0.1, function(player_name)
		local player = minetest.get_player_by_name(player_name)
		if player then
			update_sound(player)
		end
	end, player:get_player_name())
end)


-- Cyclic sound update

local function cyclic_update()
	for _, player in pairs(minetest.get_connected_players()) do
		update_sound(player)
	end
	minetest.after(3.5, cyclic_update)
end

-- Mimimal start delay is required
minetest.after(0, cyclic_update)
