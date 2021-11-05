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
	{"_uncolored", S("Uncolored Table"), S("Uncolored Chair")},
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
		is_ground_content = false,
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
		groups = {table=1, choppy=3,oddly_breakable_by_hand=2},
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
		is_ground_content = false,
		_hades_itemshow_offset = { x=-0.118, y=0, z=-0.118 },
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
		groups = {chair=1, choppy=3,oddly_breakable_by_hand=2},
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
		is_ground_content = false,
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
		groups = {armchair=1, choppy=3,oddly_breakable_by_hand=2},
		sounds = hades_sounds.node_sound_wood_defaults({
			footstep = hades_sounds.node_sound_cloth_defaults().footstep,
		}),
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
	local drop, not_in_creative_inventory, tt, desc
	if l ~= 1 then
		drop = "hades_furniture:table_lamp_off"
		not_in_creative_inventory = 1
		desc = S("Table Lamp (level @1)", l)
	else
		tt = S("4 different luminance levels")
		desc = S("Table Lamp")
	end
	minetest.register_node("hades_furniture:table_lamp_"..lamps[l][1], {
		description = desc,
		_tt_help = tt,
		drawtype = "nodebox",
		tiles = {
			"hades_furniture_table_lamp_s.png",
			"hades_furniture_table_lamp_s.png",
			"hades_furniture_table_lamp_l.png",
		},
		use_texture_alpha = "clip",
		paramtype = 'light',
		paramtype2 = 'facedir',
		is_ground_content = false,
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
		sounds = hades_sounds.node_sound_wood_defaults(),
		on_rightclick = function(pos, node, clicker)
			minetest.sound_play({name="hades_furniture_table_lamp_switch"}, {pos=pos, gain=0.35, max_hear_distance=6})
			minetest.set_node(pos, {name="hades_furniture:table_lamp_"..lamps[l][2]})
		end,
		on_rotate = "simple",
	})

end

--[[ ----- Medieval theme -----]]

-- Steel Bars (only straight section)

local bars = {
	{ "bars", "L_binding_bars", S("Straight Steel Bars"), S("Binding Steel Bars"), { "hades_furniture_black_metal_s1.png" } },
	{ "rusty_bars", "binding_rusty_bars", S("Straight Rusty Bars"), S("Binding Rusty Bars"), { "columnia_rusty.png" } },
}

for b=1, #bars do
	local bar = bars[b]
	local id = bar[1]
	local id2 = bar[2]
	local desc1 = bar[3]
	local desc2 = bar[4]
	local tiles = bar[5]

	minetest.register_node("hades_furniture:"..id, {
		description = desc1,
		tiles = tiles,
		drawtype = "nodebox",
		sunlight_propagates = true,
		paramtype = 'light',
		paramtype2 = 'facedir',
		is_ground_content = false,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.1,-0.5,-0.1, 0.1,0.5,0.1}, -- center bar
				{0.4,-0.5,-0.1, 0.5,0.5,0.1}, -- right bar
				{0.1,-0.5,-0.05, 0.4,-0.45,0.05}, -- right low rail
				{0.1,0.45,-0.05, 0.4,0.5,0.05}, -- right high rail
				{-0.5,-0.5,-0.1, -0.4,0.5,0.1}, -- left bar
				{-0.4,-0.5,-0.05, -0.1,-0.45,0.05}, -- left low rail
				{-0.4,0.45,-0.05, -0.1,0.5,0.05}, -- left high rail
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {-0.5,-0.5,-0.15, 0.5,0.5,0.15},
		},
		groups = {metal_bars=1, cracky=1},
		sounds = hades_sounds.node_sound_metal_defaults(),
		on_rotate = "simple",
		_hades_shaper_next = "hades_furniture:"..id2,
	})

	-- Binding bars (for corners and junctions).
	-- Also, center bar is slightly thicker
	minetest.register_node("hades_furniture:"..id2,
		{
		description = desc2,
		tiles = tiles,
		drawtype = "nodebox",
		sunlight_propagates = true,
		paramtype = 'light',
		is_ground_content = false,
		connects_to = {"group:metal_bars", "hades_core:steelblock", "columnia:rusty_block"},
		connect_sides = { "left", "right", "front", "back" },
		node_box = {
			type = "connected",
			fixed = {
				{-0.15,-0.5,-0.15, 0.15,0.5,0.15}, -- center bar
			},
			connect_right = {
				{0.4,-0.5,-0.1, 0.5,0.5,0.1}, -- bar
				{0.15,-0.5,-0.05, 0.4,-0.45,0.05}, -- low rail
				{0.15,0.45,-0.05, 0.4,0.5,0.05}, -- high rail
			},
			connect_left = {
				{-0.5,-0.5,-0.1, -0.4,0.5,0.1}, -- bar
				{-0.4,-0.5,-0.05, -0.15,-0.45,0.05}, -- low rail
				{-0.4,0.45,-0.05, -0.15,0.5,0.05}, -- high rail
			},
			connect_front = {
				{-0.1,-0.5,-0.5,0.1,0.5,-0.4}, -- bar
				{-0.05,-0.5,-0.4, 0.05,-0.45,-0.15}, -- low rail
				{-0.05,0.45,-0.4, 0.05,0.5,-0.15}, -- high rail
			},
			connect_back = {
				{-0.1,-0.5,0.4,0.1,0.5,0.5}, -- bar
				{-0.05,-0.5,0.15, 0.05,-0.45,0.4}, -- low rail
				{-0.05,0.45,0.15, 0.05,0.5,0.4}, -- high rail
			},
		},
		collision_box = {
			type = "connected",
			fixed = {
				{-0.15,-0.5,-0.15, 0.15,0.5,0.15}, -- center bar
			},
			connect_right = {
				{0.15,-0.5,-0.15, 0.5,0.5,0.15},
			},
			connect_left = {
				{-0.5,-0.5,-0.15, -0.15,0.5,0.15},
			},
			connect_back = {
				{-0.15,-0.5,-0.15, 0.15,0.5,0.5},
			},
			connect_front = {
				{-0.15,-0.5,-0.5, 0.15,0.5,-0.15},
			},

		},
		groups = {metal_bars=1, cracky=1,},
		sounds = hades_sounds.node_sound_metal_defaults(),
		_hades_shaper_next = "hades_furniture:"..id,
	})
end

minetest.register_node("hades_furniture:plant_pot", {
	description = S("Plant Pot"),
	paramtype = "light",
	tiles = {"hades_furniture_plant_pot_top.png", "hades_furniture_plant_pot_bottom.png", "hades_furniture_plant_pot_sides.png"},
	is_ground_content = false,
	drawtype = "nodebox",
	is_ground_content = false,
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
	collision_box = {
		type = "fixed",
		fixed = {{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 }},
	},
	groups = {cracky=3},
	sounds = hades_sounds.node_sound_stone_defaults({
		footstep = hades_sounds.node_sound_dirt_defaults().footstep,
	}),
})


