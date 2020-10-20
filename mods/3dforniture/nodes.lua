local S = minetest.get_translator("3dforniture")

--[[
   Some adjustments and expansions for Hades game added 2015 by Glünggi
   
   3D Forniture
   
   Copyright 2012 Tonyka
   
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
		minetest.register_node("3dforniture:table",
			{description = S("Table"),
			tiles = {
				"forniture_wood.png",
				"forniture_wood.png",
				"forniture_wood_s1.png",
				"forniture_wood_s1.png",
				"forniture_wood_s2.png",
				"forniture_wood_s2.png",
			},
			drawtype = "nodebox",
			sunlight_propagates = true,
			paramtype = 'light',
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.4,-0.5,-0.4, -0.3,0.4,-0.3},
					{0.3,-0.5,-0.4, 0.4,0.4,-0.3},
					{-0.4,-0.5,0.3, -0.3,0.4,0.4},
					{0.3,-0.5,0.3, 0.4,0.4,0.4},
					{-0.5,0.4,-0.5, 0.5,0.5,0.5},
					{-0.4,-0.2,-0.3, -0.3,-0.1,0.3},
					{0.3,-0.2,-0.4, 0.4,-0.1,0.3},
					{-0.3,-0.2,-0.4, 0.4,-0.1,-0.3},
					{-0.3,-0.2,0.3, 0.3,-0.1,0.4},
				},
			},
			groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
			sounds = hades_sounds.node_sound_wood_defaults(),
		})  
		
		minetest.register_node("3dforniture:table_black",
			{description = S("Black Table"),
			tiles = {
				"forniture_wood_black.png",
				"forniture_wood_black.png",
				"forniture_wood_s1_black.png",
				"forniture_wood_s1_black.png",
				"forniture_wood_s2_black.png",
				"forniture_wood_s2_black.png",
			},
			drawtype = "nodebox",
			sunlight_propagates = true,
			paramtype = 'light',
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.4,-0.5,-0.4, -0.3,0.4,-0.3},
					{0.3,-0.5,-0.4, 0.4,0.4,-0.3},
					{-0.4,-0.5,0.3, -0.3,0.4,0.4},
					{0.3,-0.5,0.3, 0.4,0.4,0.4},
					{-0.5,0.4,-0.5, 0.5,0.5,0.5},
					{-0.4,-0.2,-0.3, -0.3,-0.1,0.3},
					{0.3,-0.2,-0.4, 0.4,-0.1,0.3},
					{-0.3,-0.2,-0.4, 0.4,-0.1,-0.3},
					{-0.3,-0.2,0.3, 0.3,-0.1,0.4},
				},
			},
			groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
			sounds = hades_sounds.node_sound_wood_defaults(),
		})  
		
		minetest.register_node("3dforniture:table_white",
			{description = S('White Table'),
			tiles = {
				"forniture_wood_white.png",
				"forniture_wood_white.png",
				"forniture_wood_s1_white.png",
				"forniture_wood_s1_white.png",
				"forniture_wood_s2_white.png",
				"forniture_wood_s2_white.png",
			},
			drawtype = "nodebox",
			sunlight_propagates = true,
			paramtype = 'light',
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.4,-0.5,-0.4, -0.3,0.4,-0.3},
					{0.3,-0.5,-0.4, 0.4,0.4,-0.3},
					{-0.4,-0.5,0.3, -0.3,0.4,0.4},
					{0.3,-0.5,0.3, 0.4,0.4,0.4},
					{-0.5,0.4,-0.5, 0.5,0.5,0.5},
					{-0.4,-0.2,-0.3, -0.3,-0.1,0.3},
					{0.3,-0.2,-0.4, 0.4,-0.1,0.3},
					{-0.3,-0.2,-0.4, 0.4,-0.1,-0.3},
					{-0.3,-0.2,0.3, 0.3,-0.1,0.4},
				},
			},
			groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
			sounds = hades_sounds.node_sound_wood_defaults(),
		})  

		--Chair
		minetest.register_node("3dforniture:chair",
			{ description = S("Chair"),
			tiles = {
				"forniture_wood.png",
				"forniture_wood.png",
				"forniture_wood_s1.png",
				"forniture_wood_s1.png",
				"forniture_wood_s2.png",
				"forniture_wood_s2.png",
			},
			drawtype = "nodebox",
			sunlight_propagates = true,
			paramtype = 'light',
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.3,-0.5,0.2, -0.2,0.5,0.3},
					{0.2,-0.5,0.2, 0.3,0.5,0.3},
					{-0.3,-0.5,-0.3, -0.2,-0.1,-0.2},
					{0.2,-0.5,-0.3, 0.3,-0.1,-0.2},
					{-0.3,-0.1,-0.3, 0.3,0,0.2},
					{-0.2,0.1,0.25, 0.2,0.4,0.26}
				},
			},
			selection_box = {
				type = "fixed",
				fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3},
			},
			groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
			sounds = hades_sounds.node_sound_wood_defaults(),
		})
		
		minetest.register_node("3dforniture:chair_black",
			{ description = S("Black Chair"),
			tiles = {
				"forniture_wood_black.png",
				"forniture_wood_black.png",
				"forniture_wood_s1_black.png",
				"forniture_wood_s1_black.png",
				"forniture_wood_s2_black.png",
				"forniture_wood_s2_black.png",
			},
			drawtype = "nodebox",
			sunlight_propagates = true,
			paramtype = 'light',
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.3,-0.5,0.2, -0.2,0.5,0.3},
					{0.2,-0.5,0.2, 0.3,0.5,0.3},
					{-0.3,-0.5,-0.3, -0.2,-0.1,-0.2},
					{0.2,-0.5,-0.3, 0.3,-0.1,-0.2},
					{-0.3,-0.1,-0.3, 0.3,0,0.2},
					{-0.2,0.1,0.25, 0.2,0.4,0.26}
				},
			},
			selection_box = {
				type = "fixed",
				fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3},
			},
			groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
			sounds = hades_sounds.node_sound_wood_defaults(),
		})
		
		minetest.register_node("3dforniture:chair_white",
			{ description = S("White Chair"),
			tiles = {
				"forniture_wood_white.png",
				"forniture_wood_white.png",
				"forniture_wood_s1_white.png",
				"forniture_wood_s1_white.png",
				"forniture_wood_s2_white.png",
				"forniture_wood_s2_white.png",
			},
			drawtype = "nodebox",
			sunlight_propagates = true,
			paramtype = 'light',
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.3,-0.5,0.2, -0.2,0.5,0.3},
					{0.2,-0.5,0.2, 0.3,0.5,0.3},
					{-0.3,-0.5,-0.3, -0.2,-0.1,-0.2},
					{0.2,-0.5,-0.3, 0.3,-0.1,-0.2},
					{-0.3,-0.1,-0.3, 0.3,0,0.2},
					{-0.2,0.1,0.25, 0.2,0.4,0.26}
				},
			},
			selection_box = {
				type = "fixed",
				fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3},
			},
			groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
			sounds = hades_sounds.node_sound_wood_defaults(),
		})

		--Armchair
		minetest.register_node("3dforniture:armchair",
			{ description = S("Black Armchair"),
			tiles = {
				"forniture_armchair_top.png",
				"forniture_armchair_top.png",
				"forniture_armchair_lat1.png",
				"forniture_armchair_lat1.png",
				"forniture_armchair_lat2.png",
				"forniture_armchair_lat2.png",
			},
			drawtype = "nodebox",
			sunlight_propagates = true,
			paramtype = 'light',
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					--lat 1
					{-0.5,-0.5,-0.45, -0.3,0.05,0.3},
					{-0.45,-0.5,-0.5, -0.35,0.05,-0.45},
					{-0.45,0.05,-0.45, -0.35,0.1,0.15},
					--lat 2
					{0.3,-0.5,-0.45, 0.5,0.05,0.3},{0.35,-0.5,-0.5,0.45,0.05,-0.45},{0.35,0.05,-0.45, 0.45,0.1,0.15},
					--respaldo
					{-0.5,-0.5,0.3, 0.5,0.45,0.5},{-0.45,0.45,0.35,0.45,0.5,0.45},
					--base
					{-0.3,-0.45,-0.35, 0.3,-0.1,0.3},{-0.3,-0.45,-0.4, 0.3,-0.15,-0.35},

					--oreja 1
					{-0.5,0.05,0.15, -0.3,0.45, 0.3},{-0.45,0.1,0.1, -0.35,0.45,0.15},{-0.45,0.45,0.15,-0.35,0.5,0.35},
					--oreja 2
					{0.3,0.05,0.15, 0.5,0.45,0.3},{0.35,0.1,0.1, 0.45,0.45,0.15},{0.35,0.45,0.15,0.45,0.5,0.35},
				},
			},
			selection_box = {
				type = "fixed",
				fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}
			},
			groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
			sounds = hades_sounds.node_sound_wood_defaults(),
		})
		
		minetest.register_node("3dforniture:armchair_white",
			{ description = S("White Armchair"),
			tiles = {
				"forniture_armchair_top_white.png",
				"forniture_armchair_top_white.png",
				"forniture_armchair_lat1_white.png",
				"forniture_armchair_lat1_white.png",
				"forniture_armchair_lat2_white.png",
				"forniture_armchair_lat2_white.png",
			},
			drawtype = "nodebox",
			sunlight_propagates = true,
			paramtype = 'light',
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					--lat 1
					{-0.5,-0.5,-0.45, -0.3,0.05,0.3},
					{-0.45,-0.5,-0.5, -0.35,0.05,-0.45},
					{-0.45,0.05,-0.45, -0.35,0.1,0.15},
					--lat 2
					{0.3,-0.5,-0.45, 0.5,0.05,0.3},{0.35,-0.5,-0.5,0.45,0.05,-0.45},{0.35,0.05,-0.45, 0.45,0.1,0.15},
					--respaldo
					{-0.5,-0.5,0.3, 0.5,0.45,0.5},{-0.45,0.45,0.35,0.45,0.5,0.45},
					--base
					{-0.3,-0.45,-0.35, 0.3,-0.1,0.3},{-0.3,-0.45,-0.4, 0.3,-0.15,-0.35},

					--oreja 1
					{-0.5,0.05,0.15, -0.3,0.45, 0.3},{-0.45,0.1,0.1, -0.35,0.45,0.15},{-0.45,0.45,0.15,-0.35,0.5,0.35},
					--oreja 2
					{0.3,0.05,0.15, 0.5,0.45,0.3},{0.35,0.1,0.1, 0.45,0.45,0.15},{0.35,0.45,0.15,0.45,0.5,0.35},
				},
			},
			selection_box = {
				type = "fixed",
				fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}
			},
			groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
			sounds = hades_sounds.node_sound_wood_defaults(),
		})
		
		minetest.register_node("3dforniture:armchair_blue",
			{ description = S("Blue Armchair"),
			tiles = {
				"forniture_armchair_top_blue.png",
				"forniture_armchair_top_blue.png",
				"forniture_armchair_lat1_blue.png",
				"forniture_armchair_lat1_blue.png",
				"forniture_armchair_lat2_blue.png",
				"forniture_armchair_lat2_blue.png",
			},
			drawtype = "nodebox",
			sunlight_propagates = true,
			paramtype = 'light',
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					--lat 1
					{-0.5,-0.5,-0.45, -0.3,0.05,0.3},
					{-0.45,-0.5,-0.5, -0.35,0.05,-0.45},
					{-0.45,0.05,-0.45, -0.35,0.1,0.15},
					--lat 2
					{0.3,-0.5,-0.45, 0.5,0.05,0.3},{0.35,-0.5,-0.5,0.45,0.05,-0.45},{0.35,0.05,-0.45, 0.45,0.1,0.15},
					--respaldo
					{-0.5,-0.5,0.3, 0.5,0.45,0.5},{-0.45,0.45,0.35,0.45,0.5,0.45},
					--base
					{-0.3,-0.45,-0.35, 0.3,-0.1,0.3},{-0.3,-0.45,-0.4, 0.3,-0.15,-0.35},

					--oreja 1
					{-0.5,0.05,0.15, -0.3,0.45, 0.3},{-0.45,0.1,0.1, -0.35,0.45,0.15},{-0.45,0.45,0.15,-0.35,0.5,0.35},
					--oreja 2
					{0.3,0.05,0.15, 0.5,0.45,0.3},{0.35,0.1,0.1, 0.45,0.45,0.15},{0.35,0.45,0.15,0.45,0.5,0.35},
				},
			},
			selection_box = {
				type = "fixed",
				fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}
			},
			groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
			sounds = hades_sounds.node_sound_wood_defaults(),
		})
		
			minetest.register_node("3dforniture:armchair_brown",
			{ description = S("Brown Armchair"),
			tiles = {
				"forniture_armchair_top_brown.png",
				"forniture_armchair_top_brown.png",
				"forniture_armchair_lat1_brown.png",
				"forniture_armchair_lat1_brown.png",
				"forniture_armchair_lat2_brown.png",
				"forniture_armchair_lat2_brown.png",
			},
			drawtype = "nodebox",
			sunlight_propagates = true,
			paramtype = 'light',
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					--lat 1
					{-0.5,-0.5,-0.45, -0.3,0.05,0.3},
					{-0.45,-0.5,-0.5, -0.35,0.05,-0.45},
					{-0.45,0.05,-0.45, -0.35,0.1,0.15},
					--lat 2
					{0.3,-0.5,-0.45, 0.5,0.05,0.3},{0.35,-0.5,-0.5,0.45,0.05,-0.45},{0.35,0.05,-0.45, 0.45,0.1,0.15},
					--respaldo
					{-0.5,-0.5,0.3, 0.5,0.45,0.5},{-0.45,0.45,0.35,0.45,0.5,0.45},
					--base
					{-0.3,-0.45,-0.35, 0.3,-0.1,0.3},{-0.3,-0.45,-0.4, 0.3,-0.15,-0.35},

					--oreja 1
					{-0.5,0.05,0.15, -0.3,0.45, 0.3},{-0.45,0.1,0.1, -0.35,0.45,0.15},{-0.45,0.45,0.15,-0.35,0.5,0.35},
					--oreja 2
					{0.3,0.05,0.15, 0.5,0.45,0.3},{0.35,0.1,0.1, 0.45,0.45,0.15},{0.35,0.45,0.15,0.45,0.5,0.35},
				},
			},
			selection_box = {
				type = "fixed",
				fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}
			},
			groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
			sounds = hades_sounds.node_sound_wood_defaults(),
		})
		
			minetest.register_node("3dforniture:armchair_red",
			{ description = S("Red Armchair"),
			tiles = {
				"forniture_armchair_top_red.png",
				"forniture_armchair_top_red.png",
				"forniture_armchair_lat1_red.png",
				"forniture_armchair_lat1_red.png",
				"forniture_armchair_lat2_red.png",
				"forniture_armchair_lat2_red.png",
			},
			drawtype = "nodebox",
			sunlight_propagates = true,
			paramtype = 'light',
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					--lat 1
					{-0.5,-0.5,-0.45, -0.3,0.05,0.3},
					{-0.45,-0.5,-0.5, -0.35,0.05,-0.45},
					{-0.45,0.05,-0.45, -0.35,0.1,0.15},
					--lat 2
					{0.3,-0.5,-0.45, 0.5,0.05,0.3},{0.35,-0.5,-0.5,0.45,0.05,-0.45},{0.35,0.05,-0.45, 0.45,0.1,0.15},
					--respaldo
					{-0.5,-0.5,0.3, 0.5,0.45,0.5},{-0.45,0.45,0.35,0.45,0.5,0.45},
					--base
					{-0.3,-0.45,-0.35, 0.3,-0.1,0.3},{-0.3,-0.45,-0.4, 0.3,-0.15,-0.35},

					--oreja 1
					{-0.5,0.05,0.15, -0.3,0.45, 0.3},{-0.45,0.1,0.1, -0.35,0.45,0.15},{-0.45,0.45,0.15,-0.35,0.5,0.35},
					--oreja 2
					{0.3,0.05,0.15, 0.5,0.45,0.3},{0.35,0.1,0.1, 0.45,0.45,0.15},{0.35,0.45,0.15,0.45,0.5,0.35},
				},
			},
			selection_box = {
				type = "fixed",
				fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}
			},
			groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
			sounds = hades_sounds.node_sound_wood_defaults(),
		})

		minetest.register_node("3dforniture:armchair_green",
			{ description = S("Green Armchair"),
			tiles = {
				"forniture_armchair_top_green.png",
				"forniture_armchair_top_green.png",
				"forniture_armchair_lat1_green.png",
				"forniture_armchair_lat1_green.png",
				"forniture_armchair_lat2_green.png",
				"forniture_armchair_lat2_green.png",
			},
			drawtype = "nodebox",
			sunlight_propagates = true,
			paramtype = 'light',
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					--lat 1
					{-0.5,-0.5,-0.45, -0.3,0.05,0.3},
					{-0.45,-0.5,-0.5, -0.35,0.05,-0.45},
					{-0.45,0.05,-0.45, -0.35,0.1,0.15},
					--lat 2
					{0.3,-0.5,-0.45, 0.5,0.05,0.3},{0.35,-0.5,-0.5,0.45,0.05,-0.45},{0.35,0.05,-0.45, 0.45,0.1,0.15},
					--respaldo
					{-0.5,-0.5,0.3, 0.5,0.45,0.5},{-0.45,0.45,0.35,0.45,0.5,0.45},
					--base
					{-0.3,-0.45,-0.35, 0.3,-0.1,0.3},{-0.3,-0.45,-0.4, 0.3,-0.15,-0.35},

					--oreja 1
					{-0.5,0.05,0.15, -0.3,0.45, 0.3},{-0.45,0.1,0.1, -0.35,0.45,0.15},{-0.45,0.45,0.15,-0.35,0.5,0.35},
					--oreja 2
					{0.3,0.05,0.15, 0.5,0.45,0.3},{0.35,0.1,0.1, 0.45,0.45,0.15},{0.35,0.45,0.15,0.45,0.5,0.35},
				},
			},
			selection_box = {
				type = "fixed",
				fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}
			},
			groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
			sounds = hades_sounds.node_sound_wood_defaults(),
		})

		local lamps = {
			{ "off", "max", },
			{ "low", "off", 4 },
			{ "med", "low", 8 },
			{ "hi", "med", 12 },
			{ "max", "hi", minetest.LIGHT_MAX },
		}

		for l=1, #lamps do

		local drop, not_in_creative_inventory
		if l ~= 1 then
			drop = "3dforniture:table_lamp_off"
			not_in_creative_inventory = 1
		end
		--Table Lamp
		minetest.register_node("3dforniture:table_lamp_"..lamps[l][1], {
			description = S("Table Lamp"),
			drawtype = "nodebox",
			tiles = {
				"forniture_table_lamp_s.png",
				"forniture_table_lamp_s.png",
				"forniture_table_lamp_l.png",
			},
			paramtype = 'light',
			paramtype2 = 'facedir',
			node_box = {
				type = "fixed",
				fixed = {
					--Lamp Base
					{-0.15,-0.5,-0.15, 0.15,-0.45,0.15},
					{-0.05,-0.45,-0.05, 0.05,-0.4,0.05},
					{-0.025,-0.4,-0.025, 0.025,-0.1,0.025},
					{-0.0125,-0.125,-0.2, 0.0125,-0.1,0.2},
					{-0.2,-0.125,-0.0125, 0.2,-0.1,0.0125},

					--Lamp Shade
					{-0.2,-0.1,-0.2, -0.175,0.3,0.2},
					{0.175,-0.1,-0.2, 0.2,0.3,0.2},
					{-0.175,-0.1,-0.2, 0.175,0.3,-0.175},
					{-0.175,-0.1,0.175, 0.175,0.3,0.2},
				},
			},
			sunlight_propagates = true,
			walkable = false,
			light_source = lamps[l][3],
			selection_box = {
				type = "fixed",
				fixed = {-0.2, -0.5, -0.2, 0.2, 0.3, 0.2},
			},
			groups = {cracky=2,oddly_breakable_by_hand=1,not_in_creative_inventory=not_in_creative_inventory},
			drop = drop,
			sounds = hades_sounds.node_sound_glass_defaults(),
			on_rightclick = function(pos, node, clicker)
				minetest.sound_play({name="3dforniture_table_lamp_switch"}, {pos=pos, gain=0.35, max_hear_distance=6})
				minetest.set_node(pos, {name="3dforniture:table_lamp_"..lamps[l][2]})
			end,
		})

		end

		-- Bathroom Kit

			--Toilet
			minetest.register_node("3dforniture:toilet",
				{ description = 'Toilet',
				tiles = { 
					"forniture_marble.png", "forniture_marble.png", 
					"forniture_marble_s1.png", "forniture_marble_s1.png", 
					"forniture_marble_s2.png", "forniture_marble_s2.png",
				},
				drawtype = "nodebox",
				sunlight_propagates = false,
				paramtype = 'light',
				paramtype2 = "facedir",
				node_box = {
					type = "fixed",
					fixed = {
						{-0.2,-0.5,-0.2, 0.2,-0.45,0.5},
						{-0.1,-0.45,-0.1, 0.1,0,0.5},
						{-0.3,-0.2,-0.3, 0.3,0,0.35},
						{-0.25,0,-0.25, 0.25,0.05,0.25},
						{-0.3,0,0.3, 0.3,0.4,0.5},
						{-0.05,0.4,0.35, 0.05,0.45,0.45},
					},
				},
				drop ="3dforniture:toilet",
				groups = {cracky=3,},
				sounds = hades_sounds.node_sound_stone_defaults(),
				on_rightclick = function (pos, node, clicker)
					minetest.add_node(pos, {name="3dforniture:toilet_open", param2=node.param2})
				end,
			})

			minetest.register_node("3dforniture:toilet_open",
				{
				tiles = {
					"forniture_marble_top_toilet.png", "forniture_marble.png",
					"forniture_marble_sb1.png", "forniture_marble_sb1.png",
					"forniture_marble_sb2.png", "forniture_marble_sb2.png",
				},
				drawtype = "nodebox",
				sunlight_propagates = false,
				paramtype = 'light',
				paramtype2 = 'facedir',
				node_box = {
					type = "fixed",
					fixed = {
						{-0.2,-0.5,-0.2, 0.2,-0.45,0.5},
						{-0.1,-0.45,-0.1, 0.1,-0.2,0.5},
						{-0.1,-0.2,0.3, 0.1,0,0.5},
						{-0.3,-0.2,0.1, 0.3,0,0.35},
						{-0.3,-0.2,-0.3, -0.1,-0.15,0.1},
						{-0.1,-0.2,-0.3, 0.1,-0.15,-0.1},
						{0.1,-0.2,-0.3, 0.3,-0.15,0.1},
						{-0.3,-0.15,-0.3, -0.2,0,0.1},
						{-0.2,-0.15,-0.3, 0.2,0,-0.2},
						{0.2,-0.15,-0.3, 0.3,0,0.1},
						{-0.25,0,0.2, 0.25,0.5,0.25},
						{-0.3,0,0.3, 0.3,0.4,0.5},
					},
				},
				drop = "3dforniture:toilet",
				groups = {cracky = 3,not_in_creative_inventory=1},
				sounds = hades_sounds.node_sound_stone_defaults(),
				on_rightclick = function (pos, node, clicker)
					minetest.add_node(pos, {name="3dforniture:toilet", param2=node.param2})
					minetest.sound_play("3dforniture_dig_toilet", {gain=0.5, pos=pos}, false)
				end,
			})

			--Sink
			minetest.register_node("3dforniture:sink",
				{description = 'Sink',
				tiles = {
					"forniture_marble_top_sink.png", "forniture_marble.png",
					"forniture_marble_sb1.png", "forniture_marble_sb1.png",
					"forniture_marble_sb2.png", "forniture_marble_sb2.png",
				},
				inventory_image = "3dforniture_inv_sink.png",
				drawtype = "nodebox",
				sunlight_propagates = true,
				paramtype = 'light',
				paramtype2 = 'facedir',
				node_box = {
					type = "fixed",
					fixed = {
						{-0.15,0.35,0.2,0.15,0.4,0.5},
						{-0.25,0.4,0.4, 0.25,0.45,0.5},
						{-0.25,0.4,0.15, -0.15,0.45,0.4},
						{0.15,0.4,0.15, 0.25,0.45,0.4},
						{-0.15,0.4,0.15, 0.15,0.45,0.2},
						{-0.3,0.45,0.4, 0.3,0.5,0.5},
						{-0.3,0.45,0.1, -0.25,0.5,0.4},
						{0.25,0.45,0.1, 0.3,0.5,0.4},
						{-0.25,0.45,0.1, 0.25,0.5,0.15},
					},
				},
				selection_box = {
					type = "fixed",
					fixed = {-0.3,0.35,0.1, 0.3,0.5,0.5},
				},
				groups = {cracky=2,},
				sounds = hades_sounds.node_sound_stone_defaults(),
			})

			--Taps
			minetest.register_node("3dforniture:taps",
				{ description = 'Taps',
				tiles = {
					"forniture_metal.png", "forniture_metal.png",
					"forniture_metal_s1.png", "forniture_metal_s1.png",
					"forniture_metal_s2.png", "forniture_metal_s2.png",
				},
				inventory_image = "3dforniture_inv_taps.png",
				drawtype = "nodebox",
				sunlight_propagates = true,
				paramtype = 'light',
				paramtype2 = 'facedir',
				node_box = {
					type = "fixed",
					fixed = {
						--Base
						{-0.25,-0.45,0.49, 0.25,-0.3,0.5},
						{-0.05,-0.4,0.25, 0.05,-0.35,0.5},
						{-0.05,-0.425,0.25,0.05,-0.4,0.3},

						--taps 1
						{-0.2,-0.4,0.45, -0.15,-0.35,0.5},
						{-0.2,-0.45,0.4, -0.15,-0.3,0.45},
						{-0.25,-0.4,0.4, -0.1,-0.35,0.45},

						--taps 2 
						{0.15,-0.4,0.45, 0.2,-0.35,0.5},
						{0.15,-0.45,0.4, 0.2,-0.3,0.45},
						{0.1,-0.4,0.4, 0.25,-0.35,0.45},
					},
				},
				selection_box = {
					type = "fixed",
					fixed = {-0.25,-0.45,0.25, 0.25,-0.3,0.5},
				},
				groups = {cracky=2,},
				sounds = hades_sounds.node_sound_metal_defaults(),
			})

			--Shower Tray
			minetest.register_node("3dforniture:shower_tray",
				{ description = 'Shower Tray',
				tiles = {
					"forniture_marble_base_ducha_top.png",
					"forniture_marble_base_ducha_top.png",
					"forniture_marble_sb1.png",
					"forniture_marble_sb1.png",
					"forniture_marble_sb2.png",
					"forniture_marble_sb2.png",
				},
				inventory_image = "3dforniture_inv_shower_tray.png",
				drawtype = "nodebox",
				sunlight_propagates = true,
				paramtype = 'light',
				paramtype2 = 'facedir',
				legacy_facedir_simple = true,
				node_box = {
					type = "fixed",
					fixed = {
						{-0.5,-0.5,-0.5, 0.5,-0.45,0.5},
						{-0.5,-0.45,-0.5, 0.5,-0.4,-0.45},
						{-0.5,-0.45,0.45, 0.5,-0.4,0.5},
						{-0.5,-0.45,-0.45, -0.45,-0.4,0.45},
						{0.45,-0.45,-0.45, 0.5,-0.4,0.45},
					},
				},
				selection_box = {
					type = "fixed",
					fixed = {-0.5,-0.5,-0.5, 0.5,-0.4,0.5},
				},
				groups = {cracky=2,},
				sounds = hades_sounds.node_sound_stone_defaults(),
			})

			--Shower Head
			minetest.register_node("3dforniture:shower_head",
				{description = 'Shower Head',
				tiles = {
					"forniture_metal.png",
					"forniture_metal.png",
					"forniture_metal_s1.png",
					"forniture_metal_s1.png",
					"forniture_metal_s2.png",
					"forniture_metal_s2.png",
				},
				inventory_image = "3dforniture_inv_shower_head.png",
				drawtype = "nodebox",
				sunlight_propagates = true,
				paramtype = 'light',
				paramtype2 = 'facedir',
				node_box = {
					type = "fixed",
					fixed = {
						{-0.1,-0.5,0.1, 0.1,-0.4,0.3},
						{-0.05,-0.4,0.15, 0.05,-0.3,0.25},
						{-0.05,-0.35,0.25,0.05,-0.3,0.5},
						{-0.1,-0.4,0.49, 0.1,-0.25,0.5},
					},
				 },
				 selection_box = {
					type = "fixed",
					fixed = {-0.1,-0.5,0.1, 0.1,-0.25,0.5},
				},
				groups = {cracky=2,},
				sounds = hades_sounds.node_sound_metal_defaults(),
			})

	-- Medieval Forniture

		--Bars
		minetest.register_node("3dforniture:bars",
			{ description = 'Steel Bars',
			tiles = {
				"forniture_black_metal.png",
				"forniture_black_metal.png",
				"forniture_black_metal_s1.png",
				"forniture_black_metal_s1.png",
				"forniture_black_metal_s2.png",
				"forniture_black_metal_s2.png",
			},
			drawtype = "nodebox",
			sunlight_propagates = true,
			paramtype = 'light',
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.5,-0.5,-0.1, -0.4,0.5,0.1},
					{-0.1,-0.5,-0.1, 0.1,0.5,0.1},
					{0.4,-0.5,-0.1, 0.5,0.5,0.1},
					{-0.5,-0.5,-0.05, 0.5,-0.45,0.05},
					{-0.5,0.45,-0.05, 0.5,0.5,0.05}
				},
			},
			selection_box = {
				type = "fixed",
				fixed = {-0.5, -0.5, -0.1, 0.5, 0.5, 0.1},
			},
			groups = {cracky=1},
			sounds = hades_sounds.node_sound_metal_defaults(),
		})

		--L Binding Bars
		minetest.register_node("3dforniture:L_binding_bars",
			{ description ='Binding Steel Bars',
			tiles = {
				"forniture_black_metal.png",
				"forniture_black_metal.png",
				"forniture_black_metal_s1.png",
				"forniture_black_metal_s1.png",
				"forniture_black_metal_s2.png",
				"forniture_black_metal_s2.png",
			},
			drawtype = "nodebox",
			sunlight_propagates = true,
			paramtype = 'light',
			paramtype2 ="facedir",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.1,-0.5,-0.5,0.1,0.5,-0.4},
					{-0.15,-0.5,-0.15, 0.15,0.5,0.15},
					{0.4,-0.5,-0.1, 0.5,0.5,0.1},
					{0,-0.5,-0.05, 0.5,-0.45,0.05},
					{-0.05,-0.5,-0.5, 0.05,-0.45,0},
					{0,0.45,-0.05, 0.5,0.5,0.05},
					{-0.05,0.45,-0.5, 0.05,0.5,0},
				},
			},
			groups = {cracky=1,},
			sounds = hades_sounds.node_sound_metal_defaults(),
		})

		--Chains
		minetest.register_node("3dforniture:chains",
			{ description = 'Chains',
			tiles = {
				"forniture_black_metal.png",
				"forniture_black_metal.png",
				"forniture_black_metal_s1.png",
				"forniture_black_metal_s1.png",
				"forniture_black_metal_s2.png",
				"forniture_black_metal_s2.png",
			},
			inventory_image = "3dforniture_inv_chains.png",
			drawtype = "nodebox",
			sunlight_propagates = true,
			paramtype = 'light',
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
					--chain a

					--supporting
					{-0.45,0.25,0.45, -0.2,0.5,0.5},
					{-0.35,0.4,0.35, -0.3,0.45,0.45},
					{-0.35,0.3,0.35, -0.3,0.35,0.45},
					{-0.35,0.35,0.3, -0.3,0.4,0.35},

					--link 1
					{-0.4,0.35,0.35, -0.25,0.4,0.4},
					{-0.4,0.15,0.35, -0.25,0.2,0.4},
					{-0.45,0.2,0.35, -0.4,0.35,0.4},
					{-0.25,0.2,0.35, -0.2,0.35,0.4},

					--link 2
					{-0.35,0.2,0.3, -0.3,0.25,0.45},
					{-0.35,0,0.3, -0.3,0.05,0.45},
					{-0.35,0.05,0.25, -0.3,0.2,0.3},
					{-0.35,0.05,0.45, -0.3,0.2,0.5},

					--link 3
					{-0.4,0.05,0.35, -0.25,0.1,0.4},
					{-0.4,-0.15,0.35, -0.25,-0.1,0.4},
					{-0.45,-0.1,0.35, -0.4,0.05,0.4},
					{-0.25,-0.1,0.35, -0.2,0.05,0.4},

					--link 4
					{-0.35,-0.1,0.3, -0.3,-0.05,0.45},
					{-0.35,-0.3,0.3, -0.3,-0.25,0.45},
					{-0.35,-0.25,0.25, -0.3,-0.1,0.3},
					{-0.35,-0.25,0.45, -0.3,-0.1,0.5},

					--link 5
					{-0.4,-0.25,0.35, -0.25,-0.2,0.4},
					{-0.4,-0.45,0.35, -0.25,-0.4,0.4},
					{-0.45,-0.4,0.35, -0.4,-0.25,0.4},
					{-0.25,-0.4,0.35, -0.2,-0.25,0.4},

				--chain b

					--supporting
					{0.2,0.25,0.45, 0.45,0.5,0.5},
					{0.3,0.4,0.35,0.35,0.45,0.45},
					{0.3,0.3,0.35, 0.35,0.35,0.45},
					{0.3,0.35,0.3, 0.35,0.4,0.35},

					--link 1
					{0.25,0.35,0.35, 0.4,0.4,0.4},
					{0.25,0.15,0.35, 0.4,0.2,0.4},
					{0.2,0.2,0.35, 0.25,0.35,0.4},
					{0.4,0.2,0.35, 0.45,0.35,0.4},

					--link 2
					{0.3,0.2,0.3, 0.35,0.25,0.45},
					{0.3,0,0.3, 0.35,0.05,0.45},
					{0.3,0.05,0.25, 0.35,0.2,0.3},
					{0.3,0.05,0.45, 0.35,0.2,0.5},

					--link 3
					{0.25,0.05,0.35, 0.4,0.1,0.4},
					{0.25,-0.15,0.35, 0.4,-0.1,0.4},
					{0.2,-0.1,0.35, 0.25,0.05,0.4},
					{0.4,-0.1,0.35, 0.45,0.05,0.4},

					--link 4
					{0.3,-0.1,0.3, 0.35,-0.05,0.45},
					{0.3,-0.3,0.3, 0.35,-0.25,0.45},
					{0.3,-0.25,0.25, 0.35,-0.1,0.3},
					{0.3,-0.25,0.45, 0.35,-0.1,0.5},

					---link 5
					{0.25,-0.25,0.35, 0.4,-0.2,0.4},
					{0.25,-0.45,0.35,0.4,-0.4,0.4},
					{0.2,-0.4,0.35, 0.25,-0.25,0.4},
					{0.4,-0.4,0.35, 0.45,-0.25,0.4},
				},
			},
			selection_box = {
				type = "fixed",
				fixed = {-1/2, -1/2, 1/4, 1/2, 1/2, 1/2}, },
			groups = {cracky=1},
			sounds = hades_sounds.node_sound_metal_defaults(),
		})  
