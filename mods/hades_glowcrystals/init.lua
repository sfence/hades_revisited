local S = minetest.get_translator("hades_glowcrystals")

--[[
Glowcrystals
A Minetest mod by SegFault22

Details: Adds several items for lighting, made out of glowing crystals - a better alternative to those ugly infini-torches.
--]]


--///////////////
-- Ores & Blocks
--///////////////

minetest.register_node( "hades_glowcrystals:glowcrystal_ore", {
	description = S("Glowing Crystal Ore"),
	tiles = { "hades_core_essexite.png^glowcrystals_ore_glowcrystal.png" },
	is_ground_content = true,
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 10,
	groups = {cracky=3, ore=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
	drop = 'hades_glowcrystals:glowcrystal',
})

minetest.register_node( "hades_glowcrystals:glowcrystal_block", {
	description = S("Glowing Crystal Block"),
	tiles = { "glowcrystals_block_glowcrystal.png" },
	is_ground_content = true,
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 14,
	groups = {cracky=3},
	sounds = hades_sounds.node_sound_stone_defaults(),
})

minetest.register_node("hades_glowcrystals:glowcrystal_torch", {
	description = S("Glowing Crystal Torch"),
	drawtype = "torchlike",
	tiles = {"glowcrystals_glowtorch_on_floor.png", "glowcrystals_glowtorch_on_ceiling.png", "glowcrystals_glowtorch.png"},
	inventory_image = "glowcrystals_glowtorch_on_floor.png",
	wield_image = "glowcrystals_glowtorch_on_floor.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	floodable = true,
	light_source = minetest.LIGHT_MAX-1,
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.1, 0.5-0.6, -0.1, 0.1, 0.5, 0.1},
		wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5+0.6, 0.1},
		wall_side = {-0.5, -0.3, -0.1, -0.5+0.3, 0.3, 0.1},
	},
	groups = {choppy=2,dig_immediate=3,attached_node=1},
	sounds = hades_sounds.node_sound_defaults(),
	on_rotate = false,
})

minetest.register_node("hades_glowcrystals:glowglass", {
	description = S("Glow Glass"),
	drawtype = "glasslike_framed_optional",
	tiles = {"glowcrystals_glowglass.png", "glowcrystals_glowglass_detail.png" },
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 11,
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = hades_sounds.node_sound_glass_defaults(),
})

if minetest.get_modpath("hades_windows") then
	hades_windows.register_window("hades_glowcrystals:window_glow", {
		description = S("Glowing Window"),
		texture_seam = "hades_glowcrystals_window_glow_seam.png",
		texture_front = "hades_glowcrystals_window_glow_front.png",
		light_source = 11,
		groups = {cracky=3,oddly_breakable_by_hand=3},
		sounds = hades_sounds.node_sound_glass_defaults({
			footstep = hades_sounds.node_sound_stone_defaults().footstep,
		})
	})

	minetest.register_craft({
		output = 'hades_glowcrystals:window_glow 4',
		recipe = {
			{'hades_core:obsidian_shard', 'hades_glowcrystals:glowglass', 'hades_core:obsidian_shard'},
			{'hades_glowcrystals:glowglass', 'hades_glowcrystals:glowglass', 'hades_glowcrystals:glowglass'},
			{'hades_core:obsidian_shard', 'hades_glowcrystals:glowglass', 'hades_core:obsidian_shard'},
		}
	})
end

--///////
-- Items
--///////

minetest.register_craftitem( "hades_glowcrystals:glowcrystal", {
	description = S("Glowing Crystal"),
	inventory_image = "glowcrystals_item_glowcrystal.png",
	on_place_on_ground = minetest.craftitem_place_item,
})

minetest.register_craftitem( "hades_glowcrystals:glowdust", {
	description = S("Glow Dust"),
	inventory_image = "glowcrystals_item_dust.png",
	on_place_on_ground = minetest.craftitem_place_item,
})

--//////////
-- Crafting
--//////////

minetest.register_craft( {
	output = 'hades_glowcrystals:glowcrystal_block',
	recipe = {
		{ 'hades_glowcrystals:glowcrystal', 'hades_glowcrystals:glowcrystal', 'hades_glowcrystals:glowcrystal' },
		{ 'hades_glowcrystals:glowcrystal', 'hades_glowcrystals:glowcrystal', 'hades_glowcrystals:glowcrystal' },
		{ 'hades_glowcrystals:glowcrystal', 'hades_glowcrystals:glowcrystal', 'hades_glowcrystals:glowcrystal' },
	}
})

minetest.register_craft({
	output = 'hades_glowcrystals:glowcrystal 9',
	recipe = {
		{'hades_glowcrystals:glowcrystal_block'},
	}
})

minetest.register_craft({
	output = 'hades_glowcrystals:glowdust 4',
	recipe = {
		{'hades_glowcrystals:glowcrystal'},
	}
})

minetest.register_craft({
	output = 'hades_glowcrystals:glowcrystal_torch 4',
	recipe = {
		{'hades_glowcrystals:glowcrystal'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'hades_glowcrystals:glowglass',
	recipe = {
		{'hades_glowcrystals:glowdust'},
		{'hades_core:glass'},
	}
})

minetest.register_craft({
	output = 'hades_core:glowing_cactus_block',
	recipe = {
		{'hades_glowcrystals:glowdust'},
		{'hades_core:cactus_block'},
	}
})

--/////////
-- Aliases
--/////////

minetest.register_alias("glowcrystals:glowcrystal", "hades_glowcrystals:glowcrystal")
minetest.register_alias("glowcrystals:glowcrystal_block", "hades_glowcrystals:glowcrystal_block")
minetest.register_alias("glowcrystals:glowcrystal_ore", "hades_glowcrystals:glowcrystal_ore")
minetest.register_alias("glowcrystals:glowcrystal_torch", "hades_glowcrystals:glowcrystal_torch")
minetest.register_alias("glowcrystals:glowdust", "hades_glowcrystals:glowdust")
minetest.register_alias("glowcrystals:glowglass", "hades_glowcrystals:glowglass")
minetest.register_alias("glowcrystals:windows_glow", "hades_glowcrystals:window_glow")
