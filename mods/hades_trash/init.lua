local S = minetest.get_translator("hades_trash")
local F = minetest.formspec_escape

--Node registration
minetest.register_node("hades_trash:trash_can_plastic",{
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2},
	tiles = {"hades_trash_trash_can_plastic_top.png", "hades_trash_trash_can_plastic_top.png", "hades_trash_trash_can_plastic.png"},
	description = S("Trash Can"),
	_tt_help = S("Lets you get rid of unwanted items"),
	drawtype="nodebox",
	paramtype = "light",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125,-0.5, 0.3125,  0.3125, 0.5,   0.375},
			{ 0.3125,-0.5,-0.375,   0.375,  0.5,   0.375},
			{-0.3125,-0.5,-0.375,   0.3125, 0.5,  -0.3125},
			{-0.375, -0.5,-0.375,  -0.3125, 0.5,   0.375},
			{-0.3125,-0.5,-0.3125,  0.3125,-0.4375,0.3125},
                }
        },
        on_construct = function(pos)
		local meta = minetest.get_meta(pos)
			meta:set_string("formspec",
				"size[10,9]"..
				"button[4,0;2,1;empty;"..F(S("Empty Trash")).."]"..
                                "list[current_name;main;4,1;2,3;]"..
                                "list[current_player;main;0,5;10,4;]"..
				"listring[]"..
				"background9[18,17;8,9;hades_trash_trash_can_inventory.png;true;18,17,-22,-17]")
                meta:set_string("infotext", S("Trash Can"))
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	-- Intentionally no 'can_dig' function. If you dig this node, items in trash are gone.
        on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
			" moves stuff in trash can at "..minetest.pos_to_string(pos))
	end,
        on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
			" moves stuff to trash can at "..minetest.pos_to_string(pos))
	end,
        on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
			" takes stuff from trash can at "..minetest.pos_to_string(pos))
        end,
	on_receive_fields = function(pos, formname, fields, sender)
		if fields.empty then
		local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			for i = 1, inv:get_size("main") do
				inv:set_stack("main", i, nil)
			end
			local player_name = sender:get_player_name()
			minetest.sound_play("hades_trash_empty", {to_player=player_name, gain = 1.0}, true)
		end
        end,
	sounds = hades_sounds.node_sound_defaults(),
})

--Crafting

minetest.register_craft({
	output = 'hades_trash:trash_can_plastic',
	recipe = {
		{'hades_materials:plastic_base', '', 'hades_materials:plastic_base'},
		{'hades_materials:plastic_base', '', 'hades_materials:plastic_base'},
		{'hades_materials:plastic_base', 'hades_materials:plastic_base', 'hades_materials:plastic_base'},
	}
})

