local S = minetest.get_translator("hades_flowerpots")

local flowers = {
	{"red", "hades_flowers:red", S("Red Flower")},
	{"orange", "hades_flowers:orange", S("Orange Flower")},
	{"blue", "hades_flowers:blue", S("Blue Flower")},
	{"violet", "hades_flowers:violet", S("Violet Flower")},
	{"yellow", "hades_flowers:yellow", S("Yellow Flower")},
	{"white", "hades_flowers:white", S("White Flower")},

-- TODO: Maybe add these later?
--	{"grass", "hades_grass:grass_1", S("Grass Clump")},
--	{"junglegrass", "hades_grass:junglegrass", S("Tropical Grass")},
--	{"dry_shrub", "hades_core:dry_shrub", S("Dry Shrub")},

	{"sapling", "hades_trees:sapling", S("Temperate Tree Sapling")},
	{"jungle_sapling", "hades_trees:jungle_sapling", S("Common Tropical Tree Sapling")},
	{"cultivated_jungle_sapling", "hades_trees:cultivated_jungle_sapling", S("Cultivated Tropical Tree Sapling")},
	{"olive_sapling", "hades_trees:olive_sapling", S("Olive Tree Sapling")},
	{"pale_sapling", "hades_trees:pale_sapling", S("Pale Tree Sapling")},
	{"birch_sapling", "hades_trees:birch_sapling", S("Birch Tree Sapling")},
	{"orange_sapling", "hades_trees:orange_sapling", S("Orange Tree Sapling")},
	{"banana_sapling", "hades_trees:banana_sapling", S("Banana Tree Sapling")},
	{"cocoa_sapling", "hades_trees:cocoa_sapling", S("Cocoa Tree Sapling")},
	{"coconut_sapling", "hades_trees:coconut_sapling", S("Coconut Tree Sapling")},
	{"canvas_sapling", "hades_trees:canvas_sapling", S("Canvas Tree Sapling")},
}

local cuboids = {
	{"cactus", "hades_core:cactus", S("Cactus")},

	{"leaves", "hades_trees:leaves", S("Temperate Leaves")},
	{"jungle_leaves", "hades_trees:jungle_leaves", S("Common Tropical Leaves")},
	{"cultivated_jungle_leaves", "hades_trees:cultivated_jungle_leaves", S("Cultivated Tropical Leaves")},
	{"olive_leaves", "hades_trees:olive_leaves", S("Olive Leaves")},
	{"birch_leaves", "hades_trees:birch_leaves", S("Birch Leaves")},
	{"pale_leaves", "hades_trees:pale_leaves", S("Pale Leaves")},
	{"orange_leaves", "hades_trees:orange_leaves", S("Orange Leaves")},
	{"banana_leaves", "hades_trees:banana_leaves", S("Banana Leaves")},
	{"canvas_leaves", "hades_trees:canvas_leaves", S("Canvas Leaves")},
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
	description = S("Flower Pot with @1", desc),
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
		if not minetest.is_creative_enabled(clicker:get_player_name()) then
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
	description = S("Flower Pot with @1", desc),
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
		if not minetest.is_creative_enabled(clicker:get_player_name()) then
			minetest.add_item({x=pos.x, y=pos.y+0.5, z=pos.z}, flower_node)
		end
		minetest.set_node(pos, {name="hades_flowerpots:flower_pot"})
	end,
	drop = {
	max_items = 2,items = {{items = {"hades_flowerpots:flower_pot", flower_node},rarity = 1,},},
	},
})
end

