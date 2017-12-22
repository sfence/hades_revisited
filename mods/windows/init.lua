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
		sounds = default.node_sound_glass_defaults({
			footstep = default.node_sound_wood_defaults().footstep
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
	description = "Common Wood Window",
	texture_seam = "windows_windows_wood_seam.png",
	texture_front = "windows_windows_wood_front.png",
})
windows.register_window("windows:windows_jwood", {
	description = "Jungle Wood Window",
	texture_seam = "windows_windows_jwood_seam.png",
	texture_front = "windows_windows_jwood_front.png",
})
windows.register_window("windows:windows_palewood", {
	description = "Pale Wood Window",
	texture_seam = "windows_windows_palewood_seam.png",
	texture_front = "windows_windows_palewood_front.png",
})


minetest.register_craft({
	output = 'windows:windows_wood 4',
	recipe = {
		{'default:wood', 'default:glass', 'default:wood'},
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:wood', 'default:glass', 'default:wood'},
	}
})
minetest.register_craft({
	output = 'windows:windows_jwood 4',
	recipe = {
		{'default:junglewood', 'default:glass', 'default:junglewood'},
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:junglewood', 'default:glass', 'default:junglewood'},
	}
})
minetest.register_craft({
	output = 'windows:windows_palewood 4',
	recipe = {
		{'default:palewood', 'default:glass', 'default:palewood'},
		{'default:glass', 'default:glass', 'default:glass'},
		{'default:palewood', 'default:glass', 'default:palewood'},
	}
})

local windows_simple = {
	{ "wood_white", "White Wooden Window", "dye:white"},
	{ "wood_darkgrey", "Dark Grey Wooden Window", "dye:dark_grey"},
	{ "wood_grey", "Grey Wooden Window", "dye:grey"},
	{ "wood_black", "Black Wooden Window", "dye:black"},
	{ "wood_red", "Red Wooden Window", "dye:red"},
	{ "wood_magenta", "Magenta Wooden Window", "dye:magenta"},
	{ "wood_violet", "Violet Wooden Window", "dye:violet"},
	{ "wood_blue", "Blue Wooden Window", "dye:blue"},
	{ "wood_cyan", "Cyan Wooden Window", "dye:cyan"},
	{ "wood_green", "Green Wooden Window", "dye:green"},
	{ "wood_darkgreen", "Dark Green Wooden Window", "dye:dark_green"},
	{ "wood_pink", "Pink Wooden Window", "dye:pink"},
	{ "wood_yellow", "Yellow Wooden Window", "dye:yellow"},
	{ "wood_orange", "Orange Wooden Window", "dye:orange"},
	{ "wood_brown", "Brown Wooden Window", "dye:brown"},
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
	description = "Paper Wall",
	texture_seam = "windows_windows_jwood_seam.png",
	texture_front = "windows_paperwall_front.png",
	groups = { snappy=2, choppy=2, cracky=3, oddly_breakable_by_hand=3 },
	sounds = default.node_sound_wood_defaults(),
})
minetest.register_craft({
	output = 'windows:paperwall 4',
	recipe = {
		{'group:wood', 'default:paper', 'group:wood'},
		{'default:paper', 'default:paper', 'default:paper'},
		{'group:wood', 'default:paper', 'group:wood'},
	}
})

windows.register_window("windows:windows_obsidian", {
	description = "Obsidian Window",
	texture_seam = "windows_windows_obsidian_seam.png",
	texture_front = "windows_windows_obsidian_front.png",
	groups = { cracky=3 },
	sounds = default.node_sound_glass_defaults({
		footstep = default.node_sound_stone_defaults().footstep
	}),
})
minetest.register_craft({
	output = 'windows:windows_obsidian 4',
	recipe = {
		{'default:obsidian_shard', 'default:obsidian_glass', 'default:obsidian_shard'},
		{'default:obsidian_glass', 'default:obsidian_glass', 'default:obsidian_glass'},
		{'default:obsidian_shard', 'default:obsidian_glass', 'default:obsidian_shard'},
	}
})
