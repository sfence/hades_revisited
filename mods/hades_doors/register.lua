local S = minetest.get_translator("hades_doors")

hades_doors.register_door("hades_doors:door_wood", {
	description = S("Temperate Wood Door"),
	inventory_image = "hades_doors_wood.png",
	groups = {choppy=3,oddly_breakable_by_hand=2,flammable=2,door=1},
	tiles = {{name="hades_doors_door_wood.png", backface_culling=true}},
	use_texture_alpha = "clip",
	sounds = hades_sounds.node_sound_wood_defaults(),
	sunlight_propagates = false,
})

minetest.register_craft({
	output = "hades_doors:door_wood",
	recipe = {
		{"hades_trees:wood", "hades_trees:wood"},
		{"hades_trees:wood", "hades_trees:wood"},
		{"hades_trees:wood", "hades_trees:wood"}
	}
})

hades_doors.register_door("hades_doors:door_wood_pale", {
	description = S("Pale Wood Door"),
	inventory_image = "hades_doors_wood_pale.png",
	groups = {choppy=3,oddly_breakable_by_hand=2,flammable=2,door=1},
	tiles = {{name="hades_doors_door_wood_pale.png", backface_culling=true}},
	use_texture_alpha = "clip",
	sounds = hades_sounds.node_sound_wood_defaults(),
	sunlight_propagates = false,
})

minetest.register_craft({
	output = "hades_doors:door_wood_pale",
	recipe = {
		{"hades_trees:pale_wood", "hades_trees:pale_wood"},
		{"hades_trees:pale_wood", "hades_trees:pale_wood"},
		{"hades_trees:pale_wood", "hades_trees:pale_wood"}
	}
})


hades_doors.register_door("hades_doors:door_wood_jungle", {
	description = S("Tropical Wood Door"),
	inventory_image = "hades_doors_wood_jungle.png",
	groups = {choppy=3,oddly_breakable_by_hand=2,flammable=2,door=1},
	tiles = {{name="hades_doors_door_wood_jungle.png", backface_culling=true}},
	use_texture_alpha = "clip",
	sounds = hades_sounds.node_sound_wood_defaults(),
	sunlight_propagates = false,
})

minetest.register_craft({
	output = "hades_doors:door_wood_jungle",
	recipe = {
		{"hades_trees:jungle_wood", "hades_trees:jungle_wood"},
		{"hades_trees:jungle_wood", "hades_trees:jungle_wood"},
		{"hades_trees:jungle_wood", "hades_trees:jungle_wood"}
	}
})

hades_doors.register_door("hades_doors:door_wood_cream", {
	description = S("Cream Wood Door"),
	inventory_image = "hades_doors_wood_cream.png",
	groups = {choppy=3,oddly_breakable_by_hand=2,flammable=2,door=1},
	tiles = {{name="hades_doors_door_wood_cream.png", backface_culling=true}},
	use_texture_alpha = "clip",
	sounds = hades_sounds.node_sound_wood_defaults(),
	sunlight_propagates = false,
})

minetest.register_craft({
	output = "hades_doors:door_wood_cream",
	recipe = {
		{"hades_trees:cream_wood", "hades_trees:cream_wood"},
		{"hades_trees:cream_wood", "hades_trees:cream_wood"},
		{"hades_trees:cream_wood", "hades_trees:cream_wood"}
	}
})

hades_doors.register_door("hades_doors:door_wood_lush", {
	description = S("Lush Wood Door"),
	inventory_image = "hades_doors_wood_lush.png",
	groups = {choppy=3,oddly_breakable_by_hand=2,flammable=2,door=1},
	tiles = {{name="hades_doors_door_wood_lush.png", backface_culling=true}},
	use_texture_alpha = "clip",
	sounds = hades_sounds.node_sound_wood_defaults(),
	sunlight_propagates = false,
})

minetest.register_craft({
	output = "hades_doors:door_wood_lush",
	recipe = {
		{"hades_trees:lush_wood", "hades_trees:lush_wood"},
		{"hades_trees:lush_wood", "hades_trees:lush_wood"},
		{"hades_trees:lush_wood", "hades_trees:lush_wood"}
	}
})



minetest.register_craft({
	type = "shapeless",
	output = "hades_doors:door_steel",
	recipe = { "group:steel_door", "hades_trees:canvas_leaves" },
})

hades_doors.register_door("hades_doors:door_steel", {
	description = S("Plain Steel Door"),
	inventory_image = "hades_doors_steel.png",
	groups = {cracky=2,door=1,steel_door=1},
	tiles = {{name="hades_doors_door_steel.png", backface_culling=true}},
	use_texture_alpha = "clip",
	only_placer_can_open = true,
	sounds = hades_sounds.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	sunlight_propagates = false,
})

minetest.register_craft({
	output = "hades_doors:door_steel",
	recipe = {
		{"hades_core:steel_ingot", "hades_core:steel_ingot"},
		{"hades_core:steel_ingot", "hades_core:steel_ingot"},
		{"hades_core:steel_ingot", "hades_core:steel_ingot"}
	}
})

-- colored Steeldoors

local colors = {
	{ "black", S("Black Steel Door"), "hades_dye:black" },
	{ "grey", S("Grey Steel Door"), "hades_dye:grey" },
	{ "darkgrey", S("Dark Grey Steel Door"), "hades_dye:dark_grey" },
	{ "white", S("White Steel Door"), "hades_dye:white" },
	{ "magenta", S("Magenta Steel Door"), "hades_dye:magenta" },
	{ "violet", S("Violet Steel Door"), "hades_dye:violet" },
	{ "blue", S("Blue Steel Door"), "hades_dye:blue" },
	{ "cyan", S("Cyan Steel Door"), "hades_dye:cyan" },
	{ "green", S("Green Steel Door"), "hades_dye:green" },
	{ "darkgreen", S("Dark Green Steel Door"), "hades_dye:dark_green" },
	{ "pink", S("Pink Steel Door"), "hades_dye:pink" },
	{ "red", S("Red Steel Door"), "hades_dye:red" },
	{ "orange", S("Orange Steel Door"), "hades_dye:orange" },
	{ "brown", S("Brown Steel Door"), "hades_dye:brown" },
	{ "yellow", S("Yellow Steel Door"), "hades_dye:yellow" },
}

for c=1, #colors do
	local id = colors[c][1]
	local desc = colors[c][2]
	hades_doors.register_door("hades_doors:door_steel_"..id, {
		description = desc,
		inventory_image = "hades_doors_steel_"..id..".png",
		groups = {cracky=2,door=1,steel_door=1},
		tiles = {{name="hades_doors_door_steel_"..id..".png", backface_culling=true}},
		use_texture_alpha = "clip",
		only_placer_can_open = true,
		sounds = hades_sounds.node_sound_metal_defaults(),
		sound_open = "doors_steel_door_open",
		sound_close = "doors_steel_door_close",
		sunlight_propagates = false,
	})

	minetest.register_craft({
		type = "shapeless",
		output = "hades_doors:door_steel_"..id,
		recipe = { "group:steel_door", colors[c][3] },
	})
end

hades_doors.register_door("hades_doors:door_dungeon1", {
	tiles = {{ name = "hades_doors_door_dungeon1.png", backface_culling = true}},
	description = S("Dungeon Interior Door"),
	inventory_image = "hades_doors_item_dungeon1.png",
	only_placer_can_open = true,
	groups = { cracky = 2, door = 1 },
	sounds = hades_sounds.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
})

minetest.register_craft({
	output = "hades_doors:door_dungeon1",
	recipe = {
		{ "hades_core:steel_ingot", "hades_core:steel_rod", "hades_core:steel_ingot" },
		{ "hades_core:steel_rod", "hades_core:steel_rod", "hades_core:steel_rod" },
		{ "hades_core:steel_ingot", "hades_core:steel_rod", "hades_core:steel_ingot" },
	},
})

hades_doors.register_door("hades_doors:door_dungeon2", {
	tiles = {{ name = "hades_doors_door_dungeon2.png", backface_culling = true}},
	use_texture_alpha = "clip",
	description = S("Dungeon Exterior Door"),
	inventory_image = "hades_doors_item_dungeon2.png",
	only_placer_can_open = true,
	groups = { cracky = 2, door = 1 },
	sounds = hades_sounds.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	sunlight = true,
})

minetest.register_craft({
	output = "hades_doors:door_dungeon2",
	recipe = {
		{ "hades_core:steel_rod", "hades_core:steel_rod", "hades_core:steel_rod" },
		{ "hades_core:steel_ingot", "hades_core:steel_ingot", "hades_core:steel_ingot" },
		{ "hades_core:steel_ingot", "hades_core:steel_ingot", "hades_core:steel_ingot" },
	},
})

hades_doors.register_door("hades_doors:door_rusty", {
	tiles = {{ name = "hades_doors_door_rusty.png", backface_culling = true}},
	description = S("Rusty Door"),
	inventory_image = "hades_doors_item_rusty.png",
	only_placer_can_open = true,
	groups = { cracky = 2, door = 1 },
	sounds = hades_sounds.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
})

minetest.register_craft({
	output = "hades_doors:door_rusty",
	recipe = {
		{ "hades_core:iron_lump", "hades_core:iron_lump" },
		{ "hades_core:iron_lump", "hades_core:iron_lump" },
		{ "hades_core:iron_lump", "hades_core:iron_lump" },
	},
})

hades_doors.register_door("hades_doors:door_steel_bar", {
	tiles = {{ name = "hades_doors_door_steel_bar.png", backface_culling = true}},
	use_texture_alpha = "clip",
	description = S("Steel Bar Door"),
	inventory_image = "hades_doors_item_steel_bar.png",
	groups = { cracky = 3, door = 1 },
	sounds = hades_sounds.node_sound_metal_defaults(),
	sound_open = "doors_door_steel_bar_open",
	sound_close = "doors_door_steel_bar_close",
})

minetest.register_craft({
	output = "hades_doors:door_steel_bar",
	recipe = {
		{ "hades_core:steel_rod", "hades_core:steel_rod" },
		{ "hades_core:steel_rod", "hades_core:steel_rod" },
		{ "hades_core:steel_rod", "hades_core:steel_rod" },
	},
})

hades_doors.register_door("hades_doors:door_rusty_bar", {
	tiles = {{ name = "hades_doors_door_rusty_bar.png", backface_culling = true}},
	use_texture_alpha = "clip",
	description = S("Rusty Bar Door"),
	inventory_image = "hades_doors_item_rusty_bar.png",
	groups = { cracky = 3, door = 1 },
	sounds = hades_sounds.node_sound_metal_defaults(),
	sound_open = "doors_door_steel_bar_open",
	sound_close = "doors_door_steel_bar_close",
})

minetest.register_craft({
	output = "hades_doors:door_rusty_bar",
	recipe = {
		{ "hades_core:steel_rod", "hades_core:steel_rod" },
		{ "hades_core:iron_lump", "hades_core:iron_lump" },
		{ "hades_core:steel_rod", "hades_core:steel_rod" },
	},
})


-- stone
hades_doors.register_door("hades_doors:door_stone", {
	description = S("Stone Door"),
	inventory_image = "hades_doors_stone.png",
	groups = {cracky=3,door=1},
	tiles = {{name="hades_doors_door_stone.png", backface_culling=true}},
	only_placer_can_open = true,
	sounds = hades_sounds.node_sound_stone_defaults(),
	sound_open = "mcl_fences_nether_brick_fence_gate_open",
	sound_close = "mcl_fences_nether_brick_fence_gate_close",
	sound_locked = "doors_door_locked_stone",
	sound_held_open = "doors_door_held_open_stone",
	sunlight_propagates = false,
})

minetest.register_craft({
	output = "hades_doors:door_stone",
	recipe = {
		{"hades_core:stone", "hades_core:stone"},
		{"hades_core:stone", "hades_core:stone"},
		{"hades_core:stone", "hades_core:stone"}
	}
})

-- chondrite
hades_doors.register_door("hades_doors:door_chondrite", {
	description = S("Chondrite Door"),
	inventory_image = "hades_doors_item_chondrite.png",
	groups = {cracky=3,door=1},
	tiles = {{name="hades_doors_door_chondrite.png", backface_culling=true}},
	only_placer_can_open = true,
	sounds = hades_sounds.node_sound_stone_defaults(),
	sound_open = "mcl_fences_nether_brick_fence_gate_open",
	sound_close = "mcl_fences_nether_brick_fence_gate_close",
	sound_locked = "doors_door_locked_stone",
	sound_held_open = "doors_door_held_open_stone",
	sunlight = false,
})

minetest.register_craft({
	output = "hades_doors:door_chondrite",
	recipe = {
		{"hades_core:chondrite", "hades_core:chondrite"},
		{"hades_core:chondrite", "hades_core:chondrite"},
		{"hades_core:chondrite", "hades_core:chondrite"},
	}
})

-- essexite
hades_doors.register_door("hades_doors:door_essexite", {
	description = S("Essexite Door"),
	inventory_image = "hades_doors_item_essexite.png",
	groups = {cracky=3,door=1},
	tiles = {{name="hades_doors_door_essexite.png", backface_culling=true}},
	only_placer_can_open = true,
	sounds = hades_sounds.node_sound_stone_defaults(),
	sound_open = "mcl_fences_nether_brick_fence_gate_open",
	sound_close = "mcl_fences_nether_brick_fence_gate_close",
	sound_locked = "doors_door_locked_stone",
	sound_held_open = "doors_door_held_open_stone",
	sunlight = false,
})

minetest.register_craft({
	output = "hades_doors:door_essexite",
	recipe = {
		{"hades_core:essexite", "hades_core:essexite"},
		{"hades_core:essexite", "hades_core:essexite"},
		{"hades_core:essexite", "hades_core:essexite"},
	}
})

-- marble
hades_doors.register_door("hades_doors:door_marble", {
	description = S("Marble Door"),
	inventory_image = "hades_doors_item_marble.png",
	groups = {cracky=3,door=1},
	tiles = {{name="hades_doors_door_marble.png", backface_culling=true}},
	only_placer_can_open = true,
	sounds = hades_sounds.node_sound_stone_defaults(),
	sound_open = "mcl_fences_nether_brick_fence_gate_open",
	sound_close = "mcl_fences_nether_brick_fence_gate_close",
	sound_locked = "doors_door_locked_stone",
	sound_held_open = "doors_door_held_open_stone",
	sunlight = false,
})

minetest.register_craft({
	output = "hades_doors:door_marble",
	recipe = {
		{"hades_core:marble", "hades_core:marble"},
		{"hades_core:marble", "hades_core:marble"},
		{"hades_core:marble", "hades_core:marble"},
	}
})

-- sandstone
hades_doors.register_door("hades_doors:door_sandstone", {
	description = S("Fine Sandstone Door"),
	inventory_image = "hades_doors_item_sandstone.png",
	groups = {cracky=3,door=1},
	tiles = {{name="hades_doors_door_sandstone.png", backface_culling=true}},
	only_placer_can_open = true,
	sounds = hades_sounds.node_sound_stone_defaults(),
	sound_open = "mcl_fences_nether_brick_fence_gate_open",
	sound_close = "mcl_fences_nether_brick_fence_gate_close",
	sound_locked = "doors_door_locked_stone",
	sound_held_open = "doors_door_held_open_stone",
	sunlight = false,
})

minetest.register_craft({
	output = "hades_doors:door_sandstone",
	recipe = {
		{"hades_core:sandstone", "hades_core:sandstone"},
		{"hades_core:sandstone", "hades_core:sandstone"},
		{"hades_core:sandstone", "hades_core:sandstone"}
	}
})

-- volcanic sandstone
hades_doors.register_door("hades_doors:door_sandstone_volcanic", {
	description = S("Volcanic Sandstone Door"),
	inventory_image = "hades_doors_item_sandstone_volcanic.png",
	groups = {cracky=3,door=1},
	tiles = {{name="hades_doors_door_sandstone_volcanic.png", backface_culling=true}},
	only_placer_can_open = true,
	sounds = hades_sounds.node_sound_stone_defaults(),
	sound_open = "mcl_fences_nether_brick_fence_gate_open",
	sound_close = "mcl_fences_nether_brick_fence_gate_close",
	sound_locked = "doors_door_locked_stone",
	sound_held_open = "doors_door_held_open_stone",
	sunlight = false,
})

minetest.register_craft({
	output = "hades_doors:door_sandstone_volcanic",
	recipe = {
		{"hades_core:sandstone_volcanic", "hades_core:sandstone_volcanic"},
		{"hades_core:sandstone_volcanic", "hades_core:sandstone_volcanic"},
		{"hades_core:sandstone_volcanic", "hades_core:sandstone_volcanic"},
	}
})



--glass
hades_doors.register_door("hades_doors:door_glass", {
	description = S("Glass Door"),
	inventory_image = "hades_doors_glass.png",
	groups = {cracky=3,oddly_breakable_by_hand=3,door=1},
	tiles = {"hades_doors_door_glass.png"},
	use_texture_alpha = "clip",
	sounds = hades_sounds.node_sound_glass_defaults(),
	sound_open = "doors_glass_door_open",
	sound_close = "doors_glass_door_close",
	sunlight_propagates = true,
})

minetest.register_craft({
	output = "hades_doors:door_glass",
	recipe = {
		{"hades_core:glass", "hades_core:glass"},
		{"hades_core:glass", "hades_core:glass"},
		{"hades_core:glass", "hades_core:glass"}
	}
})

hades_doors.register_door("hades_doors:door_obsidian_glass", {
	description = S("Obsidian Glass Door"),
	inventory_image = "hades_doors_obsidian_glass.png",
	groups = {cracky=3,door=1},
	tiles = {"hades_doors_door_obsidian_glass.png"},
	use_texture_alpha = "clip",
	sound_open = "doors_open_glass",
	sounds = hades_sounds.node_sound_glass_defaults(),
	sound_open = "doors_glass_door_open",
	sound_close = "doors_glass_door_close",
	sunlight_propagates = true,
})

minetest.register_craft({
	output = "hades_doors:door_obsidian_glass",
	recipe = {
		{"hades_core:obsidian_glass", "hades_core:obsidian_glass"},
		{"hades_core:obsidian_glass", "hades_core:obsidian_glass"},
		{"hades_core:obsidian_glass", "hades_core:obsidian_glass"}
	}
})


hades_doors.register_trapdoor("hades_doors:trapdoor", {
	description = S("Temperate Wood Trapdoor"),
	inventory_image = "hades_doors_trapdoor.png",
	wield_image = "hades_doors_trapdoor.png",
	tile_front = "hades_doors_trapdoor.png",
	tile_side = "hades_doors_trapdoor_side.png",
	use_texture_alpha = "clip",
	groups = {choppy=3, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'hades_doors:trapdoor 2',
	recipe = {
		{'hades_trees:wood', 'hades_trees:wood', 'hades_trees:wood'},
		{'hades_trees:wood', 'hades_trees:wood', 'hades_trees:wood'},
	}
})

hades_doors.register_trapdoor("hades_doors:trapdoor_jungle", {
	description = S("Tropical Wood Trapdoor"),
	inventory_image = "hades_doors_trapdoor_jungle.png",
	wield_image = "hades_doors_trapdoor_jungle.png",
	tile_front = "hades_doors_trapdoor_jungle.png",
	tile_side = "hades_doors_trapdoor_jungle_side.png",
	use_texture_alpha = "clip",
	groups = {choppy=3, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'hades_doors:trapdoor_jungle 2',
	recipe = {
		{'hades_trees:jungle_wood', 'hades_trees:jungle_wood', 'hades_trees:jungle_wood'},
		{'hades_trees:jungle_wood', 'hades_trees:jungle_wood', 'hades_trees:jungle_wood'},
	}
})

hades_doors.register_trapdoor("hades_doors:trapdoor_pale", {
	description = S("Pale Wood Trapdoor"),
	inventory_image = "hades_doors_trapdoor_pale.png",
	wield_image = "hades_doors_trapdoor_pale.png",
	tile_front = "hades_doors_trapdoor_pale.png",
	tile_side = "hades_doors_trapdoor_pale_side.png",
	use_texture_alpha = "clip",
	groups = {choppy=3, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'hades_doors:trapdoor_pale 2',
	recipe = {
		{'hades_trees:pale_wood', 'hades_trees:pale_wood', 'hades_trees:pale_wood'},
		{'hades_trees:pale_wood', 'hades_trees:pale_wood', 'hades_trees:pale_wood'},
	}
})

hades_doors.register_trapdoor("hades_doors:trapdoor_cream", {
	description = S("Cream Wood Trapdoor"),
	inventory_image = "hades_doors_trapdoor_cream.png",
	wield_image = "hades_doors_trapdoor_cream.png",
	tile_front = "hades_doors_trapdoor_cream.png",
	tile_side = "hades_doors_trapdoor_cream_side.png",
	use_texture_alpha = "clip",
	groups = {choppy=3, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'hades_doors:trapdoor_cream 2',
	recipe = {
		{'hades_trees:cream_wood', 'hades_trees:cream_wood', 'hades_trees:cream_wood'},
		{'hades_trees:cream_wood', 'hades_trees:cream_wood', 'hades_trees:cream_wood'},
	}
})

hades_doors.register_trapdoor("hades_doors:trapdoor_lush", {
	description = S("Lush Wood Trapdoor"),
	inventory_image = "hades_doors_trapdoor_lush.png",
	wield_image = "hades_doors_trapdoor_lush.png",
	tile_front = "hades_doors_trapdoor_lush.png",
	tile_side = "hades_doors_trapdoor_lush_side.png",
	use_texture_alpha = "clip",
	groups = {choppy=3, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'hades_doors:trapdoor_lush 2',
	recipe = {
		{'hades_trees:lush_wood', 'hades_trees:lush_wood', 'hades_trees:lush_wood'},
		{'hades_trees:lush_wood', 'hades_trees:lush_wood', 'hades_trees:lush_wood'},
	}
})


hades_doors.register_trapdoor("hades_doors:trapdoor_steel", {
	description = S("Steel Trapdoor"),
	inventory_image = "hades_doors_trapdoor_steel.png",
	wield_image = "hades_doors_trapdoor_steel.png",
	tile_front = "hades_doors_trapdoor_steel.png",
	tile_side = "hades_doors_trapdoor_steel_side.png",
	use_texture_alpha = "clip",
	sounds = hades_sounds.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	groups = {cracky = 2, door = 1},
})

minetest.register_craft({
	output = 'hades_doors:trapdoor_steel',
	recipe = {
		{'hades_core:steel_ingot', 'hades_core:steel_ingot'},
		{'hades_core:steel_ingot', 'hades_core:steel_ingot'},
	}
})

hades_doors.register_trapdoor("hades_doors:trapdoor_steel_bar", {
	description = S("Steel Bar Trapdoor"),
	inventory_image = "hades_doors_trapdoor_steel_bar.png",
	wield_image = "hades_doors_trapdoor_steel_bar.png",
	tile_front = "hades_doors_trapdoor_steel_bar.png",
	tile_side = "hades_doors_trapdoor_steel_bar_side.png",
	use_texture_alpha = "clip",
	sounds = hades_sounds.node_sound_metal_defaults(),
	sound_open = "doors_door_steel_bar_open",
	sound_close = "doors_door_steel_bar_close",
	groups = {cracky = 3, door = 1},
})

minetest.register_craft({
	output = 'hades_doors:trapdoor_steel_bar',
	recipe = {
		{'hades_core:steel_rod', 'hades_core:steel_rod', 'hades_core:steel_rod'},
		{'hades_core:steel_rod', 'hades_core:steel_rod', 'hades_core:steel_rod'},
	}
})

hades_doors.register_trapdoor("hades_doors:trapdoor_rusty_bar", {
	description = S("Rusty Bar Trapdoor"),
	inventory_image = "hades_doors_trapdoor_rusty_bar.png",
	wield_image = "hades_doors_trapdoor_rusty_bar.png",
	tile_front = "hades_doors_trapdoor_rusty_bar.png",
	tile_side = "hades_doors_trapdoor_rusty_bar_side.png",
	use_texture_alpha = "clip",
	sounds = hades_sounds.node_sound_metal_defaults(),
	sound_open = "doors_door_steel_bar_open",
	sound_close = "doors_door_steel_bar_close",
	groups = {cracky = 3, door = 1},
})

minetest.register_craft({
	output = 'hades_doors:trapdoor_rusty_bar',
	recipe = {
		{'hades_core:steel_rod', 'hades_core:iron_lump', 'hades_core:steel_rod'},
		{'hades_core:steel_rod', 'hades_core:iron_lump', 'hades_core:steel_rod'},
	}
})


hades_doors.register_fencegate("hades_doors:gate_wood", {
	description = S("Temperate Wood Fence Gate"),
	texture = "default_wood.png",
	material = "hades_trees:wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 2}
})

hades_doors.register_fencegate("hades_doors:gate_jungle_wood", {
	description = S("Tropical Wood Fence Gate"),
	texture = "default_junglewood.png",
	material = "hades_trees:jungle_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 2}
})

hades_doors.register_fencegate("hades_doors:gate_pale_wood", {
	description = S("Pale Wood Fence Gate"),
	texture = "hades_trees_pale_wood.png",
	material = "hades_trees:pale_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
})

hades_doors.register_fencegate("hades_doors:gate_cream_wood", {
	description = S("Cream Wood Fence Gate"),
	texture = "hades_trees_cream_wood.png",
	material = "hades_trees:cream_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
})

hades_doors.register_fencegate("hades_doors:gate_lush_wood", {
	description = S("Lush Wood Fence Gate"),
	texture = "hades_trees_lush_wood.png",
	material = "hades_trees:lush_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
})

minetest.register_craft({
	type = "cooking",
	output = "hades_core:steel_ingot 6",
	recipe = "group:steel_door",
	cooktime = 18,
})
minetest.register_craft({
	type = "cooking",
	output = "hades_core:steel_ingot",
	recipe = "hades_doors:door_steel_bar",
	cooktime = 9,
})

minetest.register_craft({
	type = "cooking",
	output = "hades_core:steel_ingot 4",
	recipe = "hades_doors:trapdoor_steel",
	cooktime = 12,
})
minetest.register_craft({
	type = "cooking",
	output = "hades_core:steel_ingot",
	recipe = "hades_doors:trapdoor_steel_bar",
	cooktime = 6,
})


minetest.register_craft({
	type = "fuel",
	recipe = "hades_doors:trapdoor",
	burntime = 7,
})
minetest.register_craft({
	type = "fuel",
	recipe = "hades_doors:trapdoor_jungle",
	burntime = 7,
})
minetest.register_craft({
	type = "fuel",
	recipe = "hades_doors:trapdoor_pale",
	burntime = 7,
})
minetest.register_craft({
	type = "fuel",
	recipe = "hades_doors:trapdoor_cream",
	burntime = 7,
})
minetest.register_craft({
	type = "fuel",
	recipe = "hades_doors:trapdoor_lush",
	burntime = 7,
})
minetest.register_craft({
	type = "fuel",
	recipe = "hades_doors:door_wood",
	burntime = 14,
})
minetest.register_craft({
	type = "fuel",
	recipe = "hades_doors:door_wood_jungle",
	burntime = 14,
})
minetest.register_craft({
	type = "fuel",
	recipe = "hades_doors:door_wood_pale",
	burntime = 14,
})
minetest.register_craft({
	type = "fuel",
	recipe = "hades_doors:door_wood_cream",
	burntime = 14,
})
minetest.register_craft({
	type = "fuel",
	recipe = "hades_doors:door_wood_lush",
	burntime = 14,
})

minetest.register_craft({
	type = "fuel",
	recipe = "hades_doors:gate_wood_closed",
	burntime = 7,
})
minetest.register_craft({
	type = "fuel",
	recipe = "hades_doors:gate_jungle_wood_closed",
	burntime = 7,
})
minetest.register_craft({
	type = "fuel",
	recipe = "hades_doors:gate_pale_wood_closed",
	burntime = 7,
})
minetest.register_craft({
	type = "fuel",
	recipe = "hades_doors:gate_cream_wood_closed",
	burntime = 7,
})
minetest.register_craft({
	type = "fuel",
	recipe = "hades_doors:gate_lush_wood_closed",
	burntime = 7,
})

