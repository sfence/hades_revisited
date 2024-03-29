local S = minetest.get_translator("hades_core")

-- Decorative combination blocks

minetest.register_node("hades_core:floor_chondrite_stone", {
	description = S("Chondrite/Stone Block"),
	tiles = {"hades_core_floor_chondrite_stone.png"},
	is_ground_content = false,
	groups = {cracky=3, stone=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:floor_bstone_sandstone", {
	description = S("Burned Stone/Fine Sandstone Block"),
	tiles = {
		"hades_core_floor_bstone_sandstone.png",
		"hades_core_floor_bstone_sandstone.png",
		"hades_core_floor_bstone_sandstone.png",
		"hades_core_floor_bstone_sandstone.png",
		"hades_core_floor_bstone_sandstone.png^[transformR90",
	},
	is_ground_content = false,
	groups = {cracky=3},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:floor_marble_essexite2", {
	description = S("Marble/Essexite Block"),
	tiles = {
		"hades_core_floor_marble_essexite2.png",
		"hades_core_floor_marble_essexite2.png",
		"hades_core_floor_marble_essexite2.png",
		"hades_core_floor_marble_essexite2.png",
		"hades_core_floor_marble_essexite2.png^[transformR90",
	},
	is_ground_content = false,
	groups = {cracky=2, stone=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:floor_essexite_gold", {
	description = S("Golden Essexite Block"),
	tiles = {"hades_core_floor_essexite_gold.png"},
	is_ground_content = false,
	groups = {cracky=2},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

-- Ores

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

minetest.register_node("hades_core:stone_with_emerald", {
	description = S("Emerald Ore"),
	tiles = {"default_stone.png^hades_core_mineral_emerald.png"},
	is_ground_content = true,
	groups = {cracky=2, porous=1, ore=1},
	drop = "hades_core:emerald",
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:stone_with_sapphire", {
	description = S("Sapphire Ore"),
	tiles = {"default_stone.png^hades_core_mineral_sapphire.png"},
	is_ground_content = true,
	groups = {cracky=2, porous=1, ore=1},
	drop = "hades_core:sapphire",
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:stone_with_ruby", {
	description = S("Ruby Ore"),
	tiles = {"default_stone.png^hades_core_mineral_ruby.png"},
	is_ground_content = true,
	groups = {cracky=1, porous=1, ore=1},
	drop = "hades_core:ruby",
	sounds = hades_sounds.node_sound_stone_defaults(),
})

-- Soft blocks: ash, sand, gravel, etc. (except dirt)

minetest.register_node("hades_core:ash", {
	description = S("Volcanic Ash"),
	_tt_help = S("Becomes Clay when close to water"),
	tiles = {"hades_core_ash.png"},
	is_ground_content = true,
	groups = {crumbly=3, falling_node=1, ash=1, porous=1},
	sounds = hades_sounds.node_sound_ash_defaults(),
})

minetest.register_node("hades_core:ash_block", {
	description = S("Volcanic Ash Block"),
	tiles = {"hades_core_ash_block.png"},
	is_ground_content = false,
	groups = {crumbly=3},
	sounds = hades_sounds.node_sound_ash_defaults(),
})

minetest.register_node("hades_core:volcanic_sand", {
	description = S("Volcanic Sand"),
	tiles = {"hades_core_volcanic_sand.png"},
	is_ground_content = true,
	groups = {crumbly=3, falling_node=1, sand=1, porous=1},
	sounds = hades_sounds.node_sound_sand_defaults(),
})

minetest.register_node("hades_core:fertile_sand", {
	description = S("Fertile Sand"),
	_tt_help = S("Becomes Dirt when close to water"),
	tiles = {"hades_core_fertile_sand.png"},
	is_ground_content = true,
	groups = {crumbly=3, falling_node=1, sand=1, porous=1},
	sounds = hades_sounds.node_sound_sand_defaults(),
})


minetest.register_node("hades_core:gravel", {
	description = S("Gravel"),
	tiles = {"default_gravel.png"},
	is_ground_content = true,
	groups = {crumbly=2, gravel=1, falling_node=1, porous=1},
	sounds = hades_sounds.node_sound_gravel_defaults(),
})

minetest.register_node("hades_core:gravel_block", {
	description = S("Gravel Block"),
	tiles = {"hades_core_gravel_block.png"},
	is_ground_content = false,
	groups = {crumbly=2},
	sounds = hades_sounds.node_sound_gravel_defaults(),
})

minetest.register_node("hades_core:gravel_volcanic", {
	description = S("Volcanic Gravel"),
	_tt_help = S("Becomes Obsidian when close to water and lava at Y=-1000 or below"),
	tiles = {"hades_core_gravel_volcanic.png"},
	is_ground_content = true,
	groups = {crumbly=1, gravel=1, porous=1},
	sounds = hades_sounds.node_sound_gravel_defaults({pitch=0.85}),
})

minetest.register_node("hades_core:gravel_volcanic_block", {
	description = S("Volcanic Gravel Block"),
	tiles = {"hades_core_gravel_volcanic_block.png"},
	is_ground_content = false,
	groups = {crumbly=2},
	sounds = hades_sounds.node_sound_gravel_defaults({pitch=0.85}),
})


minetest.register_node("hades_core:sandstone_volcanic", {
	description = S("Volcanic Sandstone"),
	tiles = {"hades_core_sandstone_volcanic.png"},
	is_ground_content = true,
	groups = {cracky=3,sandstone=1, porous=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:cobble_sandstone_volcanic", {
	description = S("Cobbled Volcanic Sandstone"),
	tiles = {"hades_core_cobble_sandstone_volcanic.png"},
	is_ground_content = false,
	groups = {cracky=3,sandstone=1, porous=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:sandstone_volcanic_brick", {
	description = S("Volcanic Sandstone Brick"),
	tiles = {"hades_core_sandstone_volcanic_brick.png"},
	is_ground_content = false,
	groups = {cracky=2,sandstone=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})


minetest.register_node("hades_core:sandstone", {
	description = S("Fine Sandstone"),
	tiles = {"default_sandstone.png"},
	is_ground_content = true,
	groups = {cracky=3,sandstone=1, porous=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:cobble_sandstone", {
	description = S("Cobbled Fine Sandstone"),
	tiles = {"hades_core_cobble_sandstone.png"},
	is_ground_content = false,
	groups = {cracky=3,sandstone=1, porous=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:sandstonebrick", {
	description = S("Fine Sandstone Brick"),
	tiles = {"default_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky=2,sandstone=1},
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

-- Brick Blocks

minetest.register_node("hades_core:brick", {
	description = S("Uncolored Brick Block"),
	tiles = {"default_brick.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_black", {
	description = S("Black Brick Block"),
	tiles = {"hades_core_brick_black.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_blue", {
	description = S("Blue Brick Block"),
	tiles = {"hades_core_brick_blue.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_brown", {
	description = S("Brown Brick Block"),
	tiles = {"hades_core_brick_brown.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_cyan", {
	description = S("Cyan Brick Block"),
	tiles = {"hades_core_brick_cyan.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_dark_green", {
	description = S("Dark Green Brick Block"),
	tiles = {"hades_core_brick_dark_green.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_dark_grey", {
	description = S("Dark Grey Brick Block"),
	tiles = {"hades_core_brick_dark_grey.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_green", {
	description = S("Green Brick Block"),
	tiles = {"hades_core_brick_green.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_grey", {
	description = S("Grey Brick Block"),
	tiles = {"hades_core_brick_grey.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_magenta", {
	description = S("Magenta Brick Block"),
	tiles = {"hades_core_brick_magenta.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_orange", {
	description = S("Orange Brick Block"),
	tiles = {"hades_core_brick_orange.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_pink", {
	description = S("Pink Brick Block"),
	tiles = {"hades_core_brick_pink.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_red", {
	description = S("Red Brick Block"),
	tiles = {"hades_core_brick_red.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_violet", {
	description = S("Violet Brick Block"),
	tiles = {"hades_core_brick_violet.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_white", {
	description = S("White Brick Block"),
	tiles = {"hades_core_brick_white.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:brick_yellow", {
	description = S("Yellow Brick Block"),
	tiles = {"hades_core_brick_yellow.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

-- Glass

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

-- Cobblestone

minetest.register_node("hades_core:cobble", {
	description = S("Cobblestone"),
	tiles = {"default_cobble.png"},
	is_ground_content = false,
	groups = {cracky=3, stone=2, porous=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:cobble_block", {
	description = S("Cobblestone Block"),
	tiles = {"hades_core_cobble_block.png"},
	is_ground_content = false,
	groups = {cracky=3, stone=2},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:cobble_baked", {
	description = S("Burned Cobblestone"),
	tiles = {"hades_core_cobble_baked.png"},
	is_ground_content = false,
	groups = {cracky=3, stone=2, porous=1, burned_node=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:cobble_block_baked", {
	description = S("Burned Cobblestone Block"),
	tiles = {"hades_core_cobble_baked_block.png"},
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

-- Mineral blocks

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
	tiles = {"hades_core_emerald_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:sapphire_block", {
	description = S("Sapphire Block"),
	tiles = {"hades_core_sapphire_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_core:ruby_block", {
	description = S("Ruby Block"),
	tiles = {"hades_core_ruby_block.png"},
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

-- Bookshelf

minetest.register_node("hades_core:bookshelf", {
	description = S("Bookshelf"),
	paramtype2 = "facedir",
	tiles = {
		{name="default_wood.png", align_style="world"},
		{name="default_wood.png", align_style="world"},
		{name="default_wood.png", align_style="world"},
		{name="default_wood.png", align_style="world"},
		"default_bookshelf.png",
		"default_bookshelf.png",
	},
	is_ground_content = false,
	groups = {choppy=3,oddly_breakable_by_hand=2,flammable=3},
	sounds = hades_sounds.node_sound_wood_defaults(),
	on_rotate = "simple",
})

