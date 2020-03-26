doors.register_door("doors:door_wood", {
	description = "Common Wood Door",
	inventory_image = "doors_wood.png",
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=2,door=1},
	tiles = {{name="doors_door_wood.png", backface_culling=true}},
	sounds = default.node_sound_wood_defaults(),
	sunlight = false,
	backface_culling = true,
})

minetest.register_craft({
	output = "doors:door_wood",
	recipe = {
		{"default:wood", "default:wood"},
		{"default:wood", "default:wood"},
		{"default:wood", "default:wood"}
	}
})

doors.register_door("doors:door_wood_pale", {
	description = "Pale Wood Door",
	inventory_image = "doors_wood_pale.png",
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=2,door=1},
	tiles = {{name="doors_door_wood_pale.png", backface_culling=true}},
	sounds = default.node_sound_wood_defaults(),
	sunlight = false,
})

minetest.register_craft({
	output = "doors:door_wood_pale",
	recipe = {
		{"default:palewood", "default:palewood"},
		{"default:palewood", "default:palewood"},
		{"default:palewood", "default:palewood"}
	}
})

doors.register_door("doors:door_wood_birch", {
	description = "Birch Wood Door",
	inventory_image = "doors_wood_birch.png",
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=2,door=1},
	tiles = {{name="doors_door_wood_birch.png", backface_culling=true}},
	sounds = default.node_sound_wood_defaults(),
	sunlight = false,
})

minetest.register_craft({
	output = "doors:door_wood_birch",
	recipe = {
		{"default:birchwood", "default:birchwood"},
		{"default:birchwood", "default:birchwood"},
		{"default:birchwood", "default:birchwood"},
	}
})



doors.register_door("doors:door_wood_jungle", {
	description = "Jungle Wood Door",
	inventory_image = "doors_wood_jungle.png",
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=2,door=1},
	tiles = {{name="doors_door_wood_jungle.png", backface_culling=true}},
	sounds = default.node_sound_wood_defaults(),
	sunlight = false,
})

minetest.register_craft({
	output = "doors:door_wood_jungle",
	recipe = {
		{"default:junglewood", "default:junglewood"},
		{"default:junglewood", "default:junglewood"},
		{"default:junglewood", "default:junglewood"}
	}
})



doors.register_door("doors:door_steel", {
	description = "Plain Steel Door",
	inventory_image = "doors_steel.png",
	groups = {snappy=1,cracky=1,level=2,door=1},
	tiles = {{name="doors_door_steel.png", backface_culling=true}},
	only_placer_can_open = true,
	sounds = default.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	sunlight = false,
})

minetest.register_craft({
	output = "doors:door_steel",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot"}
	}
})

-- colored Steeldoors

local colors = {
	{ "black", "Black Steel Door" },
	-- TODO: { "grey", "Grey Steel Door" },
	{ "darkgrey", "Dark Grey Steel Door", "dye:dark_grey" },
	{ "white", "White Steel Door", "dye:white" },
	{ "magenta", "Magenta Steel Door", "dye:magenta" },
	{ "violet", "Violet Steel Door", "dye:violet" },
	{ "blue", "Blue Steel Door", "dye:blue" },
	{ "cyan", "Cyan Steel Door", "dye:cyan" },
	{ "green", "Green Steel Door", "dye:green" },
	{ "darkgreen", "Dark Green Steel Door", "dye:dark_green" },
	{ "pink", "Pink Steel Door", "dye:pink" },
	{ "red", "Red Steel Door", "dye:red" },
	{ "orange", "Orange Steel Door", "dye:orange" },
	{ "brown", "Brown Steel Door", "dye:brown" },
	{ "yellow", "Yellow Steel Door", "dye:yellow" },
}

for c=1, #colors do
	local id = colors[c][1]
	local desc = colors[c][2]
	doors.register_door("doors:door_steel_"..id, {
		description = desc,
		inventory_image = "doors_steel_"..id..".png",
		groups = {snappy=1,cracky=1,level=2,door=1,sdoor=1},
		tiles = {{name="doors_door_steel_"..id..".png", backface_culling=true}},
		only_placer_can_open = true,
		sounds = default.node_sound_metal_defaults(),
		sound_open = "doors_steel_door_open",
		sound_close = "doors_steel_door_close",
		sunlight = false,
	})

	minetest.register_craft({
		output = "doors:door_steel_"..id,
		recipe = {
			{"doors:door_steel", colors[c][3]},
		}
	})
end

-- stone
doors.register_door("doors:door_stone", {
	-- TODO: Make this door more hidden
	description = "Stone Door",
	inventory_image = "doors_stone.png",
	groups = {snappy=1,cracky=1,level=2,door=1},
	tiles = {{name="doors_door_stone.png", backface_culling=true}},
	only_placer_can_open = true,
	sounds = default.node_sound_stone_defaults(),
	sound_open = "mcl_fences_nether_brick_fence_gate_open",
	sound_close = "mcl_fences_nether_brick_fence_gate_close",
	sunlight = false,
})

minetest.register_craft({
	output = "doors:door_stone",
	recipe = {
		{"default:stone", "default:stone"},
		{"default:stone", "default:stone"},
		{"default:stone", "default:stone"}
	}
})
--glass
doors.register_door("doors:door_glass", {
	description = "Glass Door",
	inventory_image = "doors_glass.png",
	groups = {snappy=1,cracky=1,oddly_breakable_by_hand=3,door=1},
	tiles = {"doors_door_glass.png"},
	sounds = default.node_sound_glass_defaults(),
	sound_open = "doors_glass_door_open",
	sound_close = "doors_glass_door_close",
	sunlight = true,
})

minetest.register_craft({
	output = "doors:door_glass",
	recipe = {
		{"default:glass", "default:glass"},
		{"default:glass", "default:glass"},
		{"default:glass", "default:glass"}
	}
})

doors.register_door("doors:door_obsidian_glass", {
	description = "Obsidian Glass Door",
	inventory_image = "doors_obsidian_glass.png",
	groups = {snappy=1,cracky=1,oddly_breakable_by_hand=3,door=1},
	tiles = {"doors_door_obsidian_glass.png"},
	sound_open = "doors_open_glass",
	sounds = default.node_sound_glass_defaults(),
	sound_open = "doors_glass_door_open",
	sound_close = "doors_glass_door_close",
	sunlight = true,
})

minetest.register_craft({
	output = "doors:door_obsidian_glass",
	recipe = {
		{"default:obsidian_glass", "default:obsidian_glass"},
		{"default:obsidian_glass", "default:obsidian_glass"},
		{"default:obsidian_glass", "default:obsidian_glass"}
	}
})


doors.register_trapdoor("doors:trapdoor", {
	description = "Common Wood Trapdoor",
	inventory_image = "doors_trapdoor.png",
	wield_image = "doors_trapdoor.png",
	tile_front = "doors_trapdoor.png",
	tile_side = "doors_trapdoor_side.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'doors:trapdoor 2',
	recipe = {
		{'default:wood', 'default:wood', 'default:wood'},
		{'default:wood', 'default:wood', 'default:wood'},
	}
})

doors.register_trapdoor("doors:trapdoor_jungle", {
	description = "Jungle Wood Trapdoor",
	inventory_image = "doors_trapdoor_jungle.png",
	wield_image = "doors_trapdoor_jungle.png",
	tile_front = "doors_trapdoor_jungle.png",
	tile_side = "doors_trapdoor_jungle_side.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'doors:trapdoor_jungle 2',
	recipe = {
		{'default:junglewood', 'default:junglewood', 'default:junglewood'},
		{'default:junglewood', 'default:junglewood', 'default:junglewood'},
	}
})

doors.register_trapdoor("doors:trapdoor_pale", {
	description = "Pale Wood Trapdoor",
	inventory_image = "doors_trapdoor_pale.png",
	wield_image = "doors_trapdoor_pale.png",
	tile_front = "doors_trapdoor_pale.png",
	tile_side = "doors_trapdoor_pale_side.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'doors:trapdoor_pale 2',
	recipe = {
		{'default:palewood', 'default:palewood', 'default:palewood'},
		{'default:palewood', 'default:palewood', 'default:palewood'},
	}
})

doors.register_trapdoor("doors:trapdoor_birch", {
	description = "Birch Wood Trapdoor",
	inventory_image = "doors_trapdoor_birch.png",
	wield_image = "doors_trapdoor_birch.png",
	tile_front = "doors_trapdoor_birch.png",
	tile_side = "doors_trapdoor_birch_side.png",
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2, door=1},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "doors_door_open",
	sound_close = "doors_door_close"
})

minetest.register_craft({
	output = 'doors:trapdoor_birch 2',
	recipe = {
		{'default:birchwood', 'default:birchwood', 'default:birchwood'},
		{'default:birchwood', 'default:birchwood', 'default:birchwood'},
	}
})

doors.register_trapdoor("doors:trapdoor_steel", {
	description = "Steel Trapdoor",
	inventory_image = "doors_trapdoor_steel.png",
	wield_image = "doors_trapdoor_steel.png",
	tile_front = "doors_trapdoor_steel.png",
	tile_side = "doors_trapdoor_steel_side.png",
	protected = true,
	sounds = default.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	groups = {cracky = 1, level = 2, door = 1},
})

minetest.register_craft({
	output = 'doors:trapdoor_steel',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot'},
		{'default:steel_ingot', 'default:steel_ingot'},
	}
})

doors.register_fencegate("doors:gate_wood", {
	description = "Common Wood Fence Gate",
	texture = "default_wood.png",
	material = "default:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})

doors.register_fencegate("doors:gate_junglewood", {
	description = "Jungle Wood Fence Gate",
	texture = "default_junglewood.png",
	material = "default:junglewood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})

doors.register_fencegate("doors:gate_palewood", {
	description = "Pale Wood Fence Gate",
	texture = "default_palewood.png",
	material = "default:palewood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3}
})

doors.register_fencegate("doors:gate_birchwood", {
	description = "Birch Wood Fence Gate",
	texture = "default_birchwood.png",
	material = "default:birchwood",
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
	recipe = "doors:gate_junglewood_closed",
	burntime = 7,
})
minetest.register_craft({
	type = "fuel",
	recipe = "doors:gate_palewood_closed",
	burntime = 7,
})
minetest.register_craft({
	type = "fuel",
	recipe = "doors:gate_birchwood_closed",
	burntime = 7,
})

