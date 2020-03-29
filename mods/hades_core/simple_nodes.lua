-- mods/default/nodes.lua

local WATER_ALPHA = 160
local WATER_VISC = 1
local LAVA_VISC = 7
local LIGHT_MAX = minetest.LIGHT_MAX - 1

minetest.register_node("hades_core:stone", {
	description = "Stone",
	tiles = {"default_stone.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=1, porous=1},
	drop = 'hades_core:cobble',
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:mossystone", {
	description = "Mossy Stone",
	tiles = {"default_mossystone.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=1, porous=1},
	drop = 'hades_core:mossycobble',
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:chondrite", {
	description = "Chondrite",
	tiles = {"default_chondrite.png"},
	is_ground_content = true,
	groups = {cracky=2, stone=1, porous=1},
	drop = 'hades_core:chondrite',
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:chondrite_block", {
	description = "Chondrite Block",
	tiles = {"default_chondrite_block.png"},
	is_ground_content = false,
	groups = {cracky=2},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:chondrite_brick", {
	description = "Chondrite Brick",
	tiles = {"default_chondrite_brick.png"},
	groups = {cracky=2, stone=1},
	is_ground_content = false,
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:tuff", {
	description = "Tuff",
	tiles = {"default_tuff.png"},
	is_ground_content = true,
	groups = {cracky=3, porous=1},
	drop = 'hades_core:tuff',
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:tuff_block", {
	description = "Tuff Block",
	tiles = {"default_tuff_block.png"},
	is_ground_content = false,
	groups = {cracky=3},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:tuff_brick", {
	description = "Tuff Brick",
	tiles = {"default_tuff_brick.png"},
	groups = {cracky=3},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:tuff_baked", {
	description = "Burned Tuff",
	tiles = {"default_tuff_baked.png"},
	is_ground_content = true,
	groups = {cracky=3, porous=1, burned_node=1},
	drop = 'hades_core:tuff_baked',
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:tuff_baked_block", {
	description = "Burned Tuff Block",
	tiles = {"default_tuff_baked_block.png"},
	is_ground_content = false,
	groups = {cracky=3, burned_node=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:tuff_baked_brick", {
	description = "Burned Tuff Brick",
	tiles = {"default_tuff_baked_brick.png"},
	groups = {cracky=3, burned_node=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:mossytuff", {
	description = "Mossy Tuff",
	tiles = {"default_mossytuff.png"},
	is_ground_content = true,
	groups = {cracky=3, porous=1, mossy=1},
	drop = 'hades_core:mossytuff',
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:marble", {
	description = "Marble",
	tiles = {"default_marble.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=1, porous=1},
	drop = 'hades_core:marble',
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:marble_block", {
	description = "Marble Block",
	tiles = {"default_marble_block.png"},
	is_ground_content = false,
	groups = {cracky=3},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:marble_brick", {
	description = "Marble Brick",
	tiles = {"default_marble_brick.png"},
	groups = {cracky=3, stone=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:essexite", {
	description = "Essexite",
	tiles = {"default_essexite.png"},
	is_ground_content = true,
	groups = {cracky=1, stone=1, porous=1},
	drop = 'hades_core:essexite',
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:essexite_block", {
	description = "Essexite Block",
	tiles = {"default_essexite_block.png"},
	is_ground_content = false,
	groups = {cracky=2,},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:essexite_brick", {
	description = "Essexite Brick",
	tiles = {"default_essexite_brick.png"},
	groups = {cracky=1, stone=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:stone_baked", {
	description = "Burned Stone",
	tiles = {"default_stone_baked.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=1, porous=1, burned_node=1},
	drop = "hades_core:cobble_baked",
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:stone_block_baked", {
	description = "Burned Stone Block",
	tiles = {"default_stone_block_baked.png"},
	is_ground_content = false,
	groups = {cracky=3, burned_node=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:obsidianbrick", {
	description = "Obsidian Brick",
	tiles = {"default_obsidian_brick.png"},
	sounds = hades_sounds.node_sound_stone_defaults(),
	groups = {cracky=1,level=2},
})
-- floors

minetest.register_node("hades_core:floor_chondrite_stone", {
	description = "Chondrite/Stone Block",
	tiles = {"default_floor_chondrite_stone.png"},
	is_ground_content = false,
	groups = {cracky=3, stone=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:floor_chondrite_stone2", {
	description = "Chondrite/Stone Tile",
	tiles = {
		"default_floor_chondrite_stone2.png",
		"default_floor_chondrite_stone2.png",
		"default_floor_chondrite_stone2.png",
		"default_floor_chondrite_stone2.png",
		"default_floor_chondrite_stone2.png^[transformFX",
	},
	is_ground_content = false,
	groups = {cracky=3, stone=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:floor_bstone_stone", {
	description = "Burned Stone/Stone Tile",
	tiles = {
		"default_floor_bstone_stone.png",
		"default_floor_bstone_stone.png",
		"default_floor_bstone_stone.png",
		"default_floor_bstone_stone.png",
		"default_floor_bstone_stone.png^[transformFX",
	},
	is_ground_content = false,
	groups = {cracky=3, stone=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:floor_btuff_tuff", {
	description = "Burned Tuff/Tuff Tile",
	tiles = {
		"default_floor_btuff_tuff.png",
		"default_floor_btuff_tuff.png",
		"default_floor_btuff_tuff.png",
		"default_floor_btuff_tuff.png",
		"default_floor_btuff_tuff.png^[transformFX",
	},
	is_ground_content = false,
	groups = {cracky=3},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:floor_bstone_sandstone", {
	description = "Burned Stone/Sandstone Block",
	tiles = {
		"default_floor_bstone_sandstone.png",
		"default_floor_bstone_sandstone.png",
		"default_floor_bstone_sandstone.png",
		"default_floor_bstone_sandstone.png",
		"default_floor_bstone_sandstone.png^[transformR90",
	},
	is_ground_content = false,
	groups = {cracky=3},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:floor_bstone_sandstone2", {
	description = "Burned Stone/Sandstone Tile",
	tiles = {
		"default_floor_bstone_sandstone2.png",
		"default_floor_bstone_sandstone2.png",
		"default_floor_bstone_sandstone2.png",
		"default_floor_bstone_sandstone2.png",
		"default_floor_bstone_sandstone2.png^[transformR90",
	},
	is_ground_content = false,
	groups = {cracky=3},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:floor_marble_essexite", {
	description = "Marble/Essexite Tile",
	tiles = {
		"default_floor_marble_essexite.png",
		"default_floor_marble_essexite.png",
		"default_floor_marble_essexite.png",
		"default_floor_marble_essexite.png",
		"default_floor_marble_essexite.png^[transformR90",
	},
	is_ground_content = false,
	groups = {cracky=2, stone=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:floor_marble_essexite2", {
	description = "Marble/Essexite Block",
	tiles = {
		"default_floor_marble_essexite2.png",
		"default_floor_marble_essexite2.png",
		"default_floor_marble_essexite2.png",
		"default_floor_marble_essexite2.png",
		"default_floor_marble_essexite2.png^[transformR90",
	},
	is_ground_content = false,
	groups = {cracky=2, stone=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:floor_essexite_gold", {
	description = "Golden Essexite Block",
	tiles = {"default_floor_essexite_gold.png"},
	is_ground_content = false,
	groups = {cracky=2},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:floor_essexite_gold2", {
	description = "Golden Essexite Tile",
	tiles = {"default_floor_essexite_gold2.png"},
	is_ground_content = false,
	groups = {cracky=2},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

--minerals

minetest.register_node("hades_core:stone_with_coal", {
	description = "Coal Ore",
	tiles = {"default_stone.png^default_mineral_coal.png"},
	is_ground_content = true,
	groups = {cracky=3, porous=1, ore=1},
	drop = 'hades_core:coal_lump',
	sounds = hades_sounds.node_sound_stone_defaults(),
})


minetest.register_node("hades_core:stone_with_iron", {
	description = "Iron Ore",
	tiles = {"default_stone.png^default_mineral_iron.png"},
	is_ground_content = true,
	groups = {cracky=2, porous=1, ore=1},
	drop = 'hades_core:iron_lump',
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:stone_with_tin", {
	description = "Tin Ore",
	tiles = {"default_stone.png^default_mineral_tin.png"},
	is_ground_content = true,
	groups = {cracky=2, porous=1, ore=1},
	drop = 'hades_core:tin_lump',
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:stone_with_copper", {
	description = "Copper Ore",
	tiles = {"default_stone.png^default_mineral_copper.png"},
	is_ground_content = true,
	groups = {cracky=2, porous=1, ore=1},
	drop = 'hades_core:copper_lump',
	sounds = hades_sounds.node_sound_stone_defaults(),
})


minetest.register_node("hades_core:stone_with_mese", {
	description = "Mese Ore",
	tiles = {"default_stone.png^default_mineral_mese.png"},
	is_ground_content = true,
	groups = {cracky=1, porous=1, ore=1},
	drop = "hades_core:mese_crystal",
	sounds = hades_sounds.node_sound_stone_defaults(),
})


minetest.register_node("hades_core:stone_with_gold", {
	description = "Gold Ore",
	tiles = {"default_stone.png^default_mineral_gold.png"},
	is_ground_content = true,
	groups = {cracky=2, porous=1, ore=1},
	drop = "hades_core:gold_lump",
	sounds = hades_sounds.node_sound_stone_defaults(),
})


minetest.register_node("hades_core:stone_with_diamond", {
	description = "Diamond Ore",
	tiles = {"default_stone.png^default_mineral_diamond.png"},
	is_ground_content = true,
	groups = {cracky=1, porous=1, ore=1},
	drop = "hades_core:diamond",
	sounds = hades_sounds.node_sound_stone_defaults(),
})


minetest.register_node("hades_core:stonebrick", {
	description = "Stone Brick",
	tiles = {"default_stone_brick.png"},
	groups = {cracky=2, stone=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})


minetest.register_node("hades_core:stonebrick_baked", {
	description = "Burned Stone Brick",
	tiles = {"default_stone_brick_baked.png"},
	groups = {cracky=2, stone=1, burned_node=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})


minetest.register_node("hades_core:dirt_with_grass", {
	description = "Dirt with Grass",
	tiles = {"default_grass.png", "default_dirt.png", "default_dirt.png^default_grass_side.png"},
	is_ground_content = true,
	groups = {crumbly=3,soil=1,dirt=1, porous=1},
	drop = 'hades_core:dirt',
	sounds = hades_sounds.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.25},
	}),
})


minetest.register_node("hades_core:dirt", {
	description = "Dirt",
	tiles = {"default_dirt.png"},
	is_ground_content = true,
	groups = {crumbly=3,soil=1,dirt=1, porous=1},
	sounds = hades_sounds.node_sound_dirt_defaults(),
})


minetest.register_node("hades_core:ash", {
	description = "Volcanic Ash",
	tiles = {"default_ash.png"},
	is_ground_content = true,
	groups = {crumbly=3, falling_node=1, ash=1, porous=1},
	sounds = hades_sounds.node_sound_sand_defaults(),
})

minetest.register_node("hades_core:ash_block", {
	description = "Volcanic Ash Block",
	tiles = {"default_ash_block.png"},
	is_ground_content = false,
	groups = {crumbly=3},
	sounds = hades_sounds.node_sound_sand_defaults(),
})

minetest.register_node("hades_core:fertile_sand", {
	description = "Fertile Sand",
	tiles = {"default_fertile_sand.png"},
	is_ground_content = true,
	groups = {crumbly=3, falling_node=1, sand=1, porous=1},
	sounds = hades_sounds.node_sound_sand_defaults(),
})


minetest.register_node("hades_core:gravel", {
	description = "Gravel",
	tiles = {"default_gravel.png"},
	is_ground_content = true,
	groups = {crumbly=2, falling_node=1, porous=1},
	sounds = hades_sounds.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
})

minetest.register_node("hades_core:gravel_block", {
	description = "Gravel Block",
	tiles = {"default_gravel_block.png"},
	is_ground_content = false,
	groups = {crumbly=2},
	sounds = hades_sounds.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
})

minetest.register_node("hades_core:gravel_volcanic", {
	description = "Volcanic Gravel",
	tiles = {"default_gravel_volcanic.png"},
	is_ground_content = true,
	groups = {crumbly=1, porous=1},
	sounds = hades_sounds.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
})

minetest.register_node("hades_core:gravel_volcanic_block", {
	description = "Volcanic Gravel Block",
	tiles = {"default_gravel_volcanic_block.png"},
	is_ground_content = false,
	groups = {crumbly=2},
	sounds = hades_sounds.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
})


minetest.register_node("hades_core:sandstone", {
	description = "Sandstone",
	tiles = {"default_sandstone.png"},
	is_ground_content = true,
	groups = {crumbly=2,cracky=3,sandstone=1, porous=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})


minetest.register_node("hades_core:sandstonebrick", {
	description = "Sandstone Brick",
	tiles = {"default_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky=2},
	sounds = hades_sounds.node_sound_stone_defaults(),
})


minetest.register_node("hades_core:clay", {
	description = "Clay",
	tiles = {"default_clay.png"},
	is_ground_content = true,
	groups = {crumbly=3, porous=1},
	drop = 'hades_core:clay_lump 4',
	sounds = hades_sounds.node_sound_dirt_defaults(),
})


minetest.register_node("hades_core:brick", {
	description = "Uncolored Brick Block",
	tiles = {"default_brick.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

-- Colors are beautiful

minetest.register_node("hades_core:brick_black", {
	description = "Black Brick Block",
	tiles = {"default_brick_black.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_blue", {
	description = "Blue Brick Block",
	tiles = {"default_brick_blue.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_brown", {
	description = "Brown Brick Block",
	tiles = {"default_brick_brown.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_cyan", {
	description = "Cyan Brick Block",
	tiles = {"default_brick_cyan.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_dark_green", {
	description = "Dark Green Brick Block",
	tiles = {"default_brick_dark_green.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_dark_grey", {
	description = "Dark Grey Brick Block",
	tiles = {"default_brick_dark_grey.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_green", {
	description = "Green Brick Block",
	tiles = {"default_brick_green.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_grey", {
	description = "Grey Brick Block",
	tiles = {"default_brick_grey.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_magenta", {
	description = "Magenta Brick Block",
	tiles = {"default_brick_magenta.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_orange", {
	description = "Orange Brick Block",
	tiles = {"default_brick_orange.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_pink", {
	description = "Pink Brick Block",
	tiles = {"default_brick_pink.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_red", {
	description = "Red Brick Block",
	tiles = {"default_brick_red.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_violet", {
	description = "Violet Brick Block",
	tiles = {"default_brick_violet.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_white", {
	description = "White Brick Block",
	tiles = {"default_brick_white.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_yellow", {
	description = "Yellow Brick Block",
	tiles = {"default_brick_yellow.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})



minetest.register_node("hades_core:bookshelf", {
	description = "Bookshelf",
	tiles = {"default_wood.png", "default_wood.png", "default_bookshelf.png"},
	is_ground_content = false,
	groups = {choppy=3,oddly_breakable_by_hand=2,flammable=3},
	sounds = hades_sounds.node_sound_wood_defaults(),
})


minetest.register_node("hades_core:glass", {
	description = "Glass",
	drawtype = "glasslike",
	tiles = {"default_glass.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = hades_sounds.node_sound_glass_defaults(),
})

minetest.register_node("hades_core:rail", {
	description = "Rail",
	drawtype = "raillike",
	tiles = {"default_rail.png", "default_rail_curved.png", "default_rail_t_junction.png", "default_rail_crossing.png"},
	inventory_image = "default_rail.png",
	wield_image = "default_rail.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
                -- but how to specify the dimensions for curved and sideways rails?
                fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	groups = {dig_immediate=2,attached_node=1,rail=1,connect_to_raillike=minetest.raillike_group("rail")},
	sounds = hades_sounds.node_sound_metal_defaults(),
})

--- Liquids

minetest.register_node("hades_core:water_flowing", {
	description = "Flowing Water",
	drawtype = "flowingliquid",
	tiles = {"default_water.png"},
	special_tiles = {
		{
			image="default_water_flowing_animated.png",
			backface_culling=false,
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.8}
		},
		{
			image="default_water_flowing_animated.png",
			backface_culling=true,
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.8}
		},
	},
	alpha = WATER_ALPHA,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "hades_core:water_flowing",
	liquid_alternative_source = "hades_core:water_source",
	liquid_viscosity = WATER_VISC,
	post_effect_color = {a=64, r=100, g=100, b=200},
	groups = {water=3, liquid=3, puts_out_fire=1, not_in_creative_inventory=1},
	sounds = hades_sounds.node_sound_water_defaults(),
})


minetest.register_node("hades_core:water_source", {
	description = "Water Source",
	drawtype = "liquid",
	tiles = {
		{name="default_water_source_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0}}
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name="default_water_source_animated.png",
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0},
			backface_culling = false,
		}
	},
	alpha = WATER_ALPHA,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "hades_core:water_flowing",
	liquid_alternative_source = "hades_core:water_source",
	liquid_viscosity = WATER_VISC,
	post_effect_color = {a=64, r=100, g=100, b=200},
	groups = {water=3, liquid=3, puts_out_fire=1},
	sounds = hades_sounds.node_sound_water_defaults(),
})


minetest.register_node("hades_core:lava_flowing", {
	description = "Flowing Lava",
	drawtype = "flowingliquid",
	tiles = {"default_lava.png"},
	special_tiles = {
		{
			image="default_lava_flowing_animated.png",
			backface_culling=false,
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.3}
		},
		{
			image="default_lava_flowing_animated.png",
			backface_culling=true,
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.3}
		},
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	light_source = minetest.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "hades_core:lava_flowing",
	liquid_alternative_source = "hades_core:lava_source",
	liquid_viscosity = LAVA_VISC,
	liquid_renewable = true,
	damage_per_second = 2*2,
	post_effect_color = {a=192, r=255, g=64, b=0},
	groups = {lava=3, liquid=2, igniter=1, not_in_creative_inventory=1},
	sounds = hades_sounds.node_sound_lava_defaults(),
})


minetest.register_node("hades_core:lava_source", {
	description = "Lava Source",
	drawtype = "liquid",
	tiles = {
		{name="default_lava_source_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}}
	},
	special_tiles = {
		-- New-style lava source material (mostly unused)
		{
			name="default_lava_source_animated.png",
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0},
			backface_culling = false,
		}
	},
	paramtype = "light",
	light_source = minetest.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "hades_core:lava_flowing",
	liquid_alternative_source = "hades_core:lava_source",
	liquid_viscosity = LAVA_VISC,
	liquid_renewable = true,
	damage_per_second = 2*2,
	post_effect_color = {a=192, r=255, g=64, b=0},
	groups = {lava=3, liquid=2, igniter=1},
	sounds = hades_sounds.node_sound_lava_defaults(),
})

minetest.register_node("hades_core:cobble", {
	description = "Cobblestone",
	tiles = {"default_cobble.png"},
	is_ground_content = false,
	groups = {cracky=3, stone=2, porous=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:cobble_block", {
	description = "Cobblestone Block",
	tiles = {"default_cobble_block.png"},
	is_ground_content = false,
	groups = {cracky=3, stone=2},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:cobble_baked", {
	description = "Burned Cobblestone",
	tiles = {"default_cobble_baked.png"},
	is_ground_content = false,
	groups = {cracky=3, stone=2, porous=1, burned_node=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:cobble_block_baked", {
	description = "Burned Cobblestone Block",
	tiles = {"default_cobble_baked_block.png"},
	is_ground_content = false,
	groups = {cracky=3, stone=2, burned_node=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:mossycobble", {
	description = "Mossy Cobblestone",
	tiles = {"default_mossycobble.png"},
	is_ground_content = false,
	groups = {cracky=3, porous=1, mossy=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:coalblock", {
	description = "Coal Block",
	tiles = {"default_coal_block.png"},
	is_ground_content = false,
	groups = {cracky=3},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:steelblock", {
	description = "Steel Block",
	tiles = {"default_steel_block.png"},
	is_ground_content = false,
	groups = {cracky=1,level=2,metal=1},
	sounds = hades_sounds.node_sound_heavy_metal_defaults(),
})

minetest.register_node("hades_core:tinblock", {
	description = "Tin Block",
	tiles = {"default_tin_block.png"},
	is_ground_content = false,
	groups = {cracky=1,level=2,metal=1},
	sounds = hades_sounds.node_sound_heavy_metal_defaults(),
})

minetest.register_node("hades_core:copperblock", {
	description = "Copper Block",
	tiles = {"default_copper_block.png"},
	is_ground_content = false,
	groups = {cracky=1,level=2,metal=1},
	sounds = hades_sounds.node_sound_heavy_metal_defaults(),
})


minetest.register_node("hades_core:bronzeblock", {
	description = "Bronze Block",
	tiles = {"default_bronze_block.png"},
	is_ground_content = false,
	groups = {cracky=1,level=2,metal=1},
	sounds = hades_sounds.node_sound_heavy_metal_defaults(),
})


minetest.register_node("hades_core:mese", {
	description = "Mese Block",
	tiles = {"default_mese_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2},
	sounds = hades_sounds.node_sound_stone_defaults(),
})


minetest.register_node("hades_core:goldblock", {
	description = "Gold Block",
	tiles = {"default_gold_block.png"},
	is_ground_content = false,
	groups = {cracky=1,metal=1},
	sounds = hades_sounds.node_sound_heavy_metal_defaults(),
})

minetest.register_node("hades_core:emerald_block", {
	description = "Emerald Block",
	tiles = {"default_emerald_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:sapphire_block", {
	description = "Sapphire Block",
	tiles = {"default_sapphire_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:ruby_block", {
	description = "Ruby Block",
	tiles = {"default_ruby_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:diamondblock", {
	description = "Diamond Block",
	tiles = {"default_diamond_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=3},
	sounds = hades_sounds.node_sound_stone_defaults(),
})


minetest.register_node("hades_core:obsidian_glass", {
	description = "Obsidian Glass",
	drawtype = "glasslike",
	tiles = {"default_obsidian_glass.png"},
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	sounds = hades_sounds.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
})


minetest.register_node("hades_core:obsidian", {
	description = "Obsidian",
	tiles = {"default_obsidian.png"},
	is_ground_content = true,
	sounds = hades_sounds.node_sound_stone_defaults(),
	groups = {cracky=1,level=2},
})

minetest.register_node("hades_core:obsidian_block", {
	description = "Obsidian Block",
	tiles = {"default_obsidian_block.png"},
	is_ground_content = false,
	sounds = hades_sounds.node_sound_stone_defaults(),
	groups = {cracky=2},
})



minetest.register_node("hades_core:stone_with_emerald", {
	description = "Emerald Ore",
	tiles = {"default_stone.png^default_mineral_emerald.png"},
	is_ground_content = true,
	groups = {cracky=2, porous=1, ore=1},
	drop = "hades_core:emerald",
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:stone_with_sapphire", {
	description = "Sapphire Ore",
	tiles = {"default_stone.png^default_mineral_sapphire.png"},
	is_ground_content = true,
	groups = {cracky=2, porous=1, ore=1},
	drop = "hades_core:sapphire",
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:stone_with_ruby", {
	description = "Ruby Ore",
	tiles = {"default_stone.png^default_mineral_ruby.png"},
	is_ground_content = true,
	groups = {cracky=1, porous=1, ore=1},
	drop = "hades_core:ruby",
	sounds = hades_sounds.node_sound_stone_defaults(),
})


