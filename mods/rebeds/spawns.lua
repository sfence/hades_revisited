local S = minetest.get_translator("rebeds")

function rebeds.set_spawn(player, pos)
	local name = player:get_player_name()
	player:get_meta():set_string("rebeds:spawn_pos", minetest.pos_to_string(pos))
	minetest.chat_send_player(name, S("Spawn position set!"))
end

-- Returns the spawn pos of player, or nil if none is set.
function rebeds.get_spawn(player)
	local s = player:get_meta():get_string("rebeds:spawn_pos")
	local spos = minetest.string_to_pos(s)
	if spos ~= nil and spos ~= "" then
		return spos
	else
		return nil
	end
end
