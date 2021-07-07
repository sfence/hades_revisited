local S = minetest.get_translator("windows")

windows = {}

windows.register_window = function(id, def)
	local window_wood
	if def.is_wood then
		window_wood=1
	end
	if def.is_colwood then
		window_colwood=1
	end

	local odef = {
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		tiles = { def.texture_seam, def.texture_seam, def.texture_seam, def.texture_seam, def.texture_front },
		sunlight_propagates = true,
		use_texture_alpha = "blend",
		walkable = true,
		is_ground_content = false,
		groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3, window=1, window_wood=window_wood, window_colwood=window_colwood},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.4375, -0.4375, -0.0625, 0.4375, 0.4375, 0.0625},
				{0.4375, -0.5, -0.125, 0.5, 0.5, 0.125},
				{-0.5, -0.5, -0.125, -0.4375, 0.5, 0.125},
				{-0.4375, -0.5, -0.125, 0.4375, -0.4375, 0.125},
				{-0.4375, 0.4375, -0.125, 0.4375, 0.5, 0.125},
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.125, 0.5, 0.5, 0.125},
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
	description = S("Temperate Wood Window"),
	texture_seam = "windows_windows_wood_seam.png",
	texture_front = "windows_windows_wood_front.png",
	is_wood = true,
})
windows.register_window("windows:windows_jungle_wood", {
	description = S("Tropical Wood Window"),
	texture_seam = "windows_windows_jwood_seam.png",
	texture_front = "windows_windows_jwood_front.png",
	is_wood = true,
})
windows.register_window("windows:windows_pale_wood", {
	description = S("Pale Wood Window"),
	texture_seam = "windows_windows_palewood_seam.png",
	texture_front = "windows_windows_palewood_front.png",
	is_wood = true,
})
windows.register_window("windows:windows_cream_wood", {
	description = S("Cream Wood Window"),
	texture_seam = "windows_windows_creamwood_seam.png",
	texture_front = "windows_windows_creamwood_front.png",
	is_wood = true,
})
windows.register_window("windows:windows_lush_wood", {
	description = S("Lush Wood Window"),
	texture_seam = "windows_windows_lushwood_seam.png",
	texture_front = "windows_windows_lushwood_front.png",
	is_wood = true,
})
windows.register_window("windows:windows_wood_uncolored", {
	description = S("Uncolored Canvas Wood Window"),
	texture_seam = "windows_windows_uncoloredwood_seam.png",
	texture_front = "windows_windows_uncoloredwood_front.png",
	is_wood = true,
	is_colwood = true,
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
	output = 'windows:windows_cream_wood 4',
	recipe = {
		{'hades_trees:cream_wood', 'hades_core:glass', 'hades_trees:cream_wood'},
		{'hades_core:glass', 'hades_core:glass', 'hades_core:glass'},
		{'hades_trees:cream_wood', 'hades_core:glass', 'hades_trees:cream_wood'},
	}
})
minetest.register_craft({
	output = 'windows:windows_lush_wood 4',
	recipe = {
		{'hades_trees:lush_wood', 'hades_core:glass', 'hades_trees:lush_wood'},
		{'hades_core:glass', 'hades_core:glass', 'hades_core:glass'},
		{'hades_trees:lush_wood', 'hades_core:glass', 'hades_trees:lush_wood'},
	}
})
minetest.register_craft({
	type = "shapeless",
	output = 'windows:windows_wood_uncolored',
	recipe = { 'group:window_colwood', 'hades_trees:canvas_leaves' },
})
minetest.register_craft({
	output = 'windows:windows_wood_uncolored 4',
	recipe = {
		{'hades_trees:colwood_uncolored', 'hades_core:glass', 'hades_trees:colwood_uncolored'},
		{'hades_core:glass', 'hades_core:glass', 'hades_core:glass'},
		{'hades_trees:colwood_uncolored', 'hades_core:glass', 'hades_trees:colwood_uncolored'},
	}
})

local windows_simple = {
	{ "wood_white", S("White Canvas Wood Window"), "dye:white"},
	{ "wood_darkgrey", S("Dark Grey Canvas Wood Window"), "dye:dark_grey"},
	{ "wood_grey", S("Grey Canvas Wood Window"), "dye:grey"},
	{ "wood_black", S("Black Canvas Wood Window"), "dye:black"},
	{ "wood_red", S("Red Canvas Wood Window"), "dye:red"},
	{ "wood_magenta", S("Magenta Canvas Wood Window"), "dye:magenta"},
	{ "wood_violet", S("Violet Canvas Wood Window"), "dye:violet"},
	{ "wood_blue", S("Blue Canvas Wood Window"), "dye:blue"},
	{ "wood_cyan", S("Cyan Canvas Wood Window"), "dye:cyan"},
	{ "wood_green", S("Green Canvas Wood Window"), "dye:green"},
	{ "wood_darkgreen", S("Dark Green Canvas Wood Window"), "dye:dark_green"},
	{ "wood_pink", S("Pink Canvas Wood Window"), "dye:pink"},
	{ "wood_yellow", S("Yellow Canvas Wood Window"), "dye:yellow"},
	{ "wood_orange", S("Orange Canvas Wood Window"), "dye:orange"},
	{ "wood_brown", S("Brown Canvas Wood Window"), "dye:brown"},
}
for w=1, #windows_simple do
	windows.register_window("windows:windows_"..windows_simple[w][1], {
		description = windows_simple[w][2],
		texture_seam = "windows_windows_"..windows_simple[w][1].."_seam.png",
		texture_front = "windows_windows_"..windows_simple[w][1].."_front.png",
		is_wood = true,
		is_colwood = true,
	})

	minetest.register_craft({
		type = "shapeless",
		output = 'windows:windows_'..windows_simple[w][1],
		recipe = { 'group:window_colwood', windows_simple[w][3] },
	})
end

windows.register_window("windows:paperwall", {
	description = S("Paper Frame"),
	texture_seam = "windows_windows_lushwood_seam.png",
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
