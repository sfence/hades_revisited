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
			'group:table', 'dye:black'
		}
	})
	minetest.register_craft( {
		type = 'shapeless',
		output = 'hades_furniture:table_white',
		recipe = {
			'group:table', 'dye:white'
		}
	})

	minetest.register_craft( {
		output = 'hades_furniture:table',
		recipe = {
			{ 'hades_trees:wood','hades_trees:wood', 'hades_trees:wood' },
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
		output = 'hades_furniture:chair 2',
		recipe = {
			{ 'group:stick',''},
			{ 'hades_trees:wood','hades_trees:wood' },
			{ 'group:stick','group:stick' },
		},
	})

	minetest.register_craft( {
		type = 'shapeless',
		output = 'hades_furniture:chair_black',
		recipe = {
			'group:chair', 'dye:black'
		}
	})
	minetest.register_craft( {
		type = 'shapeless',
		output = 'hades_furniture:chair_white',
		recipe = {
			'group:chair', 'dye:white'
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
		recipe = { 'group:armchair', 'dye:black' }
	})
	minetest.register_craft( {
		type = 'shapeless',
		output = 'hades_furniture:armchair_white',
		recipe = { 'group:armchair', 'dye:white' }
	})
	minetest.register_craft( {
		type = 'shapeless',
		output = 'hades_furniture:armchair_blue',
		recipe = { 'group:armchair', 'dye:blue' }
	})
	minetest.register_craft( {
		type = 'shapeless',
		output = 'hades_furniture:armchair_brown',
		recipe = { 'group:armchair', 'dye:brown' }
	})
	minetest.register_craft( {
		type = 'shapeless',
		output = 'hades_furniture:armchair_red',
		recipe = { 'group:armchair', 'dye:red' }
	})
	minetest.register_craft( {
		type = 'shapeless',
		output = 'hades_furniture:armchair_dark_green',
		recipe = { 'group:armchair', 'dye:dark_green' }
	})


	minetest.register_craft( {
		output = 'hades_furniture:armchair 2',
		recipe = {
			{ 'group:wood',''},
			{ 'group:wood','wool:black' },
			{ 'group:wood','group:wood' },
		},
	})
	
	minetest.register_craft( {
		output = 'hades_furniture:armchair_white 2',
		recipe = {
			{ 'group:wood',''},
			{ 'group:wood','wool:white' },
			{ 'group:wood','group:wood' },
		},
	})
	
	minetest.register_craft( {
		output = 'hades_furniture:armchair_blue 2',
		recipe = {
			{ 'group:wood',''},
			{ 'group:wood','wool:blue' },
			{ 'group:wood','group:wood' },
		},
	})
	
	minetest.register_craft( {
		output = 'hades_furniture:armchair_brown 2',
		recipe = {
			{ 'group:wood',''},
			{ 'group:wood','wool:brown' },
			{ 'group:wood','group:wood' },
		},
	})
	
	minetest.register_craft( {
		output = 'hades_furniture:armchair_red 2',
		recipe = {
			{ 'group:wood',''},
			{ 'group:wood','wool:red' },
			{ 'group:wood','group:wood' },
		},
	})
	
	minetest.register_craft( {
		output = 'hades_furniture:armchair_dark_green 2',
		recipe = {
			{ 'group:wood',''},
			{ 'group:wood','wool:dark_green' },
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
			{'hades_core:paper','glowcrystals:glowcrystal' ,'hades_core:paper'},
			{'','group:stick',''},
			{'','stairs:slab_wood',''},
		},
	})

	minetest.register_craft({
		type = 'fuel',
		recipe = 'hades_furniture:table_lamp_off',
		burntime = 10,
	})

	-- Bathroom Kit

		--Toilet
		minetest.register_craft( {
			output = 'hades_furniture:toilet',
			recipe = {
				{'hades_core:clay','hades_materials:plastic_base',''},
				{ 'hades_core:clay','hades_core:clay', '' },
				{ 'pipeworks:pipe_1_empty', 'pipeworks:pump_off', '' },
			},
		})

		--Sink
		minetest.register_craft( {
			output = 'hades_furniture:sink',
			recipe = {
				{ 'hades_core:clay','hades_core:clay', 'hades_core:clay' },
				{ '','pipeworks:pipe_1_empty', '' },
			},
		})

		--Taps
		minetest.register_craft( {
			output = 'hades_furniture:taps',
			recipe = {
				{ 'hades_core:bronze_ingot','pipeworks:pipe_1_empty', 'hades_core:bronze_ingot' },
			},
		})

		--Shower Tray
		minetest.register_craft( {
			output = 'hades_furniture:shower_tray',
			recipe = {
				{ 'hades_core:steel_ingot','hades_core:steel_ingot', 'hades_core:steel_ingot' },
				{ '','pipeworks:pipe_1_empty', '' },
			},
		})

		--Shower Head
		minetest.register_craft( {
			output = 'hades_furniture:shower_head',
			recipe = {
				{'pipeworks:pipe_1_empty', 'hades_core:bronze_ingot'},
			},
		})

-- Medieval Forniture

	--Bars
	minetest.register_craft( {
		output = 'hades_furniture:bars 10',
		recipe = {
			{ 'hades_core:steel_ingot','hades_core:steel_ingot','hades_core:steel_ingot' },
			{ 'hades_core:steel_ingot','hades_core:steel_ingot','hades_core:steel_ingot' },
		},
	})

	-- L Binding Bars
	minetest.register_craft( {
		output = 'hades_furniture:L_binding_bars 4',
		recipe = {
			{ 'hades_furniture:bars','' },
			{ 'hades_furniture:bars','hades_furniture:bars' },
		},
	})

	--Chains
	minetest.register_craft( {
		output = 'hades_furniture:chains 4',
		recipe = {
			{'','hades_core:steel_ingot',''},
			{ 'hades_core:steel_ingot','', 'hades_core:steel_ingot' },
			{ '', 'hades_core:steel_ingot', '' },
		},
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
