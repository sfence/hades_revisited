local chest_formspec =
	"size[8,9]"..
	"list[current_name;main;0,0;8,4;]"..
	"list[current_player;main;0,5;8,4;]"..
	"listring[]"..
	"background[-0.5,-0.65;9,10.35;".."hades_chests_chestui.png".."]"

local function get_locked_chest_formspec(pos)
	local spos = pos.x .. "," .. pos.y .. "," ..pos.z
	local formspec =
		"size[8,9]"..
		"list[nodemeta:".. spos .. ";main;0,0;8,4;]"..
		"list[current_player;main;0,5;8,4;]"..
		"listring[]"..
		"background[-0.5,-0.65;9,10.35;".."hades_chests_chestui.png".."]"
	return formspec
end

local function has_locked_chest_privilege(meta, player)
	if player:get_player_name() ~= meta:get_string("owner") then
		return false
	end
	return true
end

local chests = {
	{ "", "Chest", "Locked Chest" },
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
local tiles_unlocked, tiles_locked
local itemstring_unlocked, itemstring_locked
if sub == "" then
	itemstring_unlocked = "hades_chests:chest"
	itemstring_locked = "hades_chests:chest_locked"
	tiles_unlocked = {"default_chest_top.png", "default_chest_top.png", "default_chest_side.png",
		"default_chest_side.png", "default_chest_side.png", "default_chest_front.png"}
	tiles_locked = {"default_chest_top.png", "default_chest_top.png", "default_chest_side.png",
		"default_chest_side.png", "default_chest_side.png", "default_chest_lock.png"}
else
	itemstring_unlocked = "hades_chests:chest_"..sub
	itemstring_locked = "hades_chests:chest_"..sub.."_locked"
	tiles_unlocked = {"kerova_chest_top_"..sub..".png", "kerova_chest_top_"..sub..".png", "kerova_chest_"..sub..".png",
		"kerova_chest_"..sub..".png", "kerova_chest_"..sub..".png", "kerova_chest_front_"..sub..".png"}
	tiles_locked = {"kerova_chest_top_"..sub..".png", "kerova_chest_top_"..sub..".png", "kerova_chest_"..sub..".png",
		"kerova_chest_"..sub..".png", "kerova_chest_"..sub..".png", "kerova_chest_lock_"..sub..".png"}
end


minetest.register_node(itemstring_unlocked, {
	description = desc_unlocked,
	tiles = tiles_unlocked,
	paramtype2 = "facedir",
	groups = {choppy=2,oddly_breakable_by_hand=2, chest=1, unlocked_chest=1},
	legacy_facedir_simple = true,
	sounds = hades_sounds.node_sound_wood_defaults(),
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
minetest.register_node(itemstring_locked, {
	description = desc_locked,
	tiles = tiles_locked,
	paramtype2 = "facedir",
	groups = {choppy=2,oddly_breakable_by_hand=2, chest=2, locked_chest=1},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = hades_sounds.node_sound_wood_defaults(),

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
				"hades_chests:chest_locked",
				get_locked_chest_formspec(pos)
			)
		end
	end,
})

if sub ~= "" then
	minetest.register_craft({
		type = "shapeless",
		output = itemstring_unlocked,
		recipe = { "group:unlocked_chest", "dye:"..sub },
	})
	minetest.register_craft({
		type = "shapeless",
		output = itemstring_locked,
		recipe = { itemstring_unlocked, "default:steel_ingot" },
	})
	minetest.register_craft({
		type = "shapeless",
		output = itemstring_locked,
		recipe = { "group:locked_chest", "dye:"..sub },
	})
	minetest.register_craft({
		output = itemstring_unlocked,
		recipe = {
			{'hades_trees:colwood_'..sub, 'hades_trees:colwood_'..sub, 'hades_trees:colwood_'..sub},
			{'hades_trees:colwood_'..sub, '', 'hades_trees:colwood_'..sub},
			{'hades_trees:colwood_'..sub, 'hades_trees:colwood_'..sub, 'hades_trees:colwood_'..sub},
		}
	})
	minetest.register_craft({
		output = itemstring_locked,
		recipe = {
			{'hades_trees:colwood_'..sub, 'hades_trees:colwood_'..sub, 'hades_trees:colwood_'..sub},
			{'hades_trees:colwood_'..sub, 'default:steel_ingot', 'hades_trees:colwood_'..sub},
			{'hades_trees:colwood_'..sub, 'hades_trees:colwood_'..sub, 'hades_trees:colwood_'..sub},
		}
	})
end

end

minetest.register_craft({
	output = 'hades_chests:chest',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', '', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

minetest.register_craft({
	type = "shapeless",
	output = 'hades_chests:chest_locked',
	recipe = {"hades_chests:chest", "default:steel_ingot"},
})
minetest.register_craft({
	output = 'hades_chests:chest_locked',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', 'default:steel_ingot', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "group:chest",
	burntime = 20,
})
