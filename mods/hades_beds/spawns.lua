local S = minetest.get_translator("hades_beds")

function hades_beds.set_spawn(player, pos, silent)
	local name = player:get_player_name()
	player:get_meta():set_string("hades_beds:spawn_pos", minetest.pos_to_string(pos))
	if not silent then
		minetest.sound_play({name="hades_beds_set_spawn"}, {gain=0.5, to_player=name}, true)
		minetest.chat_send_player(name, minetest.colorize("#00FFFF", S("Spawn position set!")))
	end
end

function hades_beds.unset_spawn(player)
	local name = player:get_player_name()
	player:get_meta():set_string("hades_beds:spawn_pos", "")
end

-- Returns the spawn pos of player, or nil if none is set.
function hades_beds.get_spawn(player)
	local s = player:get_meta():get_string("hades_beds:spawn_pos")
	local spos = minetest.string_to_pos(s)
	if spos ~= nil and spos ~= "" then
		return spos
	else
		return nil
	end
end
