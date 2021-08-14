local S = minetest.get_translator("hades_flowerpots")

local flowers = {
	{"red", "hades_flowers:red", S("Flower Pot with Red Flower")},
	{"orange", "hades_flowers:orange", S("Flower Pot with Orange Flower")},
	{"blue", "hades_flowers:blue", S("Flower Pot with Blue Flower")},
	{"violet", "hades_flowers:violet", S("Flower Pot with Violet Flower")},
	{"yellow", "hades_flowers:yellow", S("Flower Pot with Yellow Flower")},
	{"white", "hades_flowers:white", S("Flower Pot with White Flower")},

	-- TODO: Maybe add grass
	{"branch_bush", "hades_bushes:branch_bush", S("Flower Pot with Branch Bush")},

	{"sapling", "hades_trees:sapling", S("Flower Pot with Temperate Tree Sapling")},
	{"jungle_sapling", "hades_trees:jungle_sapling", S("Flower Pot with Common Tropical Tree Sapling")},
	{"cultivated_jungle_sapling", "hades_trees:cultivated_jungle_sapling", S("Flower Pot with Cultivated Tropical Tree Sapling")},
	{"olive_sapling", "hades_trees:olive_sapling", S("Flower Pot with Olive Tree Sapling")},
	{"pale_sapling", "hades_trees:pale_sapling", S("Flower Pot with Pale Tree Sapling")},
	{"birch_sapling", "hades_trees:birch_sapling", S("Flower Pot with Birch Tree Sapling")},
	{"orange_sapling", "hades_trees:orange_sapling", S("Flower Pot with Orange Tree Sapling")},
	{"banana_sapling", "hades_trees:banana_sapling", S("Flower Pot with Banana Tree Sapling")},
	{"cocoa_sapling", "hades_trees:cocoa_sapling", S("Flower Pot with Cocoa Tree Sapling")},
	{"coconut_sapling", "hades_trees:coconut_sapling", S("Flower Pot with Coconut Tree Sapling")},
	{"canvas_sapling", "hades_trees:canvas_sapling", S("Flower Pot with Canvas Tree Sapling")},
}

local cuboids = {
	{"cactus", "hades_core:cactus", S("Flower Pot with Cactus")},

	{"leaves", "hades_trees:leaves", S("Flower Pot with Temperate Leaves")},
	{"jungle_leaves", "hades_trees:jungle_leaves", S("Flower Pot with Common Tropical Leaves")},
	{"cultivated_jungle_leaves", "hades_trees:cultivated_jungle_leaves", S("Flower Pot with Cultivated Tropical Leaves")},
	{"olive_leaves", "hades_trees:olive_leaves", S("Flower Pot with Olive Leaves")},
	{"birch_leaves", "hades_trees:birch_leaves", S("Flower Pot with Birch Leaves")},
	{"pale_leaves", "hades_trees:pale_leaves", S("Flower Pot with Pale Leaves")},
	{"orange_leaves", "hades_trees:orange_leaves", S("Flower Pot with Orange Leaves")},
	{"banana_leaves", "hades_trees:banana_leaves", S("Flower Pot with Banana Leaves")},
	{"canvas_leaves", "hades_trees:canvas_leaves", S("Flower Pot with Canvas Leaves")},
	{"burned_branches", "hades_trees:burned_branches", S("Flower Pot with Burned Branches")},
}

minetest.register_node("hades_flowerpots:flower_pot", {
	description = S("Flower Pot"),
	_tt_help = S("Can hold a flower or other small plant"),
	drawtype = "mesh",
	mesh = "hades_flowerpots_flowerpot.obj",
	tiles = {
		"hades_flowerpots_flowerpot.png",
	},
	use_texture_alpha = "clip",
	visual_scale = 0.5,
	wield_scale = {x=1.0, y=1.0, z=1.0},
	paramtype = "light",
	is_ground_content = false,
	floodable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, -0.1, 0.2}
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, -0.1, 0.2}
	},
	groups = {cracky = 3, oddly_breakable_by_hand = 1, attached_node=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
	on_rightclick = function(pos, node, clicker, itemstack)
		local item = clicker:get_wielded_item():get_name()
		local name = clicker:get_player_name()
		if minetest.is_protected(pos, name) then
			minetest.record_protection_violation(pos, name)
			return
		end
		for _, row in ipairs(flowers) do
			local flower = row[1]
			local flower_node = row[2]
			if item == flower_node then
				minetest.set_node(pos, {name="hades_flowerpots:flower_pot_"..flower})
				if not minetest.is_creative_enabled(name) then
					itemstack:take_item()
				end
			end
		end
		for _, row in ipairs(cuboids) do
			local flower = row[1]
			local flower_node = row[2]
			if item == flower_node then
				minetest.set_node(pos, {name="hades_flowerpots:flower_pot_"..flower})
				if not minetest.is_creative_enabled(name) then
					itemstack:take_item()
				end
			end
		end
	end,
})

minetest.register_craft({
	output = 'hades_flowerpots:flower_pot',
	recipe = {
		{'hades_core:clay_brick', '', 'hades_core:clay_brick'},
		{'', 'hades_core:clay_brick', ''},
	}
})

for _, row in ipairs(flowers) do
local flower = row[1]
local flower_node = row[2]
local desc = row[3]
local texture = minetest.registered_nodes[flower_node]["tiles"]
minetest.register_node("hades_flowerpots:flower_pot_"..flower, {
	description = desc,
	drawtype = "mesh",
	mesh = "hades_flowerpots_flowerpot.obj",
	tiles = {
		"[combine:32x32:0,0=hades_flowerpots_flowerpot.png:0,0="..texture[1],
	},
	use_texture_alpha = "clip",
	visual_scale = 0.5,
	wield_scale = {x=1.0, y=1.0, z=1.0},
	paramtype = "light",
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, -0.1, 0.2},
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, -0.1, 0.2},
	},
	groups = {cracky = 3, oddly_breakable_by_hand = 1, not_in_creative_inventory=1, attached_node=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
	on_rightclick = function(pos, item, clicker)
		local name = clicker:get_player_name()
		if minetest.is_protected(pos, name) then
			minetest.record_protection_violation(pos, name)
			return
		end
		if not minetest.is_creative_enabled(name) then
			minetest.add_item({x=pos.x, y=pos.y+0.5, z=pos.z}, flower_node)
		end
		minetest.set_node(pos, {name="hades_flowerpots:flower_pot"})
	end,
	drop = {
	max_items = 2,items = {{items = {"hades_flowerpots:flower_pot", flower_node},rarity = 1,},},
	},
})
end

for _, row in ipairs(cuboids) do
local flower = row[1]
local flower_node = row[2]
local desc = row[3]
minetest.register_node("hades_flowerpots:flower_pot_"..flower, {
	description = desc,
	drawtype = "mesh",
	mesh = "hades_flowerpots_flowerpot_with_cuboid.obj",
	tiles = {
		"hades_flowerpots_cuboid_base.png^hades_flowerpots_"..flower..".png",
	},
	use_texture_alpha = "clip",
	visual_scale = 0.5,
	wield_scale = {x=1.0, y=1.0, z=1.0},
	paramtype = "light",
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, -0.1, 0.2}
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, -0.1, 0.2}
	},
	groups = {cracky = 3, oddly_breakable_by_hand = 1, not_in_creative_inventory=1, attached_node=1},
	sounds = hades_sounds.node_sound_stone_defaults(),
	on_rightclick = function(pos, item, clicker)
		local name = clicker:get_player_name()
		if minetest.is_protected(pos, name) then
			minetest.record_protection_violation(pos, name)
			return
		end
		if not minetest.is_creative_enabled(name) then
			minetest.add_item({x=pos.x, y=pos.y+0.5, z=pos.z}, flower_node)
		end
		minetest.set_node(pos, {name="hades_flowerpots:flower_pot"})
	end,
	drop = {
	max_items = 2,items = {{items = {"hades_flowerpots:flower_pot", flower_node},rarity = 1,},},
	},
})
end

