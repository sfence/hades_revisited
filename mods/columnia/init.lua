-- its a fork (2015 by Glünggi) of the mymillwork mod by DonBatman wtfpl license

columnia = {}

-- Bracket 
minetest.register_node("columnia:bracket",	{ 
            description = 'Bracket',
			tiles = {"columnia_rusty.png",},
			drawtype = "nodebox",
			sunlight_propagates = true,
			paramtype = 'light',
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
			        {-0.25, 0, 0.4375, 0.25, 0.5, 0.5},
			        {-0.1875, -0.5, -0.1875, 0.1875, -0.375, 0.1875},
			        {-0.0625, -0.375, -0.0625, 0.0625, 0.1875, 0.0625},
			        {-0.0625, 0.1875, -0.0625, 0.0625, 0.3125, 0.4375},
			        {-0.1875, 0.0625, 0.3125, 0.1875, 0.4375, 0.4375},
			        {-0.125, -0.375, -0.125, 0.125, -0.25, 0.125},
		        },
			},
			groups = {cracky=3,},
			sounds = hades_sounds.node_sound_metal_defaults(),
})
		
minetest.register_craft({
		output = 'columnia:bracket 4',
		recipe = {
			{"hades_core:steel_ingot", "hades_core:steel_ingot", ""},
			{"", "hades_core:steel_ingot", ""},
			{"", "hades_core:steel_ingot", ""},
		},
		replacements = {{"columnia:blueprint", "columnia:blueprint"}},
})

-- Lamp
minetest.register_node("columnia:lamp_ceiling", {
    description = "Column Lamp",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image = "columnia_lamp_inv.png",
	tiles = {
	         "columnia_rusty.png", "columnia_lamp.png", "columnia_lamp.png",
		     "columnia_lamp.png", "columnia_lamp.png", "columnia_lamp.png"
	        },
	sunlight_propagates = true,
	light_source = 13,
	walkable = false,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, 0.4375, -0.1875, 0.1875, 0.5, 0.1875},
			{-0.125, 0.375, -0.125, 0.125, 0.4375, 0.125}, 
		},
	},
	sounds = hades_sounds.node_sound_glass_defaults(),
})

minetest.register_craft({
		output = 'columnia:lamp_ceiling 4',
		recipe = {
			{"hades_core:steel_ingot", "hades_core:steel_ingot", ""},
			{"", "glowcrystals:glowdust", ""},
			{"", "hades_core:glass", ""},
		},
})
minetest.register_craft({
		output = 'columnia:lamp_ceiling 4',
		recipe = {
			{"hades_core:steel_ingot", "hades_core:steel_ingot", ""},
			{"", "hades_torches:torch", ""},
			{"", "hades_core:glass", ""},
		},
})

-- Rusty_Block

minetest.register_node("columnia:rusty_block", {
	description = "Rusty Block",
	tiles = {"columnia_rusty_block.png"},
	is_ground_content = true,
	groups = {cracky=1},
	sounds = hades_sounds.node_sound_heavy_metal_defaults(),
})

minetest.register_craft({
		output = 'columnia:rusty_block 3',
		recipe = {
			{"hades_core:iron_lump", "hades_core:iron_lump", "hades_core:iron_lump"},
			{"hades_core:iron_lump", "hades_core:iron_lump", "hades_core:iron_lump"},
			{"hades_core:iron_lump", "hades_core:iron_lump", "hades_core:iron_lump"},
		},
})

dofile(minetest.get_modpath("columnia").."/columnia.lua")
dofile(minetest.get_modpath("columnia").."/machines.lua")
dofile(minetest.get_modpath("columnia").."/register.lua")

