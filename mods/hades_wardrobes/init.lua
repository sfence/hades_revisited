local S = minetest.get_translator("hades_wardrobes")

minetest.register_node("hades_wardrobes:wardrobe", {
	description = S("Wardrobe"),
	_tt_help = S("Lets you change your clothes and body"),
	is_ground_content = false,
	paramtype2 = "facedir",
	tiles = {
		{name="default_wood.png", align_style="world"},
		{name="default_wood.png", align_style="world"},
		{name="default_wood.png", align_style="world"},
		{name="default_wood.png", align_style="world"},
		{name="default_wood.png", align_style="world"},
		"wardrobe_wardrobe_front.png"
	},
	sounds = hades_sounds.node_sound_wood_defaults(),
	groups = { choppy = 3, oddly_breakable_by_hand = 2, flammable = 3 },
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		hades_skins.show_skin_editor(player)
		return itemstack
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", S("Wardrobe"))
	end,
	on_rotate = "simple",
})

minetest.register_craft({
	output = "hades_wardrobes:wardrobe",
	recipe = {
		{"group:wood","group:wood","group:wood"},
		{"group:wool","group:wool","group:wool"},
		{"group:wood","group:wood","group:wood"},
	},
})

minetest.register_craft({
	type = "fuel",
	recipe = "hades_wardrobes:wardrobe",
	burntime = 20,
})

