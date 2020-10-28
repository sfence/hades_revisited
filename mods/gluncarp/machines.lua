local S = minetest.get_translator("gluncarp")
local F = minetest.formspec_escape

local colors = {
	"black",
	"blue",
	"brown",
	"cyan",
	"dark_green",
	"dark_grey",
	"green",
	"grey",
	"magenta",
	"orange",
	"pink",
	"red",
	"violet",
	"white",
	"yellow",
	"blackgold",
}

minetest.register_node("gluncarp:machine", {
	description = S("Carpet Workstation"),
	_tt_help = S("Turns wool to carpets"),
	tiles = {
		"gluncarp_machine_top.png",
		"gluncarp_machine_bottom.png",
		"gluncarp_machine_side2.png",
		"gluncarp_machine_side1.png",
		"gluncarp_machine_back.png",
		"gluncarp_machine_front.png"
		},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {oddly_breakable_by_hand=2, choppy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, 0.5, -0.375, 0.125}, 
			{-0.5, 0.375, 0.0625, 0.5, 0.4375, 0.125}, 
			{0.4375, -0.375, -0.125, 0.5, 0.375, -0.0625}, 
			{-0.5, -0.375, -0.125, -0.4375, 0.375, -0.0625}, 
			{0.21875, -0.375, -0.03125, 0.28125, 0.5, 0.03125}, 
			{-0.28125, -0.375, -0.03125, -0.21875, 0.5, 0.03125}, 
			{-0.03125, -0.4375, -0.03125, 0.03125, 0.5, 0.03125}, 
			{-0.3125, -0.3125, -0.03125, 0.3125, 0.3125, 0.03125}, 
			{-0.5, -0.5, -0.25, 0.5, -0.4375, 0.25}, 
			{0.4375, -0.4375, 0.0625, 0.5, 0.4375, 0.125}, 
			{-0.5, -0.4375, 0.0625, -0.4375, 0.4375, 0.125}, 
			{-0.5, 0.375, -0.125, 0.5, 0.4375, -0.0625}, 
			{-0.5, 0.375, -0.125, -0.375, 0.4375, 0.125}, 
			{0.375, 0.375, -0.125, 0.5, 0.4375, 0.125}, 
			{0.21875, 0.375, -0.0625, 0.28125, 0.4375, 0.0625}, 
			{-0.03125, 0.375, -0.0625, 0.03125, 0.4375, 0.0625}, 
			{-0.28125, 0.375, -0.0625, -0.21875, 0.4375, 0.0625},
		}
	},
	selection_box = {
		type = 'fixed',
		fixed = {
			{-0.5, -0.5, -0.25, 0.5, 0.5, 0.25} 
		}
	},
	sounds = hades_sounds.node_sound_wood_defaults(),

	after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos);
		meta:set_string("owner",  (placer:get_player_name() or ""));
		meta:set_string("infotext",  S("Carpet workstation (owned by @1)", placer:get_player_name() or ""));
	end,

	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		if not inv:is_empty("wool") then
			return false
		elseif not inv:is_empty("res") then
			return false
		end
		return true
	end,

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "size[10,6;]"..
			"bgcolor[#00000000;neither]"..
			"background9[6,6;10,6;gluncarp_background.png;true;6]"..
			"list[current_name;wool;3,0.5;1,1;]"..
			"list[current_name;res;6,0.5;1,1;]"..
			"label[3,0;"..F(S("Wool:")).."]"..
			"label[6,0;"..F(S("Output:")).."]"..

			"label[4.5,0;"..F(S("Craft:")).."]"..
			"image_button[4.5,0.5;1,1;gluncarp_mach1.png;carpet; ]"..

			"list[current_player;main;1,2;8,4;]"..
			"listring[current_player;main]"..
			"listring[current_name;wool]"..
			"listring[current_player;main]"..
			"listring[current_name;res]")
		meta:set_string("infotext", S("Carpet workstation"))
		local inv = meta:get_inventory()
		inv:set_size("wool", 1)
		inv:set_size("res", 1)
	end,

	on_receive_fields = function(pos, formname, fields, sender)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()

		if not fields["carpet"] then
			return
		end

		local count, material
		if fields["carpet"] then
			if inv:is_empty("wool") then
				return
			end
		end

		local woolstack = inv:get_stack("wool", 1)
		local woolname = woolstack:get_name()
		local resstack = inv:get_stack("res", 1)
----------------------------------------------------------------------
--Register Items
----------------------------------------------------------------------
		for col=1,#colors do
			local color = colors[col]
			if woolname == "wool:"..color then
				material = color
				count = 4
			elseif woolname == "gluncarp:wool_"..color then
				material = color
				count = 4
			elseif woolname == "stairs:slab_"..color then
				material = color
				count = 2
			elseif woolname == "stairs:stair_"..color then
				material = color
				count = 3
			elseif woolname == "stairs:stair_in_"..color then
				material = color
				count = 4
			elseif woolname == "stairs:stair_out_"..color then
				material = color
				count = 4
			end
		end
----------------------------------------------------------------------
		if material then
			local output_item = "gluncarp:"..material
			if not inv:is_empty("res") then
				if resstack:get_name() ~= output_item then
					return
				elseif resstack:get_count() == resstack:get_stack_max() then
					return
				end
			end
			local success = false
			for i = 0, count-1 do
				local result = inv:add_item("res", output_item)
				if result ~= nil then
					success = true
				end
			end
			if success then
				woolstack:take_item()
				inv:set_stack("wool", 1, woolstack)
			end
		end            
	end,

})

--Craft

minetest.register_craft({
	output = 'gluncarp:machine',
	recipe = {
		{'group:wood', 'group:stick', 'group:wood'},
		{'farming:string', 'farming:string', 'farming:string'},
		{'group:wood', "group:stick", 'group:wood'},
	},
})

