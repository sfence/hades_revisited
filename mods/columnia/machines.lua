minetest.register_node("columnia:machine", {
	description = "Columnia Workstation",
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
			meta:set_string("infotext",  "Columnia workstation is empty (owned by " .. (placer:get_player_name() or "") .. ")");
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

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "size[10,10;]"..
			"background[-0.20,-0.25;10.40,11;columnia_background.png]"..
			"list[current_name;ingot;7,5;1,1;]"..
			"list[current_name;res;8,5;1,1;]"..
			"label[7,4.5;Input:]"..
			"label[8,4.5;Output:]"..

			"label[1,0;Basics]"..
			"image_button[1,0.5;1,1;columnia_mach1.png;column_bottom; ]"..
			"image_button[2,0.5;1,1;columnia_mach2.png;column_mid; ]"..
			"image_button[3,0.5;1,1;columnia_mach3.png;column_top; ]"..
			"image_button[4,0.5;1,1;columnia_mach4.png;column_crosslink; ]"..

			"label[1,1.5;Links]"..
			"image_button[1,2;1,1;columnia_mach5.png;column_link; ]"..
			"image_button[2,2;1,1;columnia_mach7.png;column_linkcross; ]"..
			"image_button[3,2;1,1;columnia_mach10.png;column_linkangle; ]"..
			"image_button[4,2;1,1;columnia_mach14.png;column_linktee; ]"..

			"label[1,3;Links with Downs]"..
			"image_button[1,3.5;1,1;columnia_mach6.png;column_linkdown; ]"..
			"image_button[2,3.5;1,1;columnia_mach8.png;column_linkcrossdown; ]"..
			"image_button[3,3.5;1,1;columnia_mach13.png;column_linkangle_down; ]"..
			"image_button[4,3.5;1,1;columnia_mach15.png;column_linktee_down; ]"..
			"image_button[5,3.5;1,1;columnia_mach9.png;column_linkvertical; ]"..

			"label[1,4.5;Stair Substructures]"..
			"image_button[1,5;1,1;columnia_mach11.png;column_stairsub; ]"..
			"image_button[2,5;1,1;columnia_mach12.png;column_stairsubpillar; ]"..

			"list[current_player;main;1,6.25;8,4;]"..

			"tooltip[column_bottom;Column Bottom]"..
			"tooltip[column_mid;Column]"..
			"tooltip[column_top;Column Top]"..
			"tooltip[column_crosslink;Column Crosslink]"..

			"tooltip[column_link;Column Link]"..
			"tooltip[column_linkcross;Column Cross]"..
			"tooltip[column_linkangle;Column Link Cross]"..
			"tooltip[column_linktee;Column Link T-Form]"..

			"tooltip[column_linkdown;Column Link Down]"..
			"tooltip[column_linkcrossdown;Column Cross Down]"..
			"tooltip[column_linkangle_down;Column Link Cross Down]"..
			"tooltip[column_linktee_down;Column Link T-Form Down]"..
			"tooltip[column_linkvertical;Column Link Vertical]"..

			"tooltip[column_stairsub;Stair Substructure]"..
			"tooltip[column_stairsubpillar;Stair Substructure Pillar]"..

			"listring[current_player;main]"..
			"listring[current_name;ingot]"..
			"listring[current_player;main]"..
			"listring[current_name;res]")
		meta:set_string("infotext", "Columnia workstation")
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
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
		{'group:wood', 'default:stone', 'group:wood'},
		{'default:stone', "", 'default:stone'},		
	},
})

