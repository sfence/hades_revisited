--[[
Kerova Mod
By AndromedaKerova (AKA; RommieKerova, Rommie, Andromeda) (rommiekerova@gmail.com)
License: WTFPL
Version: 1.2  - is a reduced version only with colored chests.. code deleted by Glunggi :D
--]]

local chest_formspec = default.chest_formspec
local get_locked_chest_formspec = default.get_locked_chest_formspec

local function has_locked_chest_privilege(meta, player)
	if player:get_player_name() ~= meta:get_string("owner") then
		return false
	end
	return true
end

local chests = {
	{ "white", "White Chest", "White Locked Chest" },
	{ "grey", "Grey Chest", "Grey Locked Chest" },
	{ "dark_grey", "Dark Grey Chest", "Dark Grey Locked Chest" },
	{ "black", "Black Chest", "Black Locked Chest" },
	{ "blue", "Blue Chest", "Blue Locked Chest" },
	{ "cyan", "Cyan Chest", "Cyan Locked Chest" },
	{ "dark_green", "Dark Green Chest", "Dark Green Locked Chest" },
	{ "green", "Green Chest", "Green Locked Chest" },
	{ "magenta", "Magenta Chest", "Magenta Locked Chest" },
	{ "orange", "Orange Chest", "Orange Locked Chest" },
	{ "pink", "Pink Chest", "Pink Locked Chest" },
	{ "red", "Red Chest", "Red Locked Chest" },
	{ "violet", "Violet Chest", "Violet Locked Chest" },
	{ "yellow", "Yellow Chest", "Yellow Locked Chest" },

}

for c=1, #chests do

local sub = chests[c][1]
local desc_unlocked = chests[c][2]
local desc_locked = chests[c][3]

minetest.register_node("kerova:chest_"..sub, {
	description = desc_unlocked,
	tiles = {"kerova_chest_top_"..sub..".png", "kerova_chest_top_"..sub..".png", "kerova_chest_"..sub..".png",
		"kerova_chest_"..sub..".png", "kerova_chest_"..sub..".png", "kerova_chest_front_"..sub..".png"},
	paramtype2 = "facedir",
	groups = {choppy=2,oddly_breakable_by_hand=2, chest=1},
	legacy_facedir_simple = true,
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", chest_formspec)
		meta:set_string("infotext", desc_unlocked)
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in chest at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to chest at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from chest at "..minetest.pos_to_string(pos))
	end,
})
minetest.register_node("kerova:chest_"..sub.."_locked", {
	description = desc_locked,
	tiles = {"kerova_chest_top_"..sub..".png", "kerova_chest_top_"..sub..".png", "kerova_chest_"..sub..".png",
		"kerova_chest_"..sub..".png", "kerova_chest_"..sub..".png", "kerova_chest_lock_"..sub..".png"},
	paramtype2 = "facedir",
	groups = {choppy=2,oddly_breakable_by_hand=2, locked_chest=1},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),

	after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", desc_locked .." (owned by "..
				meta:get_string("owner")..")")
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", desc_locked)
		meta:set_string("owner", "")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main") and has_locked_chest_privilege(meta, player)
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		if not has_locked_chest_privilege(meta, player) then
			return 0
		end
		return count
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if not has_locked_chest_privilege(meta, player) then
			return 0
		end
		return stack:get_count()
	end,
	allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if not has_locked_chest_privilege(meta, player) then
			return 0
		end
		return stack:get_count()
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to locked chest at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from locked chest at "..minetest.pos_to_string(pos))
	end,
	on_rightclick = function(pos, node, clicker)
		local meta = minetest.get_meta(pos)
		if has_locked_chest_privilege(meta, clicker) then
			minetest.show_formspec(
				clicker:get_player_name(),
				"default:chest_locked",
				get_locked_chest_formspec(pos)
			)
		end
	end,
})

minetest.register_craft({
	output = "kerova:chest_"..sub,
	recipe = {
		{"dye:"..sub},
		{"group:chest"},
	}
})
minetest.register_craft({
	output = "kerova:chest_"..sub.."_locked",
	recipe = {
		{"dye:"..sub},
		{"group:locked_chest"},
	}
})

end
