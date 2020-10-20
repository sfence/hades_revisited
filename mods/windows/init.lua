local S = minetest.get_translator("windows")

-- Windows
-- Add some simple window nodes to Minetest.
-- License: WTFPL - 2014 by Glunggi

windows = {}

windows.register_window = function(id, def)
	local odef = {
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		tiles = { def.texture_seam, def.texture_seam, def.texture_seam, def.texture_seam, def.texture_front },
		sunlight_propagates = true,
		use_texture_alpha = true,
		walkable = true,
		is_ground_content = false,
		groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3, window_wood=1},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.4375, -0.4375, -0.0625, 0.4375, 0.4375, 0.0625},
				{0.4375, -0.5, -0.125, 0.5, 0.5, 0.125},
				{-0.5, -0.5, -0.125, -0.4375, 0.5, 0.125},
				{-0.5, -0.5, -0.125, 0.5, -0.4375, 0.125},
				{-0.5, 0.4375, -0.125, 0.5, 0.5, 0.125},
			}
		},
		sounds = hades_sounds.node_sound_glass_defaults({
			footstep = hades_sounds.node_sound_wood_defaults().footstep
		}),
	}
	for k, v in pairs(def) do
		if def[k] ~= nil then
			odef[k] = v
		end
	end

	minetest.register_node(id, odef)
end

windows.register_window("windows:windows_wood", {
	description = S("Common Wood Window"),
	texture_seam = "windows_windows_wood_seam.png",
	texture_front = "windows_windows_wood_front.png",
})
windows.register_window("windows:windows_jungle_wood", {
	description = S("Jungle Wood Window"),
	texture_seam = "windows_windows_jwood_seam.png",
	texture_front = "windows_windows_jwood_front.png",
})
windows.register_window("windows:windows_pale_wood", {
	description = S("Pale Wood Window"),
	texture_seam = "windows_windows_palewood_seam.png",
	texture_front = "windows_windows_palewood_front.png",
})
windows.register_window("windows:windows_birch_wood", {
	description = S("Birch Wood Window"),
	texture_seam = "windows_windows_birchwood_seam.png",
	texture_front = "windows_windows_birchwood_front.png",
})

minetest.register_craft({
	output = 'windows:windows_wood 4',
	recipe = {
		{'hades_trees:wood', 'hades_core:glass', 'hades_trees:wood'},
		{'hades_core:glass', 'hades_core:glass', 'hades_core:glass'},
		{'hades_trees:wood', 'hades_core:glass', 'hades_trees:wood'},
	}
})
minetest.register_craft({
	output = 'windows:windows_jungle_wood 4',
	recipe = {
		{'hades_trees:jungle_wood', 'hades_core:glass', 'hades_trees:jungle_wood'},
		{'hades_core:glass', 'hades_core:glass', 'hades_core:glass'},
		{'hades_trees:jungle_wood', 'hades_core:glass', 'hades_trees:jungle_wood'},
	}
})
minetest.register_craft({
	output = 'windows:windows_pale_wood 4',
	recipe = {
		{'hades_trees:pale_wood', 'hades_core:glass', 'hades_trees:pale_wood'},
		{'hades_core:glass', 'hades_core:glass', 'hades_core:glass'},
		{'hades_trees:pale_wood', 'hades_core:glass', 'hades_trees:pale_wood'},
	}
})
minetest.register_craft({
	output = 'windows:windows_birch_wood 4',
	recipe = {
		{'hades_trees:birch_wood', 'hades_core:glass', 'hades_trees:birch_wood'},
		{'hades_core:glass', 'hades_core:glass', 'hades_core:glass'},
		{'hades_trees:birch_wood', 'hades_core:glass', 'hades_trees:birch_wood'},
	}
})

local windows_simple = {
	{ "wood_white", S("White Wooden Window"), "dye:white"},
	{ "wood_darkgrey", S("Dark Grey Wooden Window"), "dye:dark_grey"},
	{ "wood_grey", S("Grey Wooden Window"), "dye:grey"},
	{ "wood_black", S("Black Wooden Window"), "dye:black"},
	{ "wood_red", S("Red Wooden Window"), "dye:red"},
	{ "wood_magenta", S("Magenta Wooden Window"), "dye:magenta"},
	{ "wood_violet", S("Violet Wooden Window"), "dye:violet"},
	{ "wood_blue", S("Blue Wooden Window"), "dye:blue"},
	{ "wood_cyan", S("Cyan Wooden Window"), "dye:cyan"},
	{ "wood_green", S("Green Wooden Window"), "dye:green"},
	{ "wood_darkgreen", S("Dark Green Wooden Window"), "dye:dark_green"},
	{ "wood_pink", S("Pink Wooden Window"), "dye:pink"},
	{ "wood_yellow", S("Yellow Wooden Window"), "dye:yellow"},
	{ "wood_orange", S("Orange Wooden Window"), "dye:orange"},
	{ "wood_brown", S("Brown Wooden Window"), "dye:brown"},
}
for w=1, #windows_simple do
	windows.register_window("windows:windows_"..windows_simple[w][1], {
		description = windows_simple[w][2],
		texture_seam = "windows_windows_"..windows_simple[w][1].."_seam.png",
		texture_front = "windows_windows_"..windows_simple[w][1].."_front.png",
	})

	minetest.register_craft({
		type = "shapeless",
		output = 'windows:windows_'..windows_simple[w][1],
		recipe = { 'group:window_wood', windows_simple[w][3] },
	})
end

windows.register_window("windows:paperwall", {
	description = S("Paper Wall"),
	texture_seam = "windows_windows_jwood_seam.png",
	texture_front = "windows_paperwall_front.png",
	groups = { snappy=2, choppy=2, cracky=3, oddly_breakable_by_hand=3 },
	sounds = hades_sounds.node_sound_wood_defaults(),
})
minetest.register_craft({
	output = 'windows:paperwall 4',
	recipe = {
		{'group:wood', 'hades_core:paper', 'group:wood'},
		{'hades_core:paper', 'hades_core:paper', 'hades_core:paper'},
		{'group:wood', 'hades_core:paper', 'group:wood'},
	}
})

windows.register_window("windows:windows_obsidian", {
	description = S("Obsidian Window"),
	texture_seam = "windows_windows_obsidian_seam.png",
	texture_front = "windows_windows_obsidian_front.png",
	groups = { cracky=3 },
	sounds = hades_sounds.node_sound_glass_defaults({
		footstep = hades_sounds.node_sound_stone_defaults().footstep
	}),
})
minetest.register_craft({
	output = 'windows:windows_obsidian 4',
	recipe = {
		{'hades_core:obsidian_shard', 'hades_core:obsidian_glass', 'hades_core:obsidian_shard'},
		{'hades_core:obsidian_glass', 'hades_core:obsidian_glass', 'hades_core:obsidian_glass'},
		{'hades_core:obsidian_shard', 'hades_core:obsidian_glass', 'hades_core:obsidian_shard'},
	}
})
