local S = minetest.get_translator("hades_furniture")

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

--[[ ----- Basic furniture ----- ]]

	-- Table and chair
	local furniture_colors = {
		{"", S("Table"), S("Chair")},
		{"_black", S("Black Table"), S("Black Chair")},
		{"_white", S("White Table"), S("White Chair")},
	}
	for f=1, #furniture_colors do
		local append = furniture_colors[f][1]
		local desc_t = furniture_colors[f][2]
		local desc_c = furniture_colors[f][3]

		-- Table
		minetest.register_node("hades_furniture:table"..append,
			{description = desc_t,
			tiles = {
				"hades_furniture_wood"..append..".png",
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
			groups = {table=1, snappy=2,choppy=2,oddly_breakable_by_hand=2},
			sounds = hades_sounds.node_sound_wood_defaults(),
		})
		
		-- Chair
		minetest.register_node("hades_furniture:chair"..append,
			{ description = desc_c,
			tiles = {
				"hades_furniture_wood"..append..".png",
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
			groups = {chair=1, snappy=2,choppy=2,oddly_breakable_by_hand=2},
			sounds = hades_sounds.node_sound_wood_defaults(),
		})
	end

	local armchair_colors = {
		{"", S("Black Armchair")},
		{"_white", S("White Armchair")},
		{"_red", S("Red Armchair")},
		{"_brown", S("Brown Armchair")},
		{"_blue", S("Blue Armchair")},
		{"_dark_green", S("Dark Green Armchair")},
	}

	-- Armchair
	for a=1, #armchair_colors do
		local append = armchair_colors[a][1]
		local desc = armchair_colors[a][2]
		minetest.register_node("hades_furniture:armchair"..append,
			{ description = desc,
			tiles = {
				"hades_furniture_armchair_top"..append..".png",
				"hades_furniture_armchair_top"..append..".png",
				"hades_furniture_armchair_lat1"..append..".png",
				"hades_furniture_armchair_lat1"..append..".png",
				"hades_furniture_armchair_lat2"..append..".png",
				"hades_furniture_armchair_lat2"..append..".png",
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
			groups = {armchair=1, snappy=2,choppy=2,oddly_breakable_by_hand=2},
			sounds = hades_sounds.node_sound_wood_defaults(),
		})
	end

	-- Table Lamp
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
			drop = "hades_furniture:table_lamp_off"
			not_in_creative_inventory = 1
		end
		minetest.register_node("hades_furniture:table_lamp_"..lamps[l][1], {
			description = S("Table Lamp"),
			_tt_help = S("4 different luminance levels"),
			drawtype = "nodebox",
			tiles = {
				"hades_furniture_table_lamp_s.png",
				"hades_furniture_table_lamp_s.png",
				"hades_furniture_table_lamp_l.png",
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
				minetest.sound_play({name="hades_furniture_table_lamp_switch"}, {pos=pos, gain=0.35, max_hear_distance=6})
				minetest.set_node(pos, {name="hades_furniture:table_lamp_"..lamps[l][2]})
			end,
			on_rotate = "simple",
		})

	end

--[[ ----- Bathroom Kit -----]]

	-- Toilet
	minetest.register_node("hades_furniture:toilet",
		{ description = S("Toilet"),
		tiles = {
			"hades_furniture_marble.png", "hades_furniture_marble.png",
			"hades_furniture_marble_sb1.png", "hades_furniture_marble_sb1.png",
			"hades_furniture_marble_sb2.png", "hades_furniture_marble_sb2.png",
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
				{-0.05,0.4,0.35, 0.05,0.45,0.45}, -- flush button
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.2,-0.5,-0.2, 0.2,-0.45,0.5},

				{-0.1,-0.2,0.35, 0.1,0.0,0.5},
				{-0.1,-0.45,-0.1, 0.1,-0.2,0.5},

				{-0.3,-0.2,-0.3, 0.3,0,0.35},
				{-0.25,0,-0.25, 0.25,0.05,0.25},
				{-0.3,0,0.3, 0.3,0.4,0.5},
				{-0.05,0.4,0.35, 0.05,0.45,0.45}, -- flush button
			},
		},

		drop ="hades_furniture:toilet",
		groups = {cracky=3,},
		sounds = hades_sounds.node_sound_stone_defaults(),
		on_rightclick = function (pos, node, clicker)
			minetest.add_node(pos, {name="hades_furniture:toilet_open", param2=node.param2})
		end,
		on_rotate = "simple",
	})
	minetest.register_node("hades_furniture:toilet_open",
		{
		tiles = {
			"hades_furniture_marble_top_toilet.png", "hades_furniture_marble.png",
			"hades_furniture_marble_sb1.png", "hades_furniture_marble_sb1.png",
			"hades_furniture_marble_sb2.png", "hades_furniture_marble_sb2.png",
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
				{-0.05,0.4,0.35, 0.05,0.45,0.45}, -- flush button
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.2,-0.5,-0.2, 0.2,-0.45,0.5},

				{-0.1,-0.2,0.35, 0.1,0.0,0.5},
				{-0.1,-0.45,-0.1, 0.1,-0.2,0.5},

				{-0.3,-0.2,-0.3, 0.3,0,0.35},
				{-0.3,0,0.3, 0.3,0.4,0.5},
				{-0.25,0,0.2, 0.25,0.5,0.25},
				{-0.05,0.4,0.35, 0.05,0.45,0.45}, -- flush button
			},
		},
		drop = "hades_furniture:toilet",
		groups = {cracky = 3,not_in_creative_inventory=1},
		sounds = hades_sounds.node_sound_stone_defaults(),
		on_rightclick = function (pos, node, clicker)
			minetest.add_node(pos, {name="hades_furniture:toilet", param2=node.param2})
			minetest.sound_play("hades_furniture_toilet", {gain=0.5, pos=pos}, false)
		end,
		on_rotate = "simple",
	})

	-- Sink
	minetest.register_node("hades_furniture:sink",
		{description = S("Sink"),
		tiles = {
			"hades_furniture_marble_top_sink.png", "hades_furniture_marble.png",
			"hades_furniture_marble_sb1.png", "hades_furniture_marble_sb1.png",
			"hades_furniture_marble_sb2.png", "hades_furniture_marble_sb2.png",
		},
		inventory_image = "hades_furniture_inv_sink.png",
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
		on_rotate = "simple",
	})

	-- Taps
	minetest.register_node("hades_furniture:taps",
		{ description = S("Taps"),
		tiles = {
			"hades_furniture_metal.png", "hades_furniture_metal.png",
			"hades_furniture_metal_s1.png", "hades_furniture_metal_s1.png",
			"hades_furniture_metal_s2.png", "hades_furniture_metal_s2.png",
		},
		inventory_image = "hades_furniture_inv_taps.png",
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

				--tap 1
				{-0.2,-0.4,0.45, -0.15,-0.35,0.5},
				{-0.2,-0.45,0.4, -0.15,-0.3,0.45},
				{-0.25,-0.4,0.4, -0.1,-0.35,0.45},

				--tap 2
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
		on_rotate = "simple",
	})

	-- Shower Tray
	minetest.register_node("hades_furniture:shower_tray",
		{ description = S("Shower Tray"),
		tiles = {
			"hades_furniture_marble_base_ducha_top.png",
			"hades_furniture_marble_base_ducha_top.png",
			"hades_furniture_marble_sb1.png",
			"hades_furniture_marble_sb1.png",
			"hades_furniture_marble_sb2.png",
			"hades_furniture_marble_sb2.png",
		},
		inventory_image = "hades_furniture_inv_shower_tray.png",
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
		on_rotate = "simple",
	})

	-- Shower Head
	minetest.register_node("hades_furniture:shower_head",
		{description = S("Shower Head"),
		tiles = {
			"hades_furniture_metal.png",
			"hades_furniture_metal.png",
			"hades_furniture_metal_s1.png",
			"hades_furniture_metal_s1.png",
			"hades_furniture_metal_s2.png",
			"hades_furniture_metal_s2.png",
		},
		inventory_image = "hades_furniture_inv_shower_head.png",
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
		on_rotate = "simple",
	})

--[[ ----- Medieval theme -----]]

	-- Steel Bars
	minetest.register_node("hades_furniture:bars",
		{ description = S("Steel Bars"),
		tiles = {
			"hades_furniture_black_metal.png",
			"hades_furniture_black_metal.png",
			"hades_furniture_black_metal_s1.png",
			"hades_furniture_black_metal_s1.png",
			"hades_furniture_black_metal_s2.png",
			"hades_furniture_black_metal_s2.png",
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
		on_rotate = "simple",
	})

	-- L Binding Bars (corner)
	minetest.register_node("hades_furniture:L_binding_bars",
		{ description =S("Binding Steel Bars"),
		tiles = {
			"hades_furniture_black_metal.png",
			"hades_furniture_black_metal.png",
			"hades_furniture_black_metal_s1.png",
			"hades_furniture_black_metal_s1.png",
			"hades_furniture_black_metal_s2.png",
			"hades_furniture_black_metal_s2.png",
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
		on_rotate = "simple",
	})

	-- Chains
	minetest.register_node("hades_furniture:chains",
		{ description = S("Chains"),
		tiles = {
			"hades_furniture_black_metal.png",
			"hades_furniture_black_metal.png",
			"hades_furniture_black_metal_s1.png",
			"hades_furniture_black_metal_s1.png",
			"hades_furniture_black_metal_s2.png",
			"hades_furniture_black_metal_s2.png",
		},
		inventory_image = "hades_furniture_inv_chains.png",
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
			fixed = {
				{-0.45, -0.45, 1/4, -0.2, 1/2, 1/2},
				{0.2, -0.45, 1/4, 0.45, 1/2, 1/2},
			},
		},
		groups = {cracky=1},
		sounds = hades_sounds.node_sound_metal_defaults(),
		on_rotate = "simple",
	})

	minetest.register_node("hades_furniture:plant_pot", {
		description = S("Plant Pot"),
		paramtype = "light",
		tiles = {"hades_furniture_plant_pot_top.png", "hades_furniture_plant_pot_bottom.png", "hades_furniture_plant_pot_sides.png"},
		is_ground_content = false,
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5,-0.5,-3/16, 0.5,0.5,3/16},
				{-7/16,-0.5,-5/16, 7/16,0.5,5/16},
				{-6/16,-0.5,-6/16, 6/16,0.5,6/16},
				{-5/16,-0.5,-7/16, 5/16,0.5,7/16},
				{-3/16,-0.5,-0.5, 3/16,0.5,0.5},
			},
		},
		groups = {cracky=3},
		sounds = hades_sounds.node_sound_stone_defaults({
			footstep = hades_sounds.node_sound_dirt_defaults().footstep,
		}),
	})


