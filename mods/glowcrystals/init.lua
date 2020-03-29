--[[
Glowcrystals
A Minetest mod by SegFault22

Details: Adds several items for lighting, made out of glowing crystals - a better alternative to those ugly infini-torches.
--]]


--///////////////
-- Ores & Blocks
--///////////////

minetest.register_node( "glowcrystals:glowcrystal_ore", {
	description = "Glowing Crystal Ore",
	tiles = { "default_essexite.png^glowcrystals_ore_glowcrystal.png" },
	is_ground_content = true,
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 10,
	groups = {cracky=3},
	sounds = hades_sounds.node_sound_stone_defaults(),
	drop = 'craft "glowcrystals:glowcrystal" 1',
})

minetest.register_node( "glowcrystals:glowcrystal_block", {
	description = "Glowing Crystal Block",
	tiles = { "glowcrystals_block_glowcrystal.png" },
	is_ground_content = true,
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 14,
	groups = {cracky=3},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("glowcrystals:glowcrystal_torch", {
	description = "Glowing Crystal Torch",
	drawtype = "torchlike",
	tiles = {"glowcrystals_glowtorch_on_floor.png", "glowcrystals_glowtorch_on_ceiling.png", "glowcrystals_glowtorch.png"},
	inventory_image = "glowcrystals_glowtorch_on_floor.png",
	wield_image = "glowcrystals_glowtorch_on_floor.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = minetest.LIGHT_MAX-1,
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.1, 0.5-0.6, -0.1, 0.1, 0.5, 0.1},
		wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5+0.6, 0.1},
		wall_side = {-0.5, -0.3, -0.1, -0.5+0.3, 0.3, 0.1},
	},
	groups = {choppy=2,dig_immediate=3,attached_node=1},
	legacy_wallmounted = true,
	sounds = hades_sounds.node_sound_defaults(),
})

minetest.register_node("glowcrystals:glowglass", {
	description = "Glow Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"glowcrystals_glowglass.png", "glowcrystals_glowglass_detail.png" },
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 11,
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = hades_sounds.node_sound_glass_defaults(),
})

if minetest.get_modpath("windows") then
	windows.register_window("glowcrystals:windows_glow", {
		description = "Glowing Window",
		texture_seam = "glowcrystals_windows_glow_seam.png",
		texture_front = "glowcrystals_windows_glow_front.png",
		light_source = 11,
		groups = {cracky=3,oddly_breakable_by_hand=3},
		sounds = hades_sounds.node_sound_glass_defaults({
			footstep = hades_sounds.node_sound_stone_defaults().footstep,
		})
	})

	minetest.register_craft({
		output = 'glowcrystals:windows_glow 4',
		recipe = {
			{'default:obsidian_shard', 'glowcrystals:glowglass', 'default:obsidian_shard'},
			{'glowcrystals:glowglass', 'glowcrystals:glowglass', 'glowcrystals:glowglass'},
			{'default:obsidian_shard', 'glowcrystals:glowglass', 'default:obsidian_shard'},
		}
	})
end

--///////
-- Items
--///////

minetest.register_craftitem( "glowcrystals:glowcrystal", {
	description = "Glowing Crystal",
	inventory_image = "glowcrystals_item_glowcrystal.png",
	on_place_on_ground = minetest.craftitem_place_item,
})

minetest.register_craftitem( "glowcrystals:glowdust", {
	description = "Glow Dust",
	inventory_image = "glowcrystals_item_dust.png",
	on_place_on_ground = minetest.craftitem_place_item,
})

--//////////
-- Crafting
--//////////

minetest.register_craft( {
	output = 'glowcrystals:glowcrystal_block',
	recipe = {
		{ 'glowcrystals:glowcrystal', 'glowcrystals:glowcrystal', 'glowcrystals:glowcrystal' },
		{ 'glowcrystals:glowcrystal', 'glowcrystals:glowcrystal', 'glowcrystals:glowcrystal' },
		{ 'glowcrystals:glowcrystal', 'glowcrystals:glowcrystal', 'glowcrystals:glowcrystal' },
	}
})

minetest.register_craft({
	output = 'glowcrystals:glowcrystal 9',
	recipe = {
		{'glowcrystals:glowcrystal_block'},
	}
})

minetest.register_craft({
	output = 'glowcrystals:glowdust 4',
	recipe = {
		{'glowcrystals:glowcrystal'},
	}
})

minetest.register_craft({
	output = 'glowcrystals:glowcrystal_torch 4',
	recipe = {
		{'glowcrystals:glowcrystal'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'glowcrystals:glowglass',
	recipe = {
		{'glowcrystals:glowdust'},
		{'default:glass'},
	}
})

minetest.register_craft({
	output = 'default:glowing_cactus_block',
	recipe = {
		{'glowcrystals:glowdust'},
		{'default:cactus_block'},
	}
})

--////////////////
-- Ore Generation
--////////////////

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "glowcrystals:glowcrystal_ore",
    wherein        = "default:essexite",
    clust_scarcity = 9*9*9,
    clust_num_ores = 4,
    clust_size     = 3,
    y_min     = -31000,
    y_max     = -5000,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "glowcrystals:glowcrystal_ore",
    wherein        = "default:essexite",
    clust_scarcity = 24*24*24,
	clust_num_ores = 27,
	clust_size     = 6,
	y_min     = -31000,
	y_max     = -10000,
	flags          = "absheight",
})
--/////////
-- Aliases
--/////////

minetest.register_alias("glowcrystal", "glowcrystals:glowcrystal")
minetest.register_alias("glowcrystal_torch", "glowcrystals:glowcrystal_torch")
minetest.register_alias("glowcrystal_block", "glowcrystals:glowcrystal_block")
