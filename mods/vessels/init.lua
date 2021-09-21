local S = minetest.get_translator("vessels")

-- Minetest 0.4 mod: vessels
-- See README.txt for licensing and other information.

minetest.register_node("vessels:glass_bottle", {
	description = S("Empty Glass Bottle"),
	drawtype = "plantlike",
	tiles = {"vessels_glass_bottle.png"},
	inventory_image = "vessels_glass_bottle_inv.png",
	wield_image = "vessels_glass_bottle.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	floodable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1},
	sounds = hades_sounds.node_sound_glass_defaults(),
})

minetest.register_craft( {
	output = "vessels:glass_bottle 10",
	recipe = {
		{ "hades_core:glass", "", "hades_core:glass" },
		{ "hades_core:glass", "", "hades_core:glass" },
		{ "", "hades_core:glass", "" }
	}
})

minetest.register_node("vessels:drinking_glass", {
	description = S("Empty Drinking Glass"),
	drawtype = "plantlike",
	tiles = {"vessels_drinking_glass.png"},
	inventory_image = "vessels_drinking_glass_inv.png",
	wield_image = "vessels_drinking_glass.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	floodable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1},
	sounds = hades_sounds.node_sound_glass_defaults(),
})

minetest.register_craft( {
	output = "vessels:drinking_glass 14",
	recipe = {
		{ "hades_core:glass", "", "hades_core:glass" },
		{ "hades_core:glass", "", "hades_core:glass" },
		{ "hades_core:glass", "hades_core:glass", "hades_core:glass" }
	}
})

minetest.register_node("vessels:steel_bottle", {
	description = S("Empty Heavy Steel Bottle"),
	drawtype = "plantlike",
	tiles = {"vessels_steel_bottle.png"},
	inventory_image = "vessels_steel_bottle_inv.png",
	wield_image = "vessels_steel_bottle.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	floodable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1},
	sounds = hades_sounds.node_sound_defaults(),
})

minetest.register_craft( {
	output = "vessels:steel_bottle 5",
	recipe = {
		{ "hades_core:steel_ingot", "", "hades_core:steel_ingot" },
		{ "hades_core:steel_ingot", "", "hades_core:steel_ingot" },
		{ "", "hades_core:steel_ingot", "" }
	}
})


-- Make sure we can recycle them

minetest.register_craftitem("vessels:glass_fragments", {
	description = S("Pile of Glass Fragments"),
	inventory_image = "vessels_glass_fragments.png",
})

minetest.register_craft( {
	type = "shapeless",
	output = "vessels:glass_fragments",
	recipe = {
		"vessels:glass_bottle",
		"vessels:glass_bottle",
	},
})

minetest.register_craft( {
	type = "shapeless",
	output = "vessels:glass_fragments",
	recipe = {
		"vessels:drinking_glass",
		"vessels:drinking_glass",
	},
})

minetest.register_craft({
	output = "vessels:glass_fragments 6",
	recipe = {{"doors:door_glass"}},
})

minetest.register_craft({
	type = "cooking",
	output = "hades_core:glass",
	recipe = "vessels:glass_fragments",
})

minetest.register_craft( {
	type = "cooking",
	output = "hades_core:steel_ingot",
	recipe = "vessels:steel_bottle",
})

