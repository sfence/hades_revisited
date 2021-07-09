local S = minetest.get_translator("hades_trees")

-- Wooden planks
local planks = {
	{ "pale_wood", S("Pale Wood Planks"), "hades_trees_pale_wood.png" },
	{ "cream_wood", S("Cream Wood Planks"), "hades_trees_cream_wood.png" },
	{ "wood", S("Temperate Wood Planks"), "default_wood.png" },
	{ "lush_wood", S("Lush Wood Planks"), "hades_trees_lush_wood.png" },
	{ "jungle_wood", S("Tropical Wood Planks"), "default_junglewood.png" },
	{ "charred_wood", S("Charred Wood Planks"), "hades_trees_charred_wood.png" },

-- Canvas wood: Colored wooden planks
	{ "colwood_uncolored", S("Uncolored Canvas Wood Planks"), "hades_trees_colwood_uncolored.png", true },
	{ "colwood_black", S("Black Canvas Wood Planks"), "hades_trees_colwood_black.png", true },
	{ "colwood_blue", S("Blue Canvas Wood Planks"), "hades_trees_colwood_blue.png", true },
	{ "colwood_brown", S("Brown Canvas Wood Planks"), "hades_trees_colwood_brown.png", true },
	{ "colwood_cyan", S("Cyan Canvas Wood Planks"), "hades_trees_colwood_cyan.png", true },
	{ "colwood_dark_grey", S("Dark Grey Canvas Wood Planks"), "hades_trees_colwood_dark_grey.png", true },
	{ "colwood_dark_green", S("Dark Green Canvas Wood Planks"), "hades_trees_colwood_dark_green.png", true },
	{ "colwood_green", S("Green Canvas Wood Planks"), "hades_trees_colwood_green.png", true },
	{ "colwood_grey", S("Grey Canvas Wood Planks"), "hades_trees_colwood_grey.png", true },
	{ "colwood_magenta", S("Magenta Canvas Wood Planks"), "hades_trees_colwood_magenta.png", true },
	{ "colwood_orange", S("Orange Canvas Wood Planks"), "hades_trees_colwood_orange.png", true },
	{ "colwood_pink", S("Pink Canvas Wood Planks"), "hades_trees_colwood_pink.png", true },
	{ "colwood_red", S("Red Wood Canvas Planks"), "hades_trees_colwood_red.png", true },
	{ "colwood_violet", S("Violet Canvas Wood Planks"), "hades_trees_colwood_violet.png", true },
	{ "colwood_white", S("White Canvas Wood Planks"), "hades_trees_colwood_white.png", true },
	{ "colwood_yellow", S("Yellow Canvas Wood Planks"), "hades_trees_colwood_yellow.png", true },
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
		is_ground_content = false,
		sounds = hades_sounds.node_sound_wood_defaults(),
	})
end
