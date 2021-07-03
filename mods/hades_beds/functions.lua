-- helper functions

function hades_beds.on_rightclick(pos, player)
	hades_beds.set_spawn(player, pos)
end

-- callbacks

minetest.register_on_respawnplayer(function(player)
	local name = player:get_player_name()
	local pos = hades_beds.get_spawn(player)
	if pos then
		player:set_pos(pos)
		return true
	end
end)

minetest.register_on_leaveplayer(function(player)
	local name = player:get_player_name()
	hades_beds.player[name] = nil
end)

