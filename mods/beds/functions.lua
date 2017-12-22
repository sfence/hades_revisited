-- helper functions

function beds.on_rightclick(pos, player)
	beds.set_spawn(player, pos)
end

-- callbacks

minetest.register_on_joinplayer(function(player)
	beds.read_spawns()
end)

minetest.register_on_respawnplayer(function(player)
	local name = player:get_player_name()
	local pos = beds.spawn[name] or nil
	if pos then
		player:setpos(pos)
		return true
	end
end)

minetest.register_on_leaveplayer(function(player)
	beds.player[name] = nil
end)

