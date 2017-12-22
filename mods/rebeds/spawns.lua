function rebeds.set_spawn(player, pos)
	local name = player:get_player_name()
	player:set_attribute("rebeds:spawn_pos", minetest.pos_to_string(pos))
	minetest.chat_send_player(name, "Spawn position set!")
end

-- Returns the spawn pos of player, or nil if none is set.
function rebeds.get_spawn(player)
	local s = player:get_attribute("rebeds:spawn_pos")
	local spos = minetest.string_to_pos(s)
	if spos ~= nil and spos ~= "" then
		return spos
	else
		return nil
	end
end
