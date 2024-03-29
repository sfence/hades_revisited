--[[
   Hades Furniture. Based on 3D Forniture.
   Some adjustments and expansions for Hades game added 2015 by Glünggi

   License
   Copyright 2012 Tonyka (original author of 3D Forniture)
   
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
   MA 02110-1301, USA.
   
   Contributors:

    InfinityProject

        suggested creating bathroom kit.

    cosarara97

        code.
   
]]--

-- Deco Home

	--Table
	minetest.register_craft( {
		type = 'shapeless',
		output = 'hades_furniture:table_black',
		recipe = {
			'group:table', 'hades_dye:black'
		}
	})
	minetest.register_craft( {
		type = 'shapeless',
		output = 'hades_furniture:table_white',
		recipe = {
			'group:table', 'hades_dye:white'
		}
	})

	minetest.register_craft( {
		type = "shapeless",
		output = 'hades_furniture:table_uncolored',
		recipe = { 'group:table', 'hades_trees:canvas_leaves' },
	})

	minetest.register_craft( {
		output = 'hades_furniture:table_uncolored',
		recipe = {
			{ 'hades_trees:colwood_uncolored','hades_trees:colwood_uncolored', 'hades_trees:colwood_uncolored' },
			{ 'group:stick', '', 'group:stick' },
		},
	})
	
	minetest.register_craft( {
		output = 'hades_furniture:table_black',
		recipe = {
			{ 'hades_trees:colwood_black','hades_trees:colwood_black', 'hades_trees:colwood_black' },
			{ 'group:stick', '', 'group:stick' },
		},
	})
	minetest.register_craft( {
		output = 'hades_furniture:table_white',
		recipe = {
			{ 'hades_trees:colwood_white','hades_trees:colwood_white', 'hades_trees:colwood_white' },
			{ 'group:stick', '', 'group:stick' },
		},
	})

	
	minetest.register_craft({
		type = 'fuel',
		recipe = 'group:table',
		burntime = 30,
	})

	--Chair
	minetest.register_craft( {
		type = "shapeless",
		output = 'hades_furniture:chair_uncolored',
		recipe = { 'group:chair', 'hades_trees:canvas_leaves' },
	})

	minetest.register_craft( {
		output = 'hades_furniture:chair_uncolored 2',
		recipe = {
			{ 'group:stick',''},
			{ 'hades_trees:colwood_uncolored','hades_trees:colwood_uncolored' },
			{ 'group:stick','group:stick' },
		},
	})

	minetest.register_craft( {
		type = 'shapeless',
		output = 'hades_furniture:chair_black',
		recipe = {
			'group:chair', 'hades_dye:black'
		}
	})
	minetest.register_craft( {
		type = 'shapeless',
		output = 'hades_furniture:chair_white',
		recipe = {
			'group:chair', 'hades_dye:white'
		}
	})
	
	minetest.register_craft( {
		output = 'hades_furniture:chair_black 2',
		recipe = {
			{ 'group:stick',''},
			{ 'hades_trees:colwood_black','hades_trees:colwood_black' },
			{ 'group:stick','group:stick' },
		},
	})
	minetest.register_craft( {
		output = 'hades_furniture:chair_white 2',
		recipe = {
			{ 'group:stick',''},
			{ 'hades_trees:colwood_white','hades_trees:colwood_white' },
			{ 'group:stick','group:stick' },
		},
	})

	minetest.register_craft({
		type = 'fuel',
		recipe = 'group:chair',
		burntime = 15,
	})

	--Armchair
	minetest.register_craft( {
		type = 'shapeless',
		output = 'hades_furniture:armchair',
		recipe = { 'group:armchair', 'hades_dye:black' }
	})
	minetest.register_craft( {
		type = 'shapeless',
		output = 'hades_furniture:armchair_white',
		recipe = { 'group:armchair', 'hades_dye:white' }
	})
	minetest.register_craft( {
		type = 'shapeless',
		output = 'hades_furniture:armchair_blue',
		recipe = { 'group:armchair', 'hades_dye:blue' }
	})
	minetest.register_craft( {
		type = 'shapeless',
		output = 'hades_furniture:armchair_brown',
		recipe = { 'group:armchair', 'hades_dye:brown' }
	})
	minetest.register_craft( {
		type = 'shapeless',
		output = 'hades_furniture:armchair_red',
		recipe = { 'group:armchair', 'hades_dye:red' }
	})
	minetest.register_craft( {
		type = 'shapeless',
		output = 'hades_furniture:armchair_dark_green',
		recipe = { 'group:armchair', 'hades_dye:dark_green' }
	})


	minetest.register_craft( {
		output = 'hades_furniture:armchair 2',
		recipe = {
			{ 'group:wood',''},
			{ 'group:wood','hades_cloth:black' },
			{ 'group:wood','group:wood' },
		},
	})
	
	minetest.register_craft( {
		output = 'hades_furniture:armchair_white 2',
		recipe = {
			{ 'group:wood',''},
			{ 'group:wood','hades_cloth:white' },
			{ 'group:wood','group:wood' },
		},
	})
	
	minetest.register_craft( {
		output = 'hades_furniture:armchair_blue 2',
		recipe = {
			{ 'group:wood',''},
			{ 'group:wood','hades_cloth:blue' },
			{ 'group:wood','group:wood' },
		},
	})
	
	minetest.register_craft( {
		output = 'hades_furniture:armchair_brown 2',
		recipe = {
			{ 'group:wood',''},
			{ 'group:wood','hades_cloth:brown' },
			{ 'group:wood','group:wood' },
		},
	})
	
	minetest.register_craft( {
		output = 'hades_furniture:armchair_red 2',
		recipe = {
			{ 'group:wood',''},
			{ 'group:wood','hades_cloth:red' },
			{ 'group:wood','group:wood' },
		},
	})
	
	minetest.register_craft( {
		output = 'hades_furniture:armchair_dark_green 2',
		recipe = {
			{ 'group:wood',''},
			{ 'group:wood','hades_cloth:dark_green' },
			{ 'group:wood','group:wood' },
		},
	})

	minetest.register_craft({
		type = 'fuel',
		recipe = 'group:armchair',
		burntime = 30,
	})

	--Table Lamp
	minetest.register_craft( {
		output = 'hades_furniture:table_lamp_off',
		recipe = {
			{'hades_core:paper','hades_glowcrystals:glowcrystal' ,'hades_core:paper'},
			{'','group:stick',''},
			{'','hades_stairs:slab_wood',''},
		},
	})

	minetest.register_craft({
		type = 'fuel',
		recipe = 'hades_furniture:table_lamp_off',
		burntime = 10,
	})

-- Medieval Furniture

	-- Steel Bars
	minetest.register_craft( {
		output = 'hades_furniture:bars 3',
		recipe = {
			{ 'hades_core:steel_rod','','hades_core:steel_rod' },
			{ 'hades_core:steel_rod','','hades_core:steel_rod' },
			{ 'hades_core:steel_rod','','hades_core:steel_rod' },
		},
	})

	-- Binding Steel Bars
	minetest.register_craft( {
		output = 'hades_furniture:L_binding_bars 5',
		recipe = {
			{ '', 'hades_furniture:bars', '' },
			{ 'hades_furniture:bars', 'hades_furniture:bars', 'hades_furniture:bars' },
			{ '', 'hades_furniture:bars', '', },
		},
	})

	-- Rusty Bars
	minetest.register_craft( {
		output = 'hades_furniture:rusty_bars 3',
		recipe = {
			{ 'hades_core:steel_rod','','hades_core:steel_rod' },
			{ 'hades_core:iron_lump','','hades_core:iron_lump' },
			{ 'hades_core:steel_rod','','hades_core:steel_rod' },
		},
	})

	-- Binding Rusty Bars
	minetest.register_craft( {
		output = 'hades_furniture:binding_rusty_bars 5',
		recipe = {
			{ '', 'hades_furniture:rusty_bars', '' },
			{ 'hades_furniture:rusty_bars', 'hades_furniture:rusty_bars', 'hades_furniture:rusty_bars' },
			{ '', 'hades_furniture:rusty_bars', '', },
		},
	})



	-- Recipes to smelt bars back into ingots
	minetest.register_craft( {
		type = "cooking",
		output = 'hades_core:steel_ingot',
		recipe = 'hades_furniture:L_binding_bars',
		cookingtime = 3,
	})
	minetest.register_craft( {
		type = "cooking",
		output = 'hades_core:steel_ingot',
		recipe = 'hades_furniture:bars',
		cookingtime = 3,
	})

-- Misc.

	minetest.register_craft({
		output = "hades_furniture:plant_pot",
		recipe = {
			{"hades_core:clay_brick", "", "hades_core:clay_brick"},
			{"hades_core:clay_brick", "hades_core:dirt", "hades_core:clay_brick"},
			{"hades_core:clay_brick", "hades_core:clay_brick", "hades_core:clay_brick"}
		}
	})
