local S = minetest.get_translator("hades_bushes")

-- See README.txt for licensing and other information.

minetest.register_node("hades_bushes:branch_bush", {
	description = S("Branch Bush"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"hades_bushes_branch.png"},
	inventory_image = "hades_bushes_branch_inv.png",
	wield_image = "hades_bushes_branch.png",
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 4,
	waving = 1,
	walkable = false,
	is_ground_content = true,
	buildable_to = true,
	floodable = true,
	groups = {snappy=3,flammable=3,attached_node=1},
	sounds = hades_sounds.node_sound_bush_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6/16, -0.5, -6/16, 6/16, 4/16, 6/16},
	},
})

minetest.register_craft({
	output = 'hades_bushes:branch_bush',
	recipe = {
		{'hades_core:stick'},
		{'hades_core:stick'},
		{'hades_core:volcanic_sand'},
	},
})

-- Old oringal Minetest Hades bushes
minetest.register_node("hades_bushes:green", {
	description = S("Green Bush"),
	drawtype = "plantlike",
	visual_scale = 1.6,
	_hades_itemshow_scale = 1.2,
	tiles = { "hades_bushes_green.png" },
	inventory_image = "hades_bushes_green.png",
	wield_image = "hades_bushes_green.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	floodable = true,
	groups = {snappy=3,choppy=3,flammable=2,simple_bush=1,attached_node=1,color_green=1},
	sounds = hades_sounds.node_sound_bush_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.325, -0.5, -0.325, 0.325, 0.5, 0.325},
	},
})

minetest.register_craft({
	output = 'hades_bushes:green',
	recipe = {
		{'group:leaves', '', ''},
		{'group:stick', '', ''},
		{'hades_core:dirt', '', ''},
	}
})

minetest.register_node("hades_bushes:white", {
	description = S("White Bush"),
	drawtype = "plantlike",
	visual_scale = 1.6,
	_hades_itemshow_scale = 1.2,
	tiles = { "hades_bushes_white.png" },
	inventory_image = "hades_bushes_white.png",
	wield_image = "hades_bushes_white.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	floodable = true,
	groups = {snappy=3,choppy=3,flammable=2,simple_bush=1,attached_node=1,color_white=1},
	sounds = hades_sounds.node_sound_bush_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.325, -0.5, -0.325, 0.325, 0.5, 0.325},
	},
})

minetest.register_craft({
	output = 'hades_bushes:white',
	recipe = {
		{'hades_flowers:white', '', ''},
		{'hades_bushes:green', '', ''},
		{'hades_core:dirt', '', ''},
	}
})

minetest.register_node("hades_bushes:yellow", {
	description = S("Yellow Bush"),
	drawtype = "plantlike",
	visual_scale = 1.6,
	_hades_itemshow_scale = 1.2,
	tiles = { "hades_bushes_yellow.png" },
	inventory_image = "hades_bushes_yellow.png",
	wield_image = "hades_bushes_yellow.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	floodable = true,
	groups = {snappy=3,choppy=3,flammable=2,simple_bush=1,attached_node=1,color_yellow=1},
	sounds = hades_sounds.node_sound_bush_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.325, -0.5, -0.325, 0.325, 0.5, 0.325},
	},
})

minetest.register_craft({
	output = 'hades_bushes:yellow',
	recipe = {
		{'hades_flowers:yellow', '', ''},
		{'hades_bushes:green', '', ''},
		{'hades_core:dirt', '', ''},
	}
})

minetest.register_node("hades_bushes:blue", {
	description = S("Blue Bush"),
	drawtype = "plantlike",
	visual_scale = 1.6,
	_hades_itemshow_scale = 1.2,
	tiles = { "hades_bushes_blue.png" },
	inventory_image = "hades_bushes_blue.png",
	wield_image = "hades_bushes_blue.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	floodable = true,
	groups = {snappy=3,choppy=3,flammable=2,simple_bush=1,attached_node=1,color_blue=1},
	sounds = hades_sounds.node_sound_bush_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.325, -0.5, -0.325, 0.325, 0.5, 0.325},
	},
})

minetest.register_craft({
	output = 'hades_bushes:blue',
	recipe = {
		{'hades_flowers:blue', '', ''},
		{'hades_bushes:green', '', ''},
		{'hades_core:dirt', '', ''},
	}
})

minetest.register_node("hades_bushes:red", {
	description = S("Red Bush"),
	drawtype = "plantlike",
	visual_scale = 1.6,
	_hades_itemshow_scale = 1.2,
	tiles = { "hades_bushes_red.png" },
	inventory_image = "hades_bushes_red.png",
	wield_image = "hades_bushes_red.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	floodable = true,
	groups = {snappy=3,choppy=3,flammable=2,simple_bush=1,attached_node=1,color_red=1},
	sounds = hades_sounds.node_sound_bush_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.325, -0.5, -0.325, 0.325, 0.5, 0.325},
	},
})

minetest.register_craft({
	output = 'hades_bushes:red',
	recipe = {
		{'hades_flowers:red', '', ''},
		{'hades_bushes:green', '', ''},
		{'hades_core:dirt', '', ''},
	}
})

minetest.register_node("hades_bushes:orange", {
	description = S("Orange Bush"),
	drawtype = "plantlike",
	visual_scale = 1.6,
	_hades_itemshow_scale = 1.2,
	tiles = { "hades_bushes_orange.png" },
	inventory_image = "hades_bushes_orange.png",
	wield_image = "hades_bushes_orange.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	floodable = true,
	groups = {snappy=3,choppy=3,flammable=2,simple_bush=1,attached_node=1,color_orange=1},
	sounds = hades_sounds.node_sound_bush_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.325, -0.5, -0.325, 0.325, 0.5, 0.325},
	},
})

minetest.register_craft({
	output = 'hades_bushes:orange',
	recipe = {
		{'hades_flowers:orange', '', ''},
		{'hades_bushes:green', '', ''},
		{'hades_core:dirt', '', ''},
	}
})


minetest.register_node("hades_bushes:violet", {
	description = S("Violet Bush"),
	drawtype = "plantlike",
	visual_scale = 1.6,
	_hades_itemshow_scale = 1.2,
	tiles = { "hades_bushes_violet.png" },
	inventory_image = "hades_bushes_violet.png",
	wield_image = "hades_bushes_violet.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	floodable = true,
	groups = {snappy=3,choppy=3,flammable=2,simple_bush=1,attached_node=1,color_violet=1},
	sounds = hades_sounds.node_sound_bush_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.325, -0.5, -0.325, 0.325, 0.5, 0.325},
	},
})

minetest.register_craft({
	output = 'hades_bushes:violet',
	recipe = {
		{'hades_flowers:violet', '', ''},
		{'hades_bushes:green', '', ''},
		{'hades_core:dirt', '', ''},
	}
})


