-- mods/default/nodes.lua


minetest.register_node("default:stone", {
	description = "Stone",
	tiles = {"default_stone.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=1, porous=1},
	drop = 'default:cobble',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:mossystone", {
	description = "Mossy Stone",
	tiles = {"default_mossystone.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=1, porous=1},
	drop = 'default:mossycobble',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:chondrite", {
	description = "Chondrite",
	tiles = {"default_chondrite.png"},
	is_ground_content = true,
	groups = {cracky=2, stone=1, porous=1},
	drop = 'default:chondrite',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:chondrite_block", {
	description = "Chondrite Block",
	tiles = {"default_chondrite_block.png"},
	is_ground_content = false,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:chondrite_brick", {
	description = "Chondrite Brick",
	tiles = {"default_chondrite_brick.png"},
	groups = {cracky=2, stone=1},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:tuff", {
	description = "Tuff",
	tiles = {"default_tuff.png"},
	is_ground_content = true,
	groups = {cracky=3, porous=1},
	drop = 'default:tuff',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:tuff_block", {
	description = "Tuff Block",
	tiles = {"default_tuff_block.png"},
	is_ground_content = false,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:tuff_brick", {
	description = "Tuff Brick",
	tiles = {"default_tuff_brick.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:tuff_baked", {
	description = "Burned Tuff",
	tiles = {"default_tuff_baked.png"},
	is_ground_content = true,
	groups = {cracky=3, porous=1},
	drop = 'default:tuff_baked',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:tuff_baked_block", {
	description = "Burned Tuff Block",
	tiles = {"default_tuff_baked_block.png"},
	is_ground_content = false,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:tuff_baked_brick", {
	description = "Burned Tuff Brick",
	tiles = {"default_tuff_baked_brick.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:mossytuff", {
	description = "Mossy Tuff",
	tiles = {"default_mossytuff.png"},
	is_ground_content = true,
	groups = {cracky=3, porous=1},
	drop = 'default:mossytuff',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:marble", {
	description = "Marble",
	tiles = {"default_marble.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=1, porous=1},
	drop = 'default:marble',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:marble_block", {
	description = "Marble Block",
	tiles = {"default_marble_block.png"},
	is_ground_content = false,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:marble_brick", {
	description = "Marble Brick",
	tiles = {"default_marble_brick.png"},
	groups = {cracky=3, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:essexite", {
	description = "Essexite",
	tiles = {"default_essexite.png"},
	is_ground_content = true,
	groups = {cracky=1, stone=1, porous=1},
	drop = 'default:essexite',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:essexite_block", {
	description = "Essexite Block",
	tiles = {"default_essexite_block.png"},
	is_ground_content = false,
	groups = {cracky=2,},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:essexite_brick", {
	description = "Essexite Brick",
	tiles = {"default_essexite_brick.png"},
	groups = {cracky=1, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_baked", {
	description = "Burned Stone",
	tiles = {"default_stone_baked.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=1, porous=1},
	drop = "default:cobble_baked",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_block_baked", {
	description = "Burned Stone Block",
	tiles = {"default_stone_block_baked.png"},
	is_ground_content = false,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:obsidianbrick", {
	description = "Obsidian Brick",
	tiles = {"default_obsidian_brick.png"},
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky=1,level=2},
})
-- floors

minetest.register_node("default:floor_chondrite_stone", {
	description = "Chondrite/Stone Block",
	tiles = {"default_floor_chondrite_stone.png"},
	is_ground_content = false,
	groups = {cracky=3, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:floor_chondrite_stone2", {
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
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:floor_bstone_stone", {
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
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:floor_btuff_tuff", {
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
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:floor_bstone_sandstone", {
	description = "Burned Stone/Sandstone Block",
	tiles = {
		"default_floor_bstone_sandstone.png",
		"default_floor_bstone_sandstone.png",
		"default_floor_bstone_sandstone.png",
		"default_floor_bstone_sandstone.png",
		"default_floor_bstone_sandstone.png^[transformR90",
	},
	is_ground_content = false,
	groups = {cracky=3, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:floor_bstone_sandstone2", {
	description = "Burned Stone/Sandstone Tile",
	tiles = {
		"default_floor_bstone_sandstone2.png",
		"default_floor_bstone_sandstone2.png",
		"default_floor_bstone_sandstone2.png",
		"default_floor_bstone_sandstone2.png",
		"default_floor_bstone_sandstone2.png^[transformR90",
	},
	is_ground_content = false,
	groups = {cracky=3, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:floor_marble_essexite", {
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
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:floor_marble_essexite2", {
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
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:floor_essexite_gold", {
	description = "Golden Essexite Block",
	tiles = {"default_floor_essexite_gold.png"},
	is_ground_content = false,
	groups = {cracky=2, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:floor_essexite_gold2", {
	description = "Golden Essexite Tile",
	tiles = {"default_floor_essexite_gold2.png"},
	is_ground_content = false,
	groups = {cracky=2, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:floor_wood_jungle", {
	description = "Common Wood/Jungle Wood Tile",
	tiles = {
		"default_floor_wood_jungle.png",
		"default_floor_wood_jungle.png",
		"default_floor_wood_jungle.png",
		"default_floor_wood_jungle.png",
		"default_floor_wood_jungle.png^[transformR90",
	},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:floor_wood_pale", {
	description = "Common Wood/Pale Wood Tile",
	tiles = {
		"default_floor_wood_pale.png",
		"default_floor_wood_pale.png",
		"default_floor_wood_pale.png",
		"default_floor_wood_pale.png",
		"default_floor_wood_pale.png^[transformR90",
	},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:floor_pale_jungle", {
	description = "Jungle Wood/Pale Wood Tile",
	tiles = {
		"default_floor_pale_jungle.png",
		"default_floor_pale_jungle.png",
		"default_floor_pale_jungle.png",
		"default_floor_pale_jungle.png",
		"default_floor_pale_jungle.png^[transformR90",
	},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

--minerals

minetest.register_node("default:stone_with_coal", {
	description = "Coal Ore",
	tiles = {"default_stone.png^default_mineral_coal.png"},
	is_ground_content = true,
	groups = {cracky=3, porous=1},
	drop = 'default:coal_lump',
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("default:stone_with_iron", {
	description = "Iron Ore",
	tiles = {"default_stone.png^default_mineral_iron.png"},
	is_ground_content = true,
	groups = {cracky=2, porous=1},
	drop = 'default:iron_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_with_tin", {
	description = "Tin Ore",
	tiles = {"default_stone.png^default_mineral_tin.png"},
	is_ground_content = true,
	groups = {cracky=2, porous=1},
	drop = 'default:tin_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_with_copper", {
	description = "Copper Ore",
	tiles = {"default_stone.png^default_mineral_copper.png"},
	is_ground_content = true,
	groups = {cracky=2, porous=1},
	drop = 'default:copper_lump',
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("default:stone_with_mese", {
	description = "Mese Ore",
	tiles = {"default_stone.png^default_mineral_mese.png"},
	is_ground_content = true,
	groups = {cracky=1, porous=1},
	drop = "default:mese_crystal",
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("default:stone_with_gold", {
	description = "Gold Ore",
	tiles = {"default_stone.png^default_mineral_gold.png"},
	is_ground_content = true,
	groups = {cracky=2, porous=1},
	drop = "default:gold_lump",
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("default:stone_with_diamond", {
	description = "Diamond Ore",
	tiles = {"default_stone.png^default_mineral_diamond.png"},
	is_ground_content = true,
	groups = {cracky=1, porous=1},
	drop = "default:diamond",
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("default:stonebrick", {
	description = "Stone Brick",
	tiles = {"default_stone_brick.png"},
	groups = {cracky=2, stone=1},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("default:stonebrick_baked", {
	description = "Burned Stone Brick",
	tiles = {"default_stone_brick_baked.png"},
	groups = {cracky=2, stone=1},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("default:dirt_with_grass", {
	description = "Dirt with Grass",
	tiles = {"default_grass.png", "default_dirt.png", "default_dirt.png^default_grass_side.png"},
	is_ground_content = true,
	groups = {crumbly=3,soil=1, porous=1},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.25},
	}),
})


minetest.register_node("default:dirt", {
	description = "Dirt",
	tiles = {"default_dirt.png"},
	is_ground_content = true,
	groups = {crumbly=3,soil=1, porous=1},
	sounds = default.node_sound_dirt_defaults(),
})


minetest.register_abm({
	nodenames = {"default:dirt"},
	interval = 2,
	chance = 200,
	action = function(pos, node)
		local above = {x=pos.x, y=pos.y+1, z=pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if nodedef and (nodedef.sunlight_propagates or nodedef.paramtype == "light")
				and nodedef.liquidtype == "none"
				and (minetest.get_node_light(above) or 0) >= 13 then
			minetest.set_node(pos, {name = "default:dirt_with_grass"})
		end
	end
})


minetest.register_abm({
	nodenames = {"default:dirt_with_grass"},
	interval = 2,
	chance = 20,
	action = function(pos, node)
		local above = {x=pos.x, y=pos.y+1, z=pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if name ~= "ignore" and nodedef
				and not ((nodedef.sunlight_propagates or nodedef.paramtype == "light")
				and nodedef.liquidtype == "none") then
			minetest.set_node(pos, {name = "default:dirt"})
		end
	end
})


minetest.register_node("default:ash", {
	description = "Volcanic Ash",
	tiles = {"default_ash.png"},
	is_ground_content = true,
	groups = {crumbly=3, falling_node=1, sand=1, porous=1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("default:ash_block", {
	description = "Volcanic Ash Block",
	tiles = {"default_ash_block.png"},
	is_ground_content = false,
	groups = {crumbly=3},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("default:fertile_sand", {
	description = "Fertile Sand",
	tiles = {"default_fertile_sand.png"},
	is_ground_content = true,
	groups = {crumbly=3, falling_node=1, sand=1, porous=1},
	sounds = default.node_sound_sand_defaults(),
})


minetest.register_node("default:gravel", {
	description = "Gravel",
	tiles = {"default_gravel.png"},
	is_ground_content = true,
	groups = {crumbly=2, falling_node=1, porous=1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
})

minetest.register_node("default:gravel_block", {
	description = "Gravel Block",
	tiles = {"default_gravel_block.png"},
	is_ground_content = false,
	groups = {crumbly=2},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
})

minetest.register_node("default:gravel_volcanic", {
	description = "Volcanic Gravel",
	tiles = {"default_gravel_volcanic.png"},
	is_ground_content = true,
	groups = {crumbly=1, porous=1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
})

minetest.register_node("default:gravel_volcanic_block", {
	description = "Volcanic Gravel Block",
	tiles = {"default_gravel_volcanic_block.png"},
	is_ground_content = false,
	groups = {crumbly=2},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
})


minetest.register_node("default:sandstone", {
	description = "Sandstone",
	tiles = {"default_sandstone.png"},
	is_ground_content = true,
	groups = {crumbly=2,cracky=3, porous=1},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("default:sandstonebrick", {
	description = "Sandstone Brick",
	tiles = {"default_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("default:clay", {
	description = "Clay",
	tiles = {"default_clay.png"},
	is_ground_content = true,
	groups = {crumbly=3, porous=1},
	drop = 'default:clay_lump 4',
	sounds = default.node_sound_dirt_defaults(),
})


minetest.register_node("default:brick", {
	description = "Uncolored Brick Block",
	tiles = {"default_brick.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = default.node_sound_stone_defaults(),
})

-- Colors are beautiful

minetest.register_node("default:brick_black", {
	description = "Black Brick Block",
	tiles = {"default_brick_black.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:brick_blue", {
	description = "Blue Brick Block",
	tiles = {"default_brick_blue.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:brick_brown", {
	description = "Brown Brick Block",
	tiles = {"default_brick_brown.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:brick_cyan", {
	description = "Cyan Brick Block",
	tiles = {"default_brick_cyan.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:brick_dark_green", {
	description = "Dark Green Brick Block",
	tiles = {"default_brick_dark_green.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:brick_dark_grey", {
	description = "Dark Grey Brick Block",
	tiles = {"default_brick_dark_grey.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:brick_green", {
	description = "Green Brick Block",
	tiles = {"default_brick_green.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:brick_grey", {
	description = "Grey Brick Block",
	tiles = {"default_brick_grey.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:brick_magenta", {
	description = "Magenta Brick Block",
	tiles = {"default_brick_magenta.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:brick_orange", {
	description = "Orange Brick Block",
	tiles = {"default_brick_orange.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:brick_pink", {
	description = "Pink Brick Block",
	tiles = {"default_brick_pink.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:brick_red", {
	description = "Red Brick Block",
	tiles = {"default_brick_red.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:brick_violet", {
	description = "Violet Brick Block",
	tiles = {"default_brick_violet.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:brick_white", {
	description = "White Brick Block",
	tiles = {"default_brick_white.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:brick_yellow", {
	description = "Yellow Brick Block",
	tiles = {"default_brick_yellow.png"},
	is_ground_content = false,
	groups = {cracky=3, claybricks=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:tree", {
	description = "Common Tree Trunk",
	tiles = {"default_tree_top.png", "default_tree_top.png", "default_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("default:paletree", {
	description = "Pale Tree Trunk",
	paramtype = "light",
	tiles = {"default_paletree_top.png", "default_paletree_top.png", "default_paletree.png"},
	is_ground_content = false,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.35,-0.5,-0.4,0.35,0.5,0.4},
			{-0.4,-0.5,-0.35, 0.4,0.5,0.35},
			{-0.25,-0.5,-0.45,0.25,0.5,0.45},
			{-0.45,-0.5,-0.25, 0.45,0.5,0.25},
			{-0.15,-0.5,-0.5,0.15,0.5,0.5},
			{-0.5,-0.5,-0.15, 0.5,0.5,0.15},
		},
	},
	groups = {tree = 1, snappy = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:tree_birch",
		{description = "Birch Tree Trunk",
		paramtype = "light",
		tiles = {"default_tree_birch_top.png", "default_tree_birch_top.png", "default_tree_birch.png"},
		is_ground_content = false,
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.35,-0.5,-0.4,0.35,0.5,0.4},
				{-0.4,-0.5,-0.35, 0.4,0.5,0.35},
				{-0.25,-0.5,-0.45,0.25,0.5,0.45},
				{-0.45,-0.5,-0.25, 0.45,0.5,0.25},
				{-0.15,-0.5,-0.5,0.15,0.5,0.5},
				{-0.5,-0.5,-0.15, 0.5,0.5,0.15},
			},
		},
		groups = {tree = 1, snappy = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
		sounds = default.node_sound_wood_defaults(),
	})


minetest.register_node("default:jungletree", {
	description = "Jungle Tree Trunk",
	paramtype = "light",
	tiles = {"default_jungletree_top.png", "default_jungletree_top.png", "default_jungletree.png"},
	is_ground_content = false,
	drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.35,-0.5,-0.4,0.35,0.5,0.4},
				{-0.4,-0.5,-0.35, 0.4,0.5,0.35},
				{-0.25,-0.5,-0.45,0.25,0.5,0.45},
				{-0.45,-0.5,-0.25, 0.45,0.5,0.25},
				{-0.15,-0.5,-0.5,0.15,0.5,0.5},
				{-0.5,-0.5,-0.15, 0.5,0.5,0.15},
			},
		},
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})


minetest.register_node("default:junglewood", {
	description = "Jungle Wood Planks",
	tiles = {"default_junglewood.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:bark", {
	description = "Common Bark",
	paramtype2 = "facedir",
	tiles = { "default_tree.png" },
	is_ground_content = false,
	groups = { choppy = 3, oddly_breakable_by_hand = 1, flammable = 2 },
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:jungle_bark", {
	description = "Jungle Bark",
	paramtype2 = "facedir",
	tiles = { "default_jungletree.png" },
	is_ground_content = false,
	groups = { choppy = 3, oddly_breakable_by_hand = 1, flammable = 2 },
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:pale_bark", {
	description = "Pale Bark",
	paramtype2 = "facedir",
	tiles = { "default_paletree.png" },
	is_ground_content = false,
	groups = { choppy = 3, oddly_breakable_by_hand = 1, flammable = 2 },
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:birch_bark", {
	description = "Birch Bark",
	paramtype2 = "facedir",
	tiles = { "default_tree_birch.png" },
	is_ground_content = false,
	groups = { choppy = 3, oddly_breakable_by_hand = 1, flammable = 2 },
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:jungleleaves", {
	description = "Common Jungle Leaves",
	drawtype = "allfaces_optional",
	visual_scale = 1.3,
	tiles = {"default_jungleleaves.png"},
	paramtype = "light",
	waving = 1,
	is_ground_content = true,
	place_param2 = 1,
	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1, porous=1},
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 chance
				items = {'default:junglesapling'},
				rarity = 25,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {'default:jungleleaves'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})


minetest.register_node("default:junglesapling", {
	description = "Common Jungle Tree Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_junglesapling.png"},
	inventory_image = "default_junglesapling.png",
	wield_image = "default_junglesapling.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy=2,dig_immediate=3,flammable=2,attached_node=1, sapling=1},
	sounds = default.node_sound_leaves_defaults(),
})


minetest.register_node("default:junglegrass", {
	description = "Jungle Grass",
	drawtype = "plantlike",
	visual_scale = 1.3,
	tiles = {"default_junglegrass.png"},
	inventory_image = "default_junglegrass.png",
	wield_image = "default_junglegrass.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	is_ground_content = true,
	groups = {snappy=3,flammable=2,flora=1,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -0.5, -7/16, 7/16, 0.9, 7/16},
	},
})


minetest.register_node("default:leaves", {
	description = "Common Leaves",
	drawtype = "allfaces_optional",
	visual_scale = 1.3,
	tiles = {"default_leaves.png"},
	paramtype = "light",
	waving = 1,
	is_ground_content = true,
	place_param2 = 1,
	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1, porous=1},
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 chance
				items = {'default:sapling'},
				rarity = 20,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {'default:leaves'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})


minetest.register_node("default:cactus", {
	description = "Cactus",
	tiles = {"default_cactus_top.png", "default_cactus_top.png", "default_cactus_side.png"},
	paramtype = "light",
    paramtype2 = "facedir",
	is_ground_content = true,
	drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.35,-0.5,-0.4,0.35,0.5,0.4},
				{-0.4,-0.5,-0.35, 0.4,0.5,0.35},
				{-0.25,-0.5,-0.45,0.25,0.5,0.45},
				{-0.45,-0.5,-0.25, 0.45,0.5,0.25},
				{-0.15,-0.5,-0.5,0.15,0.5,0.5},
				{-0.5,-0.5,-0.15, 0.5,0.5,0.15},
			},
		},
	groups = {snappy=1,choppy=3,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
	
})

minetest.register_node("default:cactus_block", {
	description = "Cactus Block",
	tiles = {"default_cactus_block.png"},
	is_ground_content = false,
	groups = {snappy=1,choppy=3,flammable=2},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:cactus_brick", {
	description = "Cactus Brick",
	tiles = {"default_cactus_brick.png"},
	is_ground_content = false,
	groups = {snappy=1,choppy=3,flammable=2},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:glowing_cactus_block", {
	description = "Glowing Cactus Block",
	tiles = {"default_cactus_block.png"},
	is_ground_content = false,
	light_source = 5,
	groups = {snappy=1,choppy=3,flammable=2},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:sugarcane", {
	description = "Sugarcane",
	drawtype = "plantlike",
	tiles = {"default_sugarcane.png"},
	inventory_image = "default_sugarcane.png",
	wield_image = "default_sugarcane.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
	groups = {snappy=3,flammable=2},
	sounds = default.node_sound_leaves_defaults(),
	
	after_dig_node = function(pos, node, metadata, digger)
		default.dig_up(pos, node, digger)
	end,
})

minetest.register_node("default:papyrus", {
	description = "Papyrus",
	drawtype = "plantlike",
	tiles = {"default_papyrus.png"},
	inventory_image = "default_papyrus.png",
	wield_image = "default_papyrus.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
	groups = {snappy=3,flammable=2},
	sounds = default.node_sound_leaves_defaults(),
	
	after_dig_node = function(pos, node, metadata, digger)
		default.dig_up(pos, node, digger)
	end,
})


minetest.register_node("default:bookshelf", {
	description = "Bookshelf",
	tiles = {"default_wood.png", "default_wood.png", "default_bookshelf.png"},
	is_ground_content = false,
	groups = {choppy=3,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_wood_defaults(),
})


minetest.register_node("default:glass", {
	description = "Glass",
	drawtype = "glasslike",
	tiles = {"default_glass.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

local fences = {
	{ "rusty", "Rusty Fence", "default_rusty.png", {cracky=3, fence_metal=1}, {"group:fence_metal"}, default.node_sound_metal_defaults() },
	{ "wood", "Common Wood Fence", "default_wood.png" },
	{ "pale_wood", "Pale Wood Fence", "default_palewood.png" },
	{ "birch_wood", "Birch Wood Fence", "default_birchwood.png" },
	{ "jungle_wood", "Jungle Wood Fence", "default_junglewood.png" },
	{ "wood_black", "Black Wood Fence", "default_colwood_black.png" },
	{ "wood_blue", "Blue Wood Fence", "default_colwood_blue.png" },
	{ "wood_cyan", "Cyan Wood Fence", "default_colwood_cyan.png" },
	{ "wood_magenta", "Magenta Wood Fence", "default_colwood_magenta.png" },
	{ "wood_violet", "Violet Wood Fence", "default_colwood_violet.png" },
	{ "wood_red", "Red Wood Fence", "default_colwood_red.png" },
	{ "wood_pink", "Pink Wood Fence", "default_colwood_pink.png" },
	{ "wood_orange", "Orange Wood Fence", "default_colwood_orange.png" },
	{ "wood_brown", "Brown Wood Fence", "default_colwood_brown.png" },
	{ "wood_yellow", "Yellow Wood Fence", "default_colwood_yellow.png" },
	{ "wood_green", "Green Wood Fence", "default_colwood_green.png" },
	{ "wood_dark_green", "Dark Green Wood Fence", "default_colwood_dark_green.png" },
	{ "wood_white", "White Wood Fence", "default_colwood_white.png" },
	{ "wood_grey", "Grey Wood Fence", "default_colwood_grey.png" },
	{ "wood_dark_grey", "Dark Grey Wood Fence", "default_colwood_dark_grey.png" },
}

for i=1, #fences do
	local groups = {choppy=2, oddly_breakable_by_hand=2, flammable=2, fence_wood=1}
	local sounds = default.node_sound_wood_defaults()
	if fences[i][4] then
		groups = fences[i][4]
	end
	local connects_to = fences[i][5]
	if fences[i][6] then
		sounds = fences[i][6]
	end
	default.register_fence("default:fence_"..fences[i][1], {
		description = fences[i][2],
		texture = fences[i][3],
		groups = groups,
		sounds = sounds,
		connects_to = connects_to,
	})
end

minetest.register_node("default:rail", {
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
	groups = {bendy=2,dig_immediate=2,attached_node=1,connect_to_raillike=minetest.raillike_group("rail")},
	sounds = default.node_sound_metal_defaults(),
})

default.register_ladder("default:ladder", {
	description = "Wooden Ladder",
	texture = "default_ladder.png",
	groups = {choppy=2,oddly_breakable_by_hand=3,flammable=2},
	sounds = default.node_sound_wood_defaults(),
})

default.register_ladder("default:ladder_bronze", {
	description = "Bronze Ladder",
	texture = "default_ladder_bronze.png",
	groups = {cracky=3},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("default:wood", {
	description = "Common Wood Planks",
	tiles = {"default_wood.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("default:birchwood", {
	description = "Birch Wood Planks",
	tiles = {"default_birchwood.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("default:palewood", {
	description = "Pale Wood Planks",
	tiles = {"default_palewood.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

-- colored wood

minetest.register_node("default:colwood_black", {
	description = "Black Wood Planks",
	tiles = {"default_colwood_black.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:colwood_blue", {
	description = "Blue Wood Planks",
	tiles = {"default_colwood_blue.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:colwood_brown", {
	description = "Brown Wood Planks",
	tiles = {"default_colwood_brown.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:colwood_cyan", {
	description = "Cyan Wood Planks",
	tiles = {"default_colwood_cyan.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:colwood_dark_green", {
	description = "Dark Green Wood Planks",
	tiles = {"default_colwood_dark_green.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:colwood_dark_grey", {
	description = "Dark Grey Wood Planks",
	tiles = {"default_colwood_dark_grey.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:colwood_green", {
	description = "Green Wood Planks",
	tiles = {"default_colwood_green.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:colwood_grey", {
	description = "Grey Wood Planks",
	tiles = {"default_colwood_grey.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:colwood_magenta", {
	description = "Magenta Wood Planks",
	tiles = {"default_colwood_magenta.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:colwood_orange", {
	description = "Orange Wood Planks",
	tiles = {"default_colwood_orange.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:colwood_pink", {
	description = "Pink Wood Planks",
	tiles = {"default_colwood_pink.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:colwood_red", {
	description = "Red Wood Planks",
	tiles = {"default_colwood_red.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:colwood_violet", {
	description = "Violet Wood Planks",
	tiles = {"default_colwood_violet.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:colwood_white", {
	description = "White Wood Planks",
	tiles = {"default_colwood_white.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:colwood_yellow", {
	description = "Yellow Wood Planks",
	tiles = {"default_colwood_yellow.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})


---

minetest.register_node("default:water_flowing", {
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
	liquid_alternative_flowing = "default:water_flowing",
	liquid_alternative_source = "default:water_source",
	liquid_viscosity = WATER_VISC,
	post_effect_color = {a=64, r=100, g=100, b=200},
	groups = {water=3, liquid=3, puts_out_fire=1, not_in_creative_inventory=1, freezes=1, melt_around=1},
	sounds = default.node_sound_water_defaults(),
})


minetest.register_node("default:water_source", {
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
	liquid_alternative_flowing = "default:water_flowing",
	liquid_alternative_source = "default:water_source",
	liquid_viscosity = WATER_VISC,
	post_effect_color = {a=64, r=100, g=100, b=200},
	groups = {water=3, liquid=3, puts_out_fire=1, freezes=1},
	sounds = default.node_sound_water_defaults(),
})


minetest.register_node("default:lava_flowing", {
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
	liquid_alternative_flowing = "default:lava_flowing",
	liquid_alternative_source = "default:lava_source",
	liquid_viscosity = LAVA_VISC,
	liquid_renewable = true,
	damage_per_second = 2*2,
	post_effect_color = {a=192, r=255, g=64, b=0},
	groups = {lava=3, liquid=2, igniter=1, not_in_creative_inventory=1},
	sounds = default.node_sound_lava_defaults(),
})


minetest.register_node("default:lava_source", {
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
	liquid_alternative_flowing = "default:lava_flowing",
	liquid_alternative_source = "default:lava_source",
	liquid_viscosity = LAVA_VISC,
	liquid_renewable = true,
	damage_per_second = 2*2,
	post_effect_color = {a=192, r=255, g=64, b=0},
	groups = {lava=3, liquid=2, igniter=1},
	sounds = default.node_sound_lava_defaults(),
})


-- Lamps
minetest.register_node("default:lamp_wall", {
    description = "Attached Lamp",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "wallmounted",
	tiles = {"default_lamp.png"},
	wield_image = "default_lamp_inv.png",
	inventory_image = "default_lamp_inv.png",
	sunlight_propagates = true,
	light_source = 13,
	walkable = false,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3,attached_node=1},
	node_box = {
		type = "wallmounted",
		wall_side = {-0.5, -0.1875, -0.1875, -0.375, 0.1875, 0.1875},
		wall_top = {-0.25, 0.375, -0.25, 0.25, 0.5, 0.25},
		wall_bottom = {-0.25, -0.5, -0.25, 0.25, -0.375, 0.25},
	},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:latern", {
    description = "Bronze Floor Lantern",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		"default_latern_top.png",
		"default_latern_top.png", -- bottom
		"default_latern_side.png",
		"default_latern_side.png",
		"default_latern_side.png",
		"default_latern_side.png",
			},
	sunlight_propagates = true,
	light_source = 13,
	walkable = false,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	node_box = {
		type = "fixed",
		fixed = {
	        {-0.25, -0.1875, -0.25, 0.25, 0.1875, 0.25},
			{-0.1875, -0.25, -0.1875, 0.1875, 0.25, 0.1875},
			{-0.125, -0.3125, -0.125, 0.125, 0.3125, 0.125},
			{-0.0625, -0.5, -0.0625, 0.0625, 0.375, 0.0625},
			{-0.125, -0.5, -0.125, 0.125, -0.4375, 0.125},
		}
	},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:laternrusty", {
    description = "Rusty Floor Lantern",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		"default_laternrusty_top.png",
		"default_laternrusty_top.png", -- bottom
		"default_laternrusty_side.png",
		"default_laternrusty_side.png",
		"default_laternrusty_side.png",
		"default_laternrusty_side.png",
			},
	sunlight_propagates = true,
	light_source = 13,
	walkable = false,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	node_box = {
		type = "fixed",
		fixed = {
	        {-0.25, -0.1875, -0.25, 0.25, 0.1875, 0.25},
			{-0.1875, -0.25, -0.1875, 0.1875, 0.25, 0.1875},
			{-0.125, -0.3125, -0.125, 0.125, 0.3125, 0.125},
			{-0.0625, -0.5, -0.0625, 0.0625, 0.375, 0.0625},
			{-0.125, -0.5, -0.125, 0.125, -0.4375, 0.125},
		}
	},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:sign_wall", {
	description = "Wooden Sign",
	drawtype = "signlike",
	tiles = {"default_sign_wall.png"},
	inventory_image = "default_sign_wall.png",
	wield_image = "default_sign_wall.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = <default>
		--wall_bottom = <default>
		--wall_side = <default>
	},
	groups = {choppy=2,dig_immediate=2,attached_node=1},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
	on_construct = function(pos)
		--local n = minetest.get_node(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "field[text;;${text}]")
		meta:set_string("infotext", "\"\"")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		--print("Sign at "..minetest.pos_to_string(pos).." got "..dump(fields))
		if minetest.is_protected(pos, sender:get_player_name()) then
			minetest.record_protection_violation(pos, sender:get_player_name())
			return
		end
		local meta = minetest.get_meta(pos)
		fields.text = fields.text or ""
		minetest.log("action", (sender:get_player_name() or "").." wrote \""..fields.text..
				"\" to sign at "..minetest.pos_to_string(pos))
		meta:set_string("text", fields.text)
		meta:set_string("infotext", '"'..fields.text..'"')
	end,
})


default.chest_formspec =
	"size[8,9]"..
	"list[current_name;main;0,0;8,4;]"..
	"list[current_player;main;0,5;8,4;]"..
	"listring[]"..
	"background[-0.5,-0.65;9,10.35;".."chestui.png".."]"

function default.get_locked_chest_formspec(pos)
	local spos = pos.x .. "," .. pos.y .. "," ..pos.z
	local formspec =
		"size[8,9]"..
		"list[nodemeta:".. spos .. ";main;0,0;8,4;]"..
		"list[current_player;main;0,5;8,4;]"..
		"listring[]"..
		"background[-0.5,-0.65;9,10.35;".."chestui.png".."]"
	return formspec
end




minetest.register_node("default:chest", {
	description = "Chest",
	tiles = {"default_chest_top.png", "default_chest_top.png", "default_chest_side.png",
		"default_chest_side.png", "default_chest_side.png", "default_chest_front.png"},
	paramtype2 = "facedir",
	groups = {choppy=2,oddly_breakable_by_hand=2, chests=1},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",default.chest_formspec)
		meta:set_string("infotext", "Chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from chest at "..minetest.pos_to_string(pos))
	end,
})


local function has_locked_chest_privilege(meta, player)
	if player:get_player_name() ~= meta:get_string("owner") then
		return false
	end
	return true
end


minetest.register_node("default:chest_locked", {
	description = "Locked Chest",
	tiles = {"default_chest_top.png", "default_chest_top.png", "default_chest_side.png",
		"default_chest_side.png", "default_chest_side.png", "default_chest_lock.png"},
	paramtype2 = "facedir",
	groups = {choppy=2,oddly_breakable_by_hand=2, lchests=1},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),
	after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "Locked Chest (owned by "..
				meta:get_string("owner")..")")
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Locked Chest")
		meta:set_string("owner", "")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main") and has_locked_chest_privilege(meta, player)
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		if not has_locked_chest_privilege(meta, player) then
			minetest.log("action", player:get_player_name()..
					" tried to access a locked chest belonging to "..
					meta:get_string("owner").." at "..
					minetest.pos_to_string(pos))
			return 0
		end
		return count
	end,
    allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if not has_locked_chest_privilege(meta, player) then
			minetest.log("action", player:get_player_name()..
					" tried to access a locked chest belonging to "..
					meta:get_string("owner").." at "..
					minetest.pos_to_string(pos))
			return 0
		end
		return stack:get_count()
	end,
    allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if not has_locked_chest_privilege(meta, player) then
			minetest.log("action", player:get_player_name()..
					" tried to access a locked chest belonging to "..
					meta:get_string("owner").." at "..
					minetest.pos_to_string(pos))
			return 0
		end
		return stack:get_count()
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in locked chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to locked chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from locked chest at "..minetest.pos_to_string(pos))
	end,
	on_rightclick = function(pos, node, clicker)
		local meta = minetest.get_meta(pos)
		if has_locked_chest_privilege(meta, clicker) then
			minetest.show_formspec(
				clicker:get_player_name(),
				"default:chest_locked",
				default.get_locked_chest_formspec(pos)
			)
		end
	end,
})

minetest.register_node("default:cobble", {
	description = "Cobblestone",
	tiles = {"default_cobble.png"},
	is_ground_content = false,
	groups = {cracky=3, stone=2, porous=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:cobble_block", {
	description = "Cobblestone Block",
	tiles = {"default_cobble_block.png"},
	is_ground_content = false,
	groups = {cracky=3, stone=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:cobble_baked", {
	description = "Burned Cobblestone",
	tiles = {"default_cobble_baked.png"},
	is_ground_content = false,
	groups = {cracky=3, stone=2, porous=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:cobble_block_baked", {
	description = "Burned Cobblestone Block",
	tiles = {"default_cobble_baked_block.png"},
	is_ground_content = false,
	groups = {cracky=3, stone=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:mossycobble", {
	description = "Mossy Cobblestone",
	tiles = {"default_mossycobble.png"},
	is_ground_content = false,
	groups = {cracky=3, porous=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:coalblock", {
	description = "Coal Block",
	tiles = {"default_coal_block.png"},
	is_ground_content = false,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:steelblock", {
	description = "Steel Block",
	tiles = {"default_steel_block.png"},
	is_ground_content = false,
	groups = {cracky=1,level=2},
	sounds = default.node_sound_heavy_metal_defaults(),
})

minetest.register_node("default:tinblock", {
	description = "Tin Block",
	tiles = {"default_tin_block.png"},
	is_ground_content = false,
	groups = {cracky=1,level=2},
	sounds = default.node_sound_heavy_metal_defaults(),
})

minetest.register_node("default:copperblock", {
	description = "Copper Block",
	tiles = {"default_copper_block.png"},
	is_ground_content = false,
	groups = {cracky=1,level=2},
	sounds = default.node_sound_heavy_metal_defaults(),
})


minetest.register_node("default:bronzeblock", {
	description = "Bronze Block",
	tiles = {"default_bronze_block.png"},
	is_ground_content = false,
	groups = {cracky=1,level=2},
	sounds = default.node_sound_heavy_metal_defaults(),
})


minetest.register_node("default:mese", {
	description = "Mese Block",
	tiles = {"default_mese_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("default:goldblock", {
	description = "Gold Block",
	tiles = {"default_gold_block.png"},
	is_ground_content = false,
	groups = {cracky=1},
	sounds = default.node_sound_heavy_metal_defaults(),
})

minetest.register_node("default:emerald_block", {
	description = "Emerald Block",
	tiles = {"default_emerald_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:sapphire_block", {
	description = "Sapphire Block",
	tiles = {"default_sapphire_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:ruby_block", {
	description = "Ruby Block",
	tiles = {"default_ruby_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:diamondblock", {
	description = "Diamond Block",
	tiles = {"default_diamond_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=3},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("default:obsidian_glass", {
	description = "Obsidian Glass",
	drawtype = "glasslike",
	tiles = {"default_obsidian_glass.png"},
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
})


minetest.register_node("default:obsidian", {
	description = "Obsidian",
	tiles = {"default_obsidian.png"},
	is_ground_content = true,
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky=1,level=2},
})

minetest.register_node("default:obsidian_block", {
	description = "Obsidian Block",
	tiles = {"default_obsidian_block.png"},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky=2},
})


minetest.register_node("default:sapling", {
	description = "Common Tree Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_sapling.png"},
	inventory_image = "default_sapling.png",
	wield_image = "default_sapling.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy=2,dig_immediate=3,flammable=2,attached_node=1, sapling=1},
	sounds = default.node_sound_leaves_defaults(),
})


minetest.register_node("default:apple", {
	description = "Apple (+2)",
	drawtype = "plantlike",
	visual_scale = 0.75,
	tiles = {"default_apple.png"},
	inventory_image = "default_apple.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	groups = {fleshy=3,dig_immediate=3,flammable=2,leafdecay=3,leafdecay_drop=1,food=2,eatable=2},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name="default:apple", param2=1})
		end
	end,
})


minetest.register_node("default:dry_shrub", {
	description = "Dry Shrub",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_dry_shrub.png"},
	inventory_image = "default_dry_shrub.png",
	wield_image = "default_dry_shrub.png",
	paramtype = "light",
	waving = 1,
	walkable = false,
	is_ground_content = true,
	buildable_to = true,
	groups = {snappy=3,flammable=3,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6/16, -0.5, -6/16, 6/16, 4/16, 6/16},
	},
})


minetest.register_node("default:grass_1", {
	description = "Grass",
	drawtype = "plantlike",
	tiles = {"default_grass_1.png"},
	-- use a bigger inventory image
	inventory_image = "default_grass_3.png",
	wield_image = "default_grass_3.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = true,
	buildable_to = true,
	groups = {snappy=3,flammable=3,flora=1,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6/16, -0.5, -6/16, 6/16, -5/16, 6/16},
	},
	on_place = function(itemstack, placer, pointed_thing)
		-- place a random grass node
		local stack = ItemStack("default:grass_"..math.random(1,5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("default:grass_1 "..itemstack:get_count()-(1-ret:get_count()))
	end,
})


minetest.register_node("default:grass_2", {
	description = "Grass",
	drawtype = "plantlike",
	tiles = {"default_grass_2.png"},
	inventory_image = "default_grass_2.png",
	wield_image = "default_grass_2.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	is_ground_content = true,
	drop = "default:grass_1",
	groups = {snappy=3,flammable=3,flora=1,attached_node=1,not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6/16, -0.5, -6/16, 6/16, -3/16, 6/16},
	},
})
minetest.register_node("default:grass_3", {
	description = "Grass",
	drawtype = "plantlike",
	tiles = {"default_grass_3.png"},
	inventory_image = "default_grass_3.png",
	wield_image = "default_grass_3.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	is_ground_content = true,
	drop = "default:grass_1",
	groups = {snappy=3,flammable=3,flora=1,attached_node=1,not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6/16, -0.5, -6/16, 6/16, -3/16, 6/16},
	},
})


minetest.register_node("default:grass_4", {
	description = "Grass",
	drawtype = "plantlike",
	tiles = {"default_grass_4.png"},
	inventory_image = "default_grass_4.png",
	wield_image = "default_grass_4.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	is_ground_content = true,
	drop = "default:grass_1",
	groups = {snappy=3,flammable=3,flora=1,attached_node=1,not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6/16, -0.5, -6/16, 6/16, -3/16, 6/16},
	},
})


minetest.register_node("default:grass_5", {
	description = "Grass",
	drawtype = "plantlike",
	tiles = {"default_grass_5.png"},
	inventory_image = "default_grass_5.png",
	wield_image = "default_grass_5.png",
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	is_ground_content = true,
	drop = "default:grass_1",
	groups = {snappy=3,flammable=3,flora=1,attached_node=1,not_in_creative_inventory=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6/16, -0.5, -6/16, 6/16, -3/16, 6/16},
	},
})


minetest.register_node("default:snag", {
	description = "Snag",
	tiles = {"default_tree.png", "default_tree.png", "default_tree.png"},
                      paramtype = "light",
	-- paramtype2 = "facedir",
	is_ground_content = true,
                     drawtype = "nodebox",
                      node_box = {
		type = "fixed",
		fixed = {
			{-0.03125, -0.5, -0.03125, 0.03125, -0.0625, 0.03125},
			{0.03125, -0.15625, -0.03125, 0.09375, -0.09375, 0.03125},
			{0.0625, -0.1875, -0.03125, 0.125, 0.0625, 0.03125},
			{-0.09375, -0.21875, -0.03125, -0.03125, -0.15625, 0.03125},
			{-0.15625, -0.25, -0.03125, -0.09375, -0.125, 0.03125},
			{-0.03125, -0.34375, 0.03125, 0.03125, -0.28125, 0.09375},
			{-0.03125, -0.46875, -0.09375, 0.03125, -0.40625, -0.03125},
			{-0.03125, -0.375, 0.09375, 0.03125, -0.25, 0.15625},
		}
	},
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
                     drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/5 chance
				items = {'default:snag'},
				rarity = 5,
			},
			{
				-- player will get wood only if he get no saplings,
				-- this is because max_items is 1
				items = {'default:wood'},
			}
		}
	},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("default:stone_with_emerald", {
	description = "Emerald Ore",
	tiles = {"default_stone.png^default_mineral_emerald.png"},
	is_ground_content = true,
	groups = {cracky=2, porous=1},
	drop = "default:emerald",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_with_sapphire", {
	description = "Sapphire Ore",
	tiles = {"default_stone.png^default_mineral_sapphire.png"},
	is_ground_content = true,
	groups = {cracky=2, porous=1},
	drop = "default:sapphire",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_with_ruby", {
	description = "Ruby Ore",
	tiles = {"default_stone.png^default_mineral_ruby.png"},
	is_ground_content = true,
	groups = {cracky=1, porous=1},
	drop = "default:ruby",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:plate", {
	description = "Plate",
	inventory_image = "default_plate.png",
	wield_image = "default_plate.png",
	tiles = { "default_plate.png" },
	drawtype = "signlike",
	paramtype = "light",
	paramtype2 = "wallmounted",
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	groups = {dig_immediate=3, attached_node=1},
	on_rotate = false,
	walkable = false,
	selection_box = {
		type = "wallmounted",
	},
})
