local S = minetest.get_translator("columnia")
local F = minetest.formspec_escape

local STEREOTYPE = "hades_core_marble" -- example node to use for item image

minetest.register_node("columnia:machine", {
	description = S("Columnia Workstation"),
	_tt_help = S("Turns blocks to columns and more"),
	tiles = {
		"columnia_machine_top.png",
		"columnia_machine_bottom.png",
		"columnia_machine_side2.png",
		"columnia_machine_side1.png",
		"columnia_machine_back.png",
		"columnia_machine_front.png"
		},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy=3, cracky=3, oddly_breakable_by_hand=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.1875, -0.5, 0.5, -0.0625, 0.5},
			{-0.125, 0.0625, -0.125, 0.125, 0.5, 0.125},
			{-0.25, 0, -0.25, 0.25, 0.125, 0.25},
			{-0.4375, -0.5, -0.4375, -0.3125, -0.1875, -0.3125},
			{-0.4375, -0.5, 0.3125, -0.3125, -0.1875, 0.4375},
			{0.3125, -0.5, -0.4375, 0.4375, -0.1875, -0.3125},
			{0.3125, -0.5, 0.3125, 0.4375, -0.1875, 0.4375},
			{-0.1875, 0.125, -0.1875, 0.1875, 0.1875, 0.1875},
			{-0.1875, -0.0625, -0.3125, -0.125, 0, 0.3125},
			{0.125, -0.0625, -0.3125, 0.1875, 0, 0.3125},
			{-0.4375, -0.0625, -0.4375, -0.375, 0, -0.0625},
			{-0.375, -0.0625, -0.4375, -0.1875, 0, -0.375}, 
			{0.28125, -0.0625, 0.3125, 0.46875, 0.0625, 0.4375}, 
			{0.34375, -0.0625, -0.0625, 0.40625, 0, 0.4375},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.0625, 0.5}
	},
	sounds = hades_sounds.node_sound_wood_defaults(),

	after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos);
		meta:set_string("owner",  (placer:get_player_name() or ""));
		local pname = placer:get_player_name()
		if pname then
			meta:set_string("infotext",  S("Columnia workstation (owned by @1)", pname))
		else
			meta:set_string("infotext",  S("Columnia workstation"))
		end
	end,

	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		if not inv:is_empty("ingot") then
			return false
		elseif not inv:is_empty("res") then
			return false
		end
		return true
	end,

	on_rotate = "simple",

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "size[10,10;]"..
			"bgcolor[#00000000;neither]"..
			"background9[6,6;10,10;columnia_background.png;true;6]"..
			"list[current_name;ingot;7,5;1,1;]"..
			"list[current_name;res;8,5;1,1;]"..
			"label[7,4.5;"..F(S("Input:")).."]"..
			"label[8,4.5;"..F(S("Output:")).."]"..

			"label[1,0;"..F(S("Basics")).."]"..
			"item_image_button[1,0.5;1,1;columnia:column_bottom_"..STEREOTYPE..";column_bottom;]"..
			"item_image_button[2,0.5;1,1;columnia:column_mid_"..STEREOTYPE..";column_mid;]"..
			"item_image_button[3,0.5;1,1;columnia:column_top_"..STEREOTYPE..";column_top;]"..
			"item_image_button[4,0.5;1,1;columnia:column_crosslink_"..STEREOTYPE..";column_crosslink;]"..

			"label[1,1.5;"..F(S("Links")).."]"..
			"item_image_button[1,2;1,1;columnia:column_link_"..STEREOTYPE.." 2;column_link;]"..
			"item_image_button[2,2;1,1;columnia:column_linkcross_"..STEREOTYPE.." 2;column_linkcross;]"..
			"item_image_button[3,2;1,1;columnia:column_linkangle_"..STEREOTYPE.." 2;column_linkangle;]"..
			"item_image_button[4,2;1,1;columnia:column_linktee_"..STEREOTYPE.." 2;column_linktee;]"..

			"label[1,3;"..F(S("Links with Downs")).."]"..
			"item_image_button[1,3.5;1,1;columnia:column_linkdown_"..STEREOTYPE.." 2;column_linkdown;]"..
			"item_image_button[2,3.5;1,1;columnia:column_linkcrossdown_"..STEREOTYPE.." 2;column_linkcrossdown;]"..
			"item_image_button[3,3.5;1,1;columnia:column_linkangle_down_"..STEREOTYPE.." 2;column_linkangle_down;]"..
			"item_image_button[4,3.5;1,1;columnia:column_linktee_down_"..STEREOTYPE.." 2;column_linktee_down;]"..
			"item_image_button[5,3.5;1,1;columnia:column_linkvertical_"..STEREOTYPE.." 4;column_linkvertical;]"..

			"label[1,4.5;"..F(S("Stair Substructures")).."]"..
			"item_image_button[1,5;1,1;columnia:column_stairsub_"..STEREOTYPE..";column_stairsub;]"..
			"item_image_button[2,5;1,1;columnia:column_stairsubpillar_"..STEREOTYPE..";column_stairsubpillar;]"..

			"list[current_player;main;1,6.25;8,4;]"..

			"tooltip[column_bottom;"..F(S("Column Bottom")).."]"..
			"tooltip[column_mid;"..F(S("Column")).."]"..
			"tooltip[column_top;"..F(S("Column Top")).."]"..
			"tooltip[column_crosslink;"..F(S("Column Crosslink")).."]"..

			"tooltip[column_link;"..F(S("Column Link")).."]"..
			"tooltip[column_linkcross;"..F(S("Column Cross")).."]"..
			"tooltip[column_linkangle;"..F(S("Column Link Cross")).."]"..
			"tooltip[column_linktee;"..F(S("Column Link T-Form")).."]"..

			"tooltip[column_linkdown;"..F(S("Column Link Down")).."]"..
			"tooltip[column_linkcrossdown;"..F(S("Column Cross Down")).."]"..
			"tooltip[column_linkangle_down;"..F(S("Column Link Cross Down")).."]"..
			"tooltip[column_linktee_down;"..F(S("Column Link T-Form Down")).."]"..
			"tooltip[column_linkvertical;"..F(S("Column Link Vertical")).."]"..

			"tooltip[column_stairsub;"..F(S("Stair Substructure")).."]"..
			"tooltip[column_stairsubpillar;"..F(S("Stair Substructure Pillar")).."]"..

			"listring[current_player;main]"..
			"listring[current_name;ingot]"..
			"listring[current_player;main]"..
			"listring[current_name;res]")
		meta:set_string("infotext", S("Columnia workstation"))
		local inv = meta:get_inventory()
		inv:set_size("ingot", 1)
		inv:set_size("res", 1)
	end,

	on_receive_fields = function(pos, formname, fields, sender)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()

-----------------------------
if fields["column_bottom"] 
or fields["column_mid"]
or fields["column_top"]
or fields["column_crosslink"]
or fields["column_link"]
or fields["column_linkdown"]
or fields["column_linkcross"]
or fields["column_linkcrossdown"]
or fields["column_linkvertical"]
or fields["column_linkangle"]
or fields["column_linkangle_down"]
or fields["column_linktee"]
or fields["column_linktee_down"]
or fields["column_stairsub"]
or fields["column_stairsubpillar"]
then

--Crown Mould-----------------------------------------

	local material, shape
	local make_ok = false
	local anzahl

	if inv:is_empty("ingot") then
		return
	end

	if fields["column_bottom"] then
		anzahl = 1
		shape = "columnia:column_bottom_"
	end

	if fields["column_mid"] then
		make_ok = false
		anzahl = 1
		shape = "columnia:column_mid_"
	end

	if fields["column_top"] then
		anzahl = 1
		shape = "columnia:column_top_"
	end

	if fields["column_crosslink"] then
		make_ok = false
		anzahl = 1
		shape = "columnia:column_crosslink_"
	end

	if fields["column_link"] then
		anzahl = 2
		shape = "columnia:column_link_"
	end

	if fields["column_linkdown"] then
		anzahl = 2
		shape = "columnia:column_linkdown_"
	end

	if fields["column_linkcross"] then
		anzahl = 2
		shape = "columnia:column_linkcross_"
	end

	if fields["column_linkcrossdown"] then
		anzahl = 2
		shape = "columnia:column_linkcrossdown_"
	end

	if fields["column_linkvertical"] then
		anzahl = 4
		shape = "columnia:column_linkvertical_"
	end

	if fields["column_linkangle"] then
		anzahl = 2
		shape = "columnia:column_linkangle_"
	end

	if fields["column_linkangle_down"] then
		anzahl = 2
		shape = "columnia:column_linkangle_down_"
	end

	if fields["column_linktee"] then
		anzahl = 2
		shape = "columnia:column_linktee_"
	end

	if fields["column_linktee_down"] then
		anzahl = 2
		shape = "columnia:column_linktee_down_"
	end

	if fields["column_stairsub"] then
		anzahl = 1
		shape = "columnia:column_stairsub_"
	end

	if fields["column_stairsubpillar"] then
		anzahl = 1
		shape = "columnia:column_stairsubpillar_"
	end

	local ingotstack = inv:get_stack("ingot", 1)
	local resstack = inv:get_stack("res", 1)

----------------------------------------------------------------------
--Register Items
----------------------------------------------------------------------

	if columnia.registered_materials[ingotstack:get_name()] then
		material = columnia.registered_materials[ingotstack:get_name()]
		make_ok = true
	end

	if make_ok == true then
		local output_item = shape..material
		if not inv:is_empty("res") and resstack:get_name() ~= output_item then
			return
		end

		local success = false
		for i = 0, anzahl-1 do
			local result = inv:add_item("res", output_item)
			if result ~= nil then
				success = true
			end
		end
		if success then
			ingotstack:take_item()
			inv:set_stack("ingot", 1, ingotstack)
		end
	end
end
end

})

--Craft

minetest.register_craft({
	output = 'columnia:machine',
	recipe = {
		{'hades_core:steel_ingot', 'hades_core:steel_ingot', 'hades_core:steel_ingot'},
		{'group:wood', 'hades_core:stone', 'group:wood'},
		{'hades_core:stone', "", 'hades_core:stone'},		
	},
})

