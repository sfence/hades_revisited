local S = minetest.get_translator("hades_trees")

-- Wood planks
minetest.register_node("hades_trees:wood", {
	description = S("Common Wood Planks"),
	tiles = {"default_wood.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})
minetest.register_node("hades_trees:birch_wood", {
	description = S("Birch Wood Planks"),
	tiles = {"default_birchwood.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})
minetest.register_node("hades_trees:pale_wood", {
	description = S("Pale Wood Planks"),
	tiles = {"hades_trees_pale_wood.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})
minetest.register_node("hades_trees:jungle_wood", {
	description = S("Jungle Wood Planks"),
	tiles = {"default_junglewood.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

-- Tiles
minetest.register_node("hades_trees:floor_wood_jungle", {
	description = S("Common Wood/Jungle Wood Tile"),
	tiles = {
		"default_floor_wood_jungle.png",
		"default_floor_wood_jungle.png",
		"default_floor_wood_jungle.png",
		"default_floor_wood_jungle.png",
		"default_floor_wood_jungle.png^[transformR90",
	},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_node("hades_trees:floor_wood_pale", {
	description = S("Common Wood/Pale Wood Tile"),
	tiles = {
		"default_floor_wood_pale.png",
		"default_floor_wood_pale.png",
		"default_floor_wood_pale.png",
		"default_floor_wood_pale.png",
		"default_floor_wood_pale.png^[transformR90",
	},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_node("hades_trees:floor_pale_jungle", {
	description = S("Jungle Wood/Pale Wood Tile"),
	tiles = {
		"default_floor_pale_jungle.png",
		"default_floor_pale_jungle.png",
		"default_floor_pale_jungle.png",
		"default_floor_pale_jungle.png",
		"default_floor_pale_jungle.png^[transformR90",
	},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

-- Colored wood

minetest.register_node("hades_trees:colwood_black", {
	description = S("Black Wood Planks"),
	tiles = {"default_colwood_black.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_node("hades_trees:colwood_blue", {
	description = S("Blue Wood Planks"),
	tiles = {"default_colwood_blue.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_node("hades_trees:colwood_brown", {
	description = S("Brown Wood Planks"),
	tiles = {"default_colwood_brown.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_node("hades_trees:colwood_cyan", {
	description = S("Cyan Wood Planks"),
	tiles = {"default_colwood_cyan.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_node("hades_trees:colwood_dark_green", {
	description = S("Dark Green Wood Planks"),
	tiles = {"default_colwood_dark_green.png"},
	is_ground_content = false,
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_node("hades_trees:colwood_dark_grey", {
	description = S("Dark Grey Wood Planks"),
	tiles = {"default_colwood_dark_grey.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_node("hades_trees:colwood_green", {
	description = S("Green Wood Planks"),
	tiles = {"default_colwood_green.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_node("hades_trees:colwood_grey", {
	description = S("Grey Wood Planks"),
	tiles = {"default_colwood_grey.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_node("hades_trees:colwood_magenta", {
	description = S("Magenta Wood Planks"),
	tiles = {"default_colwood_magenta.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_node("hades_trees:colwood_orange", {
	description = S("Orange Wood Planks"),
	tiles = {"default_colwood_orange.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_node("hades_trees:colwood_pink", {
	description = S("Pink Wood Planks"),
	tiles = {"default_colwood_pink.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_node("hades_trees:colwood_red", {
	description = S("Red Wood Planks"),
	tiles = {"default_colwood_red.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_node("hades_trees:colwood_violet", {
	description = S("Violet Wood Planks"),
	tiles = {"default_colwood_violet.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_node("hades_trees:colwood_violet", {
	description = S("Violet Wood Planks"),
	tiles = {"default_colwood_violet.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_node("hades_trees:colwood_white", {
	description = S("White Wood Planks"),
	tiles = {"default_colwood_white.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_node("hades_trees:colwood_yellow", {
	description = S("Yellow Wood Planks"),
	tiles = {"default_colwood_yellow.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

