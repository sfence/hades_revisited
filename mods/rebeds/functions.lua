-- helper functions

function rebeds.on_rightclick(pos, player)
	rebeds.set_spawn(player, pos)
end

-- callbacks

minetest.register_on_respawnplayer(function(player)
	local name = player:get_player_name()
	local pos = rebeds.get_spawn(player)
	if pos then
		player:setpos(pos)
		return true
	end
end)

minetest.register_on_leaveplayer(function(player)
	rebeds.player[name] = nil
end)

