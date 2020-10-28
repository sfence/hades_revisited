local S = minetest.get_translator("simple_bushes")

-- See README.txt for licensing and other information.

-- nodes and crafting
minetest.register_node("simple_bushes:green", {
	description = S("Green Bush"),
	drawtype = "plantlike",
	visual_scale = 1.6,
	tiles = { "simple_bushes_green.png" },
	inventory_image = "simple_bushes_green.png",
	wield_image = "simple_bushes_green.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	groups = {snappy=3,flammable=2,simple_bush=1,attached_node=1,color_green=1},
	sounds = hades_sounds.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.325, -0.5, -0.325, 0.325, 0.5, 0.325},
	},
})

minetest.register_craft({
	output = 'simple_bushes:green',
	recipe = {
		{'group:leaves', '', ''},
		{'group:stick', '', ''},
		{'hades_core:dirt', '', ''},
	}
})

minetest.register_node("simple_bushes:white", {
	description = S("White Bush"),
	drawtype = "plantlike",
	visual_scale = 1.6,
	tiles = { "simple_bushes_white.png" },
	inventory_image = "simple_bushes_white.png",
	wield_image = "simple_bushes_white.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	groups = {snappy=3,flammable=2,simple_bush=1,attached_node=1,color_white=1},
	sounds = hades_sounds.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.325, -0.5, -0.325, 0.325, 0.5, 0.325},
	},
})

minetest.register_craft({
	output = 'simple_bushes:white',
	recipe = {
		{'flowers:dandelion_white', '', ''},
		{'simple_bushes:green', '', ''},
		{'hades_core:dirt', '', ''},
	}
})

minetest.register_node("simple_bushes:yellow", {
	description = S("Yellow Bush"),
	drawtype = "plantlike",
	visual_scale = 1.6,
	tiles = { "simple_bushes_yellow.png" },
	inventory_image = "simple_bushes_yellow.png",
	wield_image = "simple_bushes_yellow.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	groups = {snappy=3,flammable=2,simple_bush=1,attached_node=1,color_yellow=1},
	sounds = hades_sounds.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.325, -0.5, -0.325, 0.325, 0.5, 0.325},
	},
})

minetest.register_craft({
	output = 'simple_bushes:yellow',
	recipe = {
		{'flowers:dandelion_yellow', '', ''},
		{'simple_bushes:green', '', ''},
		{'hades_core:dirt', '', ''},
	}
})

minetest.register_node("simple_bushes:blue", {
	description = S("Blue Bush"),
	drawtype = "plantlike",
	visual_scale = 1.6,
	tiles = { "simple_bushes_blue.png" },
	inventory_image = "simple_bushes_blue.png",
	wield_image = "simple_bushes_blue.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	groups = {snappy=3,flammable=2,simple_bush=1,attached_node=1,color_blue=1},
	sounds = hades_sounds.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.325, -0.5, -0.325, 0.325, 0.5, 0.325},
	},
})

minetest.register_craft({
	output = 'simple_bushes:blue',
	recipe = {
		{'flowers:geranium', '', ''},
		{'simple_bushes:green', '', ''},
		{'hades_core:dirt', '', ''},
	}
})

minetest.register_node("simple_bushes:red", {
	description = S("Red Bush"),
	drawtype = "plantlike",
	visual_scale = 1.6,
	tiles = { "simple_bushes_red.png" },
	inventory_image = "simple_bushes_red.png",
	wield_image = "simple_bushes_red.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	groups = {snappy=3,flammable=2,simple_bush=1,attached_node=1,color_red=1},
	sounds = hades_sounds.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.325, -0.5, -0.325, 0.325, 0.5, 0.325},
	},
})

minetest.register_craft({
	output = 'simple_bushes:red',
	recipe = {
		{'flowers:rose', '', ''},
		{'simple_bushes:green', '', ''},
		{'hades_core:dirt', '', ''},
	}
})

minetest.register_node("simple_bushes:orange", {
	description = S("Orange Bush"),
	drawtype = "plantlike",
	visual_scale = 1.6,
	tiles = { "simple_bushes_orange.png" },
	inventory_image = "simple_bushes_orange.png",
	wield_image = "simple_bushes_orange.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	groups = {snappy=3,flammable=2,simple_bush=1,attached_node=1,color_orange=1},
	sounds = hades_sounds.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.325, -0.5, -0.325, 0.325, 0.5, 0.325},
	},
})

minetest.register_craft({
	output = 'simple_bushes:orange',
	recipe = {
		{'flowers:tulip', '', ''},
		{'simple_bushes:green', '', ''},
		{'hades_core:dirt', '', ''},
	}
})


minetest.register_node("simple_bushes:violet", {
	description = S("Violet Bush"),
	drawtype = "plantlike",
	visual_scale = 1.6,
	tiles = { "simple_bushes_violet.png" },
	inventory_image = "simple_bushes_violet.png",
	wield_image = "simple_bushes_violet.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	groups = {snappy=3,flammable=2,simple_bush=1,attached_node=1,color_violet=1},
	sounds = hades_sounds.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.325, -0.5, -0.325, 0.325, 0.5, 0.325},
	},
})

minetest.register_craft({
	output = 'simple_bushes:violet',
	recipe = {
		{'flowers:viola', '', ''},
		{'simple_bushes:green', '', ''},
		{'hades_core:dirt', '', ''},
	}
})

minetest.register_node("simple_bushes:plant_pot",
		{description = S("Plant Pot"),
		paramtype = "light",
		tiles = {"simple_bushes_plant_pot_top.png", "simple_bushes_plant_pot_bottom.png", "simple_bushes_plant_pot_sides.png"},
		is_ground_content = false,
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.35,-0.5,-0.4,0.35,0.5,0.4},
				{-0.4,-0.5,-0.35, 0.4,0.5,0.35},
				{-0.25,-0.5,-0.45,0.25,0.5,0.45},
				{-0.45,-0.5,-0.25, 0.45,0.5,0.25},
				{-0.15,-0.5,-0.5,0.15,0.5,0.5},
				{-0.5,-0.5,-0.15, 0.5,0.5,0.15},
			},
		},
		groups = {snappy=3},
		sounds = hades_sounds.node_sound_wood_defaults(),
	})

minetest.register_craft({ output = "simple_bushes:plant_pot", recipe = {
	{"hades_core:clay_brick", "", "hades_core:clay_brick"},
	{"hades_core:clay_brick", "hades_core:dirt", "hades_core:clay_brick"},
	{"hades_core:clay_brick", "hades_core:clay_brick", "hades_core:clay_brick"} } })
