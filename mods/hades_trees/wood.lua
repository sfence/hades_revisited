local S = minetest.get_translator("hades_trees")

-- Wooden planks
local planks = {
	{ "wood", S("Common Wood Planks"), "default_wood.png" },
	{ "birch_wood", S("Birch Wood Planks"), "default_birchwood.png" },
	{ "pale_wood", S("Pale Wood Planks"), "hades_trees_pale_wood.png" },
	{ "jungle_wood", S("Jungle Wood Planks"), "default_junglewood.png" },

-- Colored wooden planks
	{ "colwood_black", S("Black Wood Planks"), "hades_trees_colwood_black.png", true },
	{ "colwood_blue", S("Blue Wood Planks"), "hades_trees_colwood_blue.png", true },
	{ "colwood_brown", S("Brown Wood Planks"), "hades_trees_colwood_brown.png", true },
	{ "colwood_cyan", S("Cyan Wood Planks"), "hades_trees_colwood_cyan.png", true },
	{ "colwood_dark_grey", S("Dark Grey Wood Planks"), "hades_trees_colwood_dark_grey.png", true },
	{ "colwood_dark_green", S("Dark Green Wood Planks"), "hades_trees_colwood_dark_green.png", true },
	{ "colwood_green", S("Green Wood Planks"), "hades_trees_colwood_green.png", true },
	{ "colwood_grey", S("Grey Wood Planks"), "hades_trees_colwood_grey.png", true },
	{ "colwood_magenta", S("Magenta Wood Planks"), "hades_trees_colwood_magenta.png", true },
	{ "colwood_orange", S("Orange Wood Planks"), "hades_trees_colwood_orange.png", true },
	{ "colwood_pink", S("Pink Wood Planks"), "hades_trees_colwood_pink.png", true },
	{ "colwood_red", S("Red Wood Planks"), "hades_trees_colwood_red.png", true },
	{ "colwood_violet", S("Violet Wood Planks"), "hades_trees_colwood_violet.png", true },
	{ "colwood_white", S("White Wood Planks"), "hades_trees_colwood_white.png", true },
	{ "colwood_yellow", S("Yellow Wood Planks"), "hades_trees_colwood_yellow.png", true },
}

for p=1, #planks do
	local id = planks[p][1]
	local desc = planks[p][2]
	local tile = planks[p][3]
	local colwood
	if planks[p][4] then
		colwood = 1
	end
	minetest.register_node("hades_trees:"..id, {
		description = desc,
		tiles = {tile},
		groups = {choppy=3,oddly_breakable_by_hand=2,flammable=3,wood=1,colwood=colwood},
		sounds = hades_sounds.node_sound_wood_defaults(),
	})
end

-- Tiles
minetest.register_node("hades_trees:floor_wood_jungle", {
	description = S("Common Wood/Jungle Wood Tile"),
	tiles = {
		"hades_trees_floor_wood_jungle.png",
		"hades_trees_floor_wood_jungle.png",
		"hades_trees_floor_wood_jungle.png",
		"hades_trees_floor_wood_jungle.png",
		"hades_trees_floor_wood_jungle.png^[transformR90",
	},
	groups = {choppy=3,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_node("hades_trees:floor_wood_pale", {
	description = S("Common Wood/Pale Wood Tile"),
	tiles = {
		"hades_trees_floor_wood_pale.png",
		"hades_trees_floor_wood_pale.png",
		"hades_trees_floor_wood_pale.png",
		"hades_trees_floor_wood_pale.png",
		"hades_trees_floor_wood_pale.png^[transformR90",
	},
	groups = {choppy=3,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_node("hades_trees:floor_pale_jungle", {
	description = S("Jungle Wood/Pale Wood Tile"),
	tiles = {
		"hades_trees_floor_pale_jungle.png",
		"hades_trees_floor_pale_jungle.png",
		"hades_trees_floor_pale_jungle.png",
		"hades_trees_floor_pale_jungle.png",
		"hades_trees_floor_pale_jungle.png^[transformR90",
	},
	groups = {choppy=3,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
})
