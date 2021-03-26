local S = minetest.get_translator("doors")

doors.register_door("doors:door_wood", {
	description = S("Common Wood Door"),
	inventory_image = "doors_wood.png",
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=2,door=1},
	tiles = {{name="doors_door_wood.png", backface_culling=true}},
	sounds = hades_sounds.node_sound_wood_defaults(),
	sunlight = false,
	backface_culling = true,
})

minetest.register_craft({
	output = "doors:door_wood",
	recipe = {
		{"hades_trees:wood", "hades_trees:wood"},
		{"hades_trees:wood", "hades_trees:wood"},
		{"hades_trees:wood", "hades_trees:wood"}
	}
})

doors.register_door("doors:door_wood_pale", {
	description = S("Pale Wood Door"),
	inventory_image = "doors_wood_pale.png",
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=2,door=1},
	tiles = {{name="doors_door_wood_pale.png", backface_culling=true}},
	sounds = hades_sounds.node_sound_wood_defaults(),
	sunlight = false,
})

minetest.register_craft({
	output = "doors:door_wood_pale",
	recipe = {
		{"hades_trees:pale_wood", "hades_trees:pale_wood"},
		{"hades_trees:pale_wood", "hades_trees:pale_wood"},
		{"hades_trees:pale_wood", "hades_trees:pale_wood"}
	}
})

doors.register_door("doors:door_wood_birch", {
	description = S("Birch Wood Door"),
	inventory_image = "doors_wood_birch.png",
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=2,door=1},
	tiles = {{name="doors_door_wood_birch.png", backface_culling=true}},
	sounds = hades_sounds.node_sound_wood_defaults(),
	sunlight = false,
})

minetest.register_craft({
	output = "doors:door_wood_birch",
	recipe = {
		{"hades_trees:birch_wood", "hades_trees:birch_wood"},
		{"hades_trees:birch_wood", "hades_trees:birch_wood"},
		{"hades_trees:birch_wood", "hades_trees:birch_wood"},
	}
})



doors.register_door("doors:door_wood_jungle", {
	description = S("Jungle Wood Door"),
	inventory_image = "doors_wood_jungle.png",
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=2,door=1},
	tiles = {{name="doors_door_wood_jungle.png", backface_culling=true}},
	sounds = hades_sounds.node_sound_wood_defaults(),
	sunlight = false,
})

minetest.register_craft({
	output = "doors:door_wood_jungle",
	recipe = {
		{"hades_trees:jungle_wood", "hades_trees:jungle_wood"},
		{"hades_trees:jungle_wood", "hades_trees:jungle_wood"},
		{"hades_trees:jungle_wood", "hades_trees:jungle_wood"}
	}
})



doors.register_door("doors:door_steel", {
	description = S("Plain Steel Door"),
	inventory_image = "doors_steel.png",
	groups = {snappy=1,cracky=1,level=2,door=1,steel_door=1},
	tiles = {{name="doors_door_steel.png", backface_culling=true}},
	only_placer_can_open = true,
	sounds = hades_sounds.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	sunlight = false,
})

minetest.register_craft({
	output = "doors:door_steel",
	recipe = {
		{"hades_core:steel_ingot", "hades_core:steel_ingot"},
		{"hades_core:steel_ingot", "hades_core:steel_ingot"},
		{"hades_core:steel_ingot", "hades_core:steel_ingot"}
	}
})

-- colored Steeldoors

local colors = {
	{ "black", S("Black Steel Door"), "dye:black" },
	-- TODO: { "grey", S("Grey Steel Door") },
	{ "darkgrey", S("Dark Grey Steel Door"), "dye:dark_grey" },
	{ "white", S("White Steel Door"), "dye:white" },
	{ "magenta", S("Magenta Steel Door"), "dye:magenta" },
	{ "violet", S("Violet Steel Door"), "dye:violet" },
	{ "blue", S("Blue Steel Door"), "dye:blue" },
	{ "cyan", S("Cyan Steel Door"), "dye:cyan" },
	{ "green", S("Green Steel Door"), "dye:green" },
	{ "darkgreen", S("Dark Green Steel Door"), "dye:dark_green" },
	{ "pink", S("Pink Steel Door"), "dye:pink" },
	{ "red", S("Red Steel Door"), "dye:red" },
	{ "orange", S("Orange Steel Door"), "dye:orange" },
	{ "brown", S("Brown Steel Door"), "dye:brown" },
	{ "yellow", S("Yellow Steel Door"), "dye:yellow" },
}

for c=1, #colors do
	local id = colors[c][1]
	local desc = colors[c][2]
	doors.register_door("doors:door_steel_"..id, {
		description = desc,
		inventory_image = "doors_steel_"..id..".png",
		groups = {snappy=1,cracky=1,level=2,door=1,steel_door=1},
		tiles = {{name="doors_door_steel_"..id..".png", backface_culling=true}},
		only_placer_can_open = true,
		sounds = hades_sounds.node_sound_metal_defaults(),
		sound_open = "doors_steel_door_open",
		sound_close = "doors_steel_door_close",
		sunlight = false,
	})

	minetest.register_craft({
		type = "shapeless",
		output = "doors:door_steel_"..id,
		recipe = { "group:steel_door", colors[c][3] },
	})
end

-- stone
doors.register_door("doors:door_stone", {
	-- TODO: Make this door more hidden
	description = S("Stone Door"),
	inventory_image = "doors_stone.png",
	groups = {snappy=1,cracky=1,level=2,door=1},
	tiles = {{name="doors_door_stone.png", backface_culling=true}},
	only_placer_can_open = true,
	sounds = hades_sounds.node_sound_stone_defaults(),
	sound_open = "mcl_fences_nether_brick_fence_gate_open",
	sound_close = "mcl_fences_nether_brick_fence_gate_close",
	sunlight = false,
})

minetest.register_craft({
	output = "doors:door_stone",
	recipe = {
		{"hades_core:stone", "hades_core:stone"},
		{"hades_core:stone", "hades_core:stone"},
		{"hades_core:stone", "hades_core:stone"}
	}
})
--glass
doors.register_door("doors:door_glass", {
	description = S("Glass Door"),
	inventory_image = "doors_glass.png",
	groups = {snappy=1,cracky=1,oddly_breakable_by_hand=3,door=1},
	tiles = {"doors_door_glass.png"},
	sounds = hades_sounds.node_sound_glass_defaults(),
	sound_open = "doors_glass_door_open",
	sound_close = "doors_glass_door_close",
	sunlight = true,
})

minetest.register_craft({
	output = "doors:door_glass",
	recipe = {
		{"hades_core:glass", "hades_core:glass"},
		{"hades_core:glass", "hades_core:glass"},
		{"hades_core:glass", "hades_core:glass"}
	}
})

doors.register_door("doors:door_obsidian_glass", {
	description = S("Obsidian Glass Door"),
	inventory_image = "doors_obsidian_glass.png",
	groups = {snappy=1,cracky=1,oddly_breakable_by_hand=3,door=1},
	tiles = {"doors_door_obsidian_glass.png"},
	sound_open = "doors_open_glass",
	sounds = hades_sounds.node_sound_glass_defaults(),
	sound_open = "doors_glass_door_open",
	sound_close = "doors_glass_door_close",
	sunlight = true,
})

minetest.register_craft({
	output = "doors:door_obsidian_glass",
	recipe = {
		{"hades_core:obsidian_glass", "hades_core:obsidian_glass"},
		{"hades_core:obsidian_glass", "hades_core:obsidian_glass"},
		{"hades_core:obsidian_glass", "hades_core:obsidian_glass"}
	}
})


doors.register_trapdoor("doors:trapdoor", {
	description = S("Common Wood Trapdoor"),
	inventory_image = "doors_trapdoor.png",
	wield_image = "doors_trapdoor.png",
	tile_front = "doors_trapdoor.png",
	tile_side = "doors_trapdoor_side.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'doors:trapdoor 2',
	recipe = {
		{'hades_trees:wood', 'hades_trees:wood', 'hades_trees:wood'},
		{'hades_trees:wood', 'hades_trees:wood', 'hades_trees:wood'},
	}
})

doors.register_trapdoor("doors:trapdoor_jungle", {
	description = S("Jungle Wood Trapdoor"),
	inventory_image = "doors_trapdoor_jungle.png",
	wield_image = "doors_trapdoor_jungle.png",
	tile_front = "doors_trapdoor_jungle.png",
	tile_side = "doors_trapdoor_jungle_side.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'doors:trapdoor_jungle 2',
	recipe = {
		{'hades_trees:jungle_wood', 'hades_trees:jungle_wood', 'hades_trees:jungle_wood'},
		{'hades_trees:jungle_wood', 'hades_trees:jungle_wood', 'hades_trees:jungle_wood'},
	}
})

doors.register_trapdoor("doors:trapdoor_pale", {
	description = S("Pale Wood Trapdoor"),
	inventory_image = "doors_trapdoor_pale.png",
	wield_image = "doors_trapdoor_pale.png",
	tile_front = "doors_trapdoor_pale.png",
	tile_side = "doors_trapdoor_pale_side.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'doors:trapdoor_pale 2',
	recipe = {
		{'hades_trees:pale_wood', 'hades_trees:pale_wood', 'hades_trees:pale_wood'},
		{'hades_trees:pale_wood', 'hades_trees:pale_wood', 'hades_trees:pale_wood'},
	}
})

doors.register_trapdoor("doors:trapdoor_birch", {
	description = S("Birch Wood Trapdoor"),
	inventory_image = "doors_trapdoor_birch.png",
	wield_image = "doors_trapdoor_birch.png",
	tile_front = "doors_trapdoor_birch.png",
	tile_side = "doors_trapdoor_birch_side.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = hades_sounds.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'doors:trapdoor_birch 2',
	recipe = {
		{'hades_trees:birch_wood', 'hades_trees:birch_wood', 'hades_trees:birch_wood'},
		{'hades_trees:birch_wood', 'hades_trees:birch_wood', 'hades_trees:birch_wood'},
	}
})

doors.register_trapdoor("doors:trapdoor_steel", {
	description = S("Steel Trapdoor"),
	inventory_image = "doors_trapdoor_steel.png",
	wield_image = "doors_trapdoor_steel.png",
	tile_front = "doors_trapdoor_steel.png",
	tile_side = "doors_trapdoor_steel_side.png",
	protected = true,
	sounds = hades_sounds.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	groups = {cracky = 1, level = 2, door = 1},
})

minetest.register_craft({
	output = 'doors:trapdoor_steel',
	recipe = {
		{'hades_core:steel_ingot', 'hades_core:steel_ingot'},
		{'hades_core:steel_ingot', 'hades_core:steel_ingot'},
	}
})

doors.register_fencegate("doors:gate_wood", {
	description = S("Common Wood Fence Gate"),
	texture = "default_wood.png",
	material = "hades_trees:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})

doors.register_fencegate("doors:gate_jungle_wood", {
	description = S("Jungle Wood Fence Gate"),
	texture = "default_junglewood.png",
	material = "hades_trees:jungle_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})

doors.register_fencegate("doors:gate_pale_wood", {
	description = S("Pale Wood Fence Gate"),
	texture = "hades_trees_pale_wood.png",
	material = "hades_trees:pale_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
})

doors.register_fencegate("doors:gate_birch_wood", {
	description = S("Birch Wood Fence Gate"),
	texture = "default_birchwood.png",
	material = "hades_trees:birch_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:trapdoor",
	burntime = 7,
})
minetest.register_craft({
	type = "fuel",
	recipe = "doors:trapdoor_jungle",
	burntime = 7,
})
minetest.register_craft({
	type = "fuel",
	recipe = "doors:trapdoor_pale",
	burntime = 7,
})
minetest.register_craft({
	type = "fuel",
	recipe = "doors:trapdoor_birch",
	burntime = 7,
})
minetest.register_craft({
	type = "fuel",
	recipe = "doors:door_wood",
	burntime = 14,
})
minetest.register_craft({
	type = "fuel",
	recipe = "doors:door_wood_jungle",
	burntime = 14,
})
minetest.register_craft({
	type = "fuel",
	recipe = "doors:door_wood_pale",
	burntime = 14,
})
minetest.register_craft({
	type = "fuel",
	recipe = "doors:door_wood_birch",
	burntime = 14,
})
minetest.register_craft({
	type = "fuel",
	recipe = "doors:gate_wood_closed",
	burntime = 7,
})
minetest.register_craft({
	type = "fuel",
	recipe = "doors:gate_jungle_wood_closed",
	burntime = 7,
})
minetest.register_craft({
	type = "fuel",
	recipe = "doors:gate_pale_wood_closed",
	burntime = 7,
})
minetest.register_craft({
	type = "fuel",
	recipe = "doors:gate_birch_wood_closed",
	burntime = 7,
})

