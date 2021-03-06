local S = minetest.get_translator("hade_core")

-- mods/default/nodes.lua

local WATER_VISC = 1
local LAVA_VISC = 7
local LIGHT_MAX = minetest.LIGHT_MAX - 1

minetest.register_node("hades_core:stone", {
	description = S("Stone"),
	tiles = {"default_stone.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=1, porous=1},
	drop = 'hades_core:cobble',
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:mossystone", {
	description = S("Mossy Stone"),
	tiles = {"default_mossystone.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=1, porous=1},
	drop = 'hades_core:mossycobble',
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:chondrite", {
	description = S("Chondrite"),
	_tt_help = S("Becomes Marble when close to water and at Y=-500 or below"),
	tiles = {"default_chondrite.png"},
	is_ground_content = true,
	groups = {cracky=2, stone=1, porous=1},
	drop = 'hades_core:chondrite',
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:chondrite_block", {
	description = S("Chondrite Block"),
	tiles = {"default_chondrite_block.png"},
	is_ground_content = false,
	groups = {cracky=2},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:chondrite_brick", {
	description = S("Chondrite Brick"),
	tiles = {"default_chondrite_brick.png"},
	groups = {cracky=2, stone=1},
	is_ground_content = false,
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:tuff", {
	description = S("Tuff"),
	tiles = {"default_tuff.png"},
	is_ground_content = true,
	groups = {cracky=3, porous=1},
	drop = 'hades_core:tuff',
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:tuff_block", {
	description = S("Tuff Block"),
	tiles = {"default_tuff_block.png"},
	is_ground_content = false,
	groups = {cracky=3},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:tuff_brick", {
	description = S("Tuff Brick"),
	tiles = {"default_tuff_brick.png"},
	groups = {cracky=3},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:tuff_baked", {
	description = S("Burned Tuff"),
	tiles = {"default_tuff_baked.png"},
	is_ground_content = true,
	groups = {cracky=3, porous=1, burned_node=1},
	drop = 'hades_core:tuff_baked',
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:tuff_baked_block", {
	description = S("Burned Tuff Block"),
	tiles = {"default_tuff_baked_block.png"},
	is_ground_content = false,
	groups = {cracky=3, burned_node=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:tuff_baked_brick", {
	description = S("Burned Tuff Brick"),
	tiles = {"default_tuff_baked_brick.png"},
	groups = {cracky=3, burned_node=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:mossytuff", {
	description = S("Mossy Tuff"),
	tiles = {"default_mossytuff.png"},
	is_ground_content = true,
	groups = {cracky=3, porous=1, mossy=1},
	drop = 'hades_core:mossytuff',
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:marble", {
	description = S("Marble"),
	tiles = {"default_marble.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=1, porous=1},
	drop = 'hades_core:marble',
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:marble_block", {
	description = S("Marble Block"),
	tiles = {"default_marble_block.png"},
	is_ground_content = false,
	groups = {cracky=3},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:marble_brick", {
	description = S("Marble Brick"),
	tiles = {"default_marble_brick.png"},
	groups = {cracky=3, stone=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:essexite", {
	description = S("Essexite"),
	tiles = {"default_essexite.png"},
	is_ground_content = true,
	groups = {cracky=1, stone=1, porous=1},
	drop = 'hades_core:essexite',
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:essexite_block", {
	description = S("Essexite Block"),
	tiles = {"default_essexite_block.png"},
	is_ground_content = false,
	groups = {cracky=2,},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:essexite_brick", {
	description = S("Essexite Brick"),
	tiles = {"default_essexite_brick.png"},
	groups = {cracky=1, stone=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:stone_baked", {
	description = S("Burned Stone"),
	tiles = {"default_stone_baked.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=1, porous=1, burned_node=1},
	drop = "hades_core:cobble_baked",
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:stone_block_baked", {
	description = S("Burned Stone Block"),
	tiles = {"default_stone_block_baked.png"},
	is_ground_content = false,
	groups = {cracky=3, burned_node=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:obsidianbrick", {
	description = S("Obsidian Brick"),
	tiles = {"default_obsidian_brick.png"},
	sounds = hades_sounds.node_sound_stone_defaults(),
	groups = {cracky=1,level=2},
})
-- floors

minetest.register_node("hades_core:floor_chondrite_stone", {
	description = S("Chondrite/Stone Block"),
	tiles = {"default_floor_chondrite_stone.png"},
	is_ground_content = false,
	groups = {cracky=3, stone=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:floor_chondrite_stone2", {
	description = S("Chondrite/Stone Tile"),
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
	description = S("Burned Stone/Stone Tile"),
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
	description = S("Burned Tuff/Tuff Tile"),
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
	description = S("Burned Stone/Sandstone Block"),
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
	description = S("Burned Stone/Sandstone Tile"),
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
	description = S("Marble/Essexite Tile"),
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
	description = S("Marble/Essexite Block"),
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
	description = S("Golden Essexite Block"),
	tiles = {"default_floor_essexite_gold.png"},
	is_ground_content = false,
	groups = {cracky=2},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:floor_essexite_gold2", {
	description = S("Golden Essexite Tile"),
	tiles = {"default_floor_essexite_gold2.png"},
	is_ground_content = false,
	groups = {cracky=2},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

--minerals

minetest.register_node("hades_core:stone_with_coal", {
	description = S("Coal Ore"),
	tiles = {"default_stone.png^default_mineral_coal.png"},
	is_ground_content = true,
	groups = {cracky=3, porous=1, ore=1},
	drop = 'hades_core:coal_lump',
	sounds = hades_sounds.node_sound_stone_defaults(),
})


minetest.register_node("hades_core:stone_with_iron", {
	description = S("Iron Ore"),
	tiles = {"default_stone.png^default_mineral_iron.png"},
	is_ground_content = true,
	groups = {cracky=2, porous=1, ore=1},
	drop = 'hades_core:iron_lump',
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:stone_with_tin", {
	description = S("Tin Ore"),
	tiles = {"default_stone.png^default_mineral_tin.png"},
	is_ground_content = true,
	groups = {cracky=2, porous=1, ore=1},
	drop = 'hades_core:tin_lump',
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:stone_with_copper", {
	description = S("Copper Ore"),
	tiles = {"default_stone.png^default_mineral_copper.png"},
	is_ground_content = true,
	groups = {cracky=2, porous=1, ore=1},
	drop = 'hades_core:copper_lump',
	sounds = hades_sounds.node_sound_stone_defaults(),
})


minetest.register_node("hades_core:stone_with_mese", {
	description = S("Mese Ore"),
	tiles = {"default_stone.png^default_mineral_mese.png"},
	is_ground_content = true,
	groups = {cracky=1, porous=1, ore=1},
	drop = "hades_core:mese_crystal",
	sounds = hades_sounds.node_sound_stone_defaults(),
})


minetest.register_node("hades_core:stone_with_gold", {
	description = S("Gold Ore"),
	tiles = {"default_stone.png^default_mineral_gold.png"},
	is_ground_content = true,
	groups = {cracky=2, porous=1, ore=1},
	drop = "hades_core:gold_lump",
	sounds = hades_sounds.node_sound_stone_defaults(),
})


minetest.register_node("hades_core:stone_with_diamond", {
	description = S("Diamond Ore"),
	tiles = {"default_stone.png^default_mineral_diamond.png"},
	is_ground_content = true,
	groups = {cracky=1, porous=1, ore=1},
	drop = "hades_core:diamond",
	sounds = hades_sounds.node_sound_stone_defaults(),
})


minetest.register_node("hades_core:stonebrick", {
	description = S("Stone Brick"),
	tiles = {"default_stone_brick.png"},
	groups = {cracky=2, stone=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})


minetest.register_node("hades_core:stonebrick_baked", {
	description = S("Burned Stone Brick"),
	tiles = {"default_stone_brick_baked.png"},
	groups = {cracky=2, stone=1, burned_node=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})


minetest.register_node("hades_core:dirt_with_grass", {
	description = S("Dirt with Grass"),
	tiles = {"default_grass.png", "default_dirt.png", "default_dirt.png^default_grass_side.png"},
	is_ground_content = true,
	groups = {crumbly=3,soil=1,dirt=1, porous=1},
	drop = 'hades_core:dirt',
	sounds = hades_sounds.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.25},
	}),
})


minetest.register_node("hades_core:dirt", {
	description = S("Dirt"),
	_tt_help = S("Becomes grassy when exposed to light"),
	tiles = {"default_dirt.png"},
	is_ground_content = true,
	groups = {crumbly=3,soil=1,dirt=1, porous=1},
	sounds = hades_sounds.node_sound_dirt_defaults(),
})


minetest.register_node("hades_core:ash", {
	description = S("Volcanic Ash"),
	_tt_help = S("Becomes Clay when close to water"),
	tiles = {"default_ash.png"},
	is_ground_content = true,
	groups = {crumbly=3, falling_node=1, ash=1, porous=1},
	sounds = hades_sounds.node_sound_sand_defaults(),
})

minetest.register_node("hades_core:ash_block", {
	description = S("Volcanic Ash Block"),
	tiles = {"default_ash_block.png"},
	is_ground_content = false,
	groups = {crumbly=3},
	sounds = hades_sounds.node_sound_sand_defaults(),
})

minetest.register_node("hades_core:fertile_sand", {
	description = S("Fertile Sand"),
	_tt_help = S("Becomes Dirt when close to water"),
	tiles = {"default_fertile_sand.png"},
	is_ground_content = true,
	groups = {crumbly=3, falling_node=1, sand=1, porous=1},
	sounds = hades_sounds.node_sound_sand_defaults(),
})


minetest.register_node("hades_core:gravel", {
	description = S("Gravel"),
	tiles = {"default_gravel.png"},
	is_ground_content = true,
	groups = {crumbly=2, falling_node=1, porous=1},
	sounds = hades_sounds.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
})

minetest.register_node("hades_core:gravel_block", {
	description = S("Gravel Block"),
	tiles = {"default_gravel_block.png"},
	is_ground_content = false,
	groups = {crumbly=2},
	sounds = hades_sounds.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
})

minetest.register_node("hades_core:gravel_volcanic", {
	description = S("Volcanic Gravel"),
	_tt_help = S("Becomes Obsidian when close to water and lava at Y=-1000 or below"),
	tiles = {"default_gravel_volcanic.png"},
	is_ground_content = true,
	groups = {crumbly=1, porous=1},
	sounds = hades_sounds.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
})

minetest.register_node("hades_core:gravel_volcanic_block", {
	description = S("Volcanic Gravel Block"),
	tiles = {"default_gravel_volcanic_block.png"},
	is_ground_content = false,
	groups = {crumbly=2},
	sounds = hades_sounds.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
})


minetest.register_node("hades_core:sandstone", {
	description = S("Sandstone"),
	tiles = {"default_sandstone.png"},
	is_ground_content = true,
	groups = {crumbly=2,cracky=3,sandstone=1, porous=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})


minetest.register_node("hades_core:sandstonebrick", {
	description = S("Sandstone Brick"),
	tiles = {"default_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky=2},
	sounds = hades_sounds.node_sound_stone_defaults(),
})


minetest.register_node("hades_core:clay", {
	description = S("Clay"),
	tiles = {"default_clay.png"},
	is_ground_content = true,
	groups = {crumbly=3, porous=1},
	drop = 'hades_core:clay_lump 4',
	sounds = hades_sounds.node_sound_dirt_defaults(),
})


minetest.register_node("hades_core:brick", {
	description = S("Uncolored Brick Block"),
	tiles = {"default_brick.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

-- Colors are beautiful

minetest.register_node("hades_core:brick_black", {
	description = S("Black Brick Block"),
	tiles = {"default_brick_black.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_blue", {
	description = S("Blue Brick Block"),
	tiles = {"default_brick_blue.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_brown", {
	description = S("Brown Brick Block"),
	tiles = {"default_brick_brown.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_cyan", {
	description = S("Cyan Brick Block"),
	tiles = {"default_brick_cyan.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_dark_green", {
	description = S("Dark Green Brick Block"),
	tiles = {"default_brick_dark_green.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_dark_grey", {
	description = S("Dark Grey Brick Block"),
	tiles = {"default_brick_dark_grey.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_green", {
	description = S("Green Brick Block"),
	tiles = {"default_brick_green.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_grey", {
	description = S("Grey Brick Block"),
	tiles = {"default_brick_grey.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_magenta", {
	description = S("Magenta Brick Block"),
	tiles = {"default_brick_magenta.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_orange", {
	description = S("Orange Brick Block"),
	tiles = {"default_brick_orange.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_pink", {
	description = S("Pink Brick Block"),
	tiles = {"default_brick_pink.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_red", {
	description = S("Red Brick Block"),
	tiles = {"default_brick_red.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_violet", {
	description = S("Violet Brick Block"),
	tiles = {"default_brick_violet.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_white", {
	description = S("White Brick Block"),
	tiles = {"default_brick_white.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_yellow", {
	description = S("Yellow Brick Block"),
	tiles = {"default_brick_yellow.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})



minetest.register_node("hades_core:bookshelf", {
	description = S("Bookshelf"),
	tiles = {"default_wood.png", "default_wood.png", "default_bookshelf.png"},
	is_ground_content = false,
	groups = {choppy=3,oddly_breakable_by_hand=2,flammable=3},
	sounds = hades_sounds.node_sound_wood_defaults(),
})


minetest.register_node("hades_core:glass", {
	description = S("Glass"),
	drawtype = "glasslike_framed_optional",
	tiles = {"default_glass.png", "default_glass_detail.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = hades_sounds.node_sound_glass_defaults(),
})

--- Liquids

minetest.register_node("hades_core:water_flowing", {
	description = S("Flowing Water"),
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
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
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
	description = S("Water Source"),
	drawtype = "liquid",
	tiles = {
		{
			name = "default_water_source_animated.png",
			backface_culling = false,
			animation = {type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0},
		},
		{
			name = "default_water_source_animated.png",
			backface_culling = true,
			animation = {type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0},
		},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
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
	description = S("Flowing Lava"),
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
	is_ground_content = false,
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
	description = S("Lava Source"),
	drawtype = "liquid",
	tiles = {
		{
			name = "default_lava_source_animated.png",
			backface_culling = false,
			animation = {type="vertical_frames", aspect_w=16, aspect_h=16, length=4.0},
		},
		{
			name = "default_lava_source_animated.png",
			backface_culling = true,
			animation = {type="vertical_frames", aspect_w=16, aspect_h=16, length=4.0},
		}
	},
	paramtype = "light",
	light_source = minetest.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
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
	description = S("Cobblestone"),
	tiles = {"default_cobble.png"},
	is_ground_content = false,
	groups = {cracky=3, stone=2, porous=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:cobble_block", {
	description = S("Cobblestone Block"),
	tiles = {"default_cobble_block.png"},
	is_ground_content = false,
	groups = {cracky=3, stone=2},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:cobble_baked", {
	description = S("Burned Cobblestone"),
	tiles = {"default_cobble_baked.png"},
	is_ground_content = false,
	groups = {cracky=3, stone=2, porous=1, burned_node=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:cobble_block_baked", {
	description = S("Burned Cobblestone Block"),
	tiles = {"default_cobble_baked_block.png"},
	is_ground_content = false,
	groups = {cracky=3, stone=2, burned_node=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:mossycobble", {
	description = S("Mossy Cobblestone"),
	tiles = {"default_mossycobble.png"},
	is_ground_content = false,
	groups = {cracky=3, porous=1, mossy=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:coalblock", {
	description = S("Coal Block"),
	tiles = {"default_coal_block.png"},
	is_ground_content = false,
	groups = {cracky=3},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:steelblock", {
	description = S("Steel Block"),
	tiles = {"default_steel_block.png"},
	is_ground_content = false,
	groups = {cracky=1,level=2,metal=1},
	sounds = hades_sounds.node_sound_heavy_metal_defaults(),
})

minetest.register_node("hades_core:tinblock", {
	description = S("Tin Block"),
	tiles = {"default_tin_block.png"},
	is_ground_content = false,
	groups = {cracky=1,level=2,metal=1},
	sounds = hades_sounds.node_sound_heavy_metal_defaults(),
})

minetest.register_node("hades_core:copperblock", {
	description = S("Copper Block"),
	tiles = {"default_copper_block.png"},
	is_ground_content = false,
	groups = {cracky=1,level=2,metal=1},
	sounds = hades_sounds.node_sound_heavy_metal_defaults(),
})


minetest.register_node("hades_core:bronzeblock", {
	description = S("Bronze Block"),
	tiles = {"default_bronze_block.png"},
	is_ground_content = false,
	groups = {cracky=1,level=2,metal=1},
	sounds = hades_sounds.node_sound_heavy_metal_defaults(),
})


minetest.register_node("hades_core:mese", {
	description = S("Mese Block"),
	tiles = {"default_mese_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2},
	sounds = hades_sounds.node_sound_stone_defaults(),
})


minetest.register_node("hades_core:goldblock", {
	description = S("Gold Block"),
	tiles = {"default_gold_block.png"},
	is_ground_content = false,
	groups = {cracky=1,metal=1},
	sounds = hades_sounds.node_sound_heavy_metal_defaults(),
})

minetest.register_node("hades_core:emerald_block", {
	description = S("Emerald Block"),
	tiles = {"default_emerald_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:sapphire_block", {
	description = S("Sapphire Block"),
	tiles = {"default_sapphire_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:ruby_block", {
	description = S("Ruby Block"),
	tiles = {"default_ruby_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:diamondblock", {
	description = S("Diamond Block"),
	tiles = {"default_diamond_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=3},
	sounds = hades_sounds.node_sound_stone_defaults(),
})


minetest.register_node("hades_core:obsidian_glass", {
	description = S("Obsidian Glass"),
	drawtype = "glasslike_framed_optional",
	tiles = {"default_obsidian_glass.png", "default_obsidian_glass_detail.png"},
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	sounds = hades_sounds.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
})


minetest.register_node("hades_core:obsidian", {
	description = S("Obsidian"),
	tiles = {"default_obsidian.png"},
	is_ground_content = true,
	sounds = hades_sounds.node_sound_stone_defaults(),
	groups = {cracky=1,level=2},
})

minetest.register_node("hades_core:obsidian_block", {
	description = S("Obsidian Block"),
	tiles = {"default_obsidian_block.png"},
	is_ground_content = false,
	sounds = hades_sounds.node_sound_stone_defaults(),
	groups = {cracky=2},
})



minetest.register_node("hades_core:stone_with_emerald", {
	description = S("Emerald Ore"),
	tiles = {"default_stone.png^default_mineral_emerald.png"},
	is_ground_content = true,
	groups = {cracky=2, porous=1, ore=1},
	drop = "hades_core:emerald",
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:stone_with_sapphire", {
	description = S("Sapphire Ore"),
	tiles = {"default_stone.png^default_mineral_sapphire.png"},
	is_ground_content = true,
	groups = {cracky=2, porous=1, ore=1},
	drop = "hades_core:sapphire",
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:stone_with_ruby", {
	description = S("Ruby Ore"),
	tiles = {"default_stone.png^default_mineral_ruby.png"},
	is_ground_content = true,
	groups = {cracky=1, porous=1, ore=1},
	drop = "hades_core:ruby",
	sounds = hades_sounds.node_sound_stone_defaults(),
})


