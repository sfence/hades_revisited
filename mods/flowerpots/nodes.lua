
local flowers = {
	{"rose", "flowers:rose", "Rose"},
	{"tulip", "flowers:tulip", "Tulip"},
	{"geranium", "flowers:geranium", "Geranium"},
	{"viola", "flowers:viola", "Viola"},
	{"dandelion_yellow", "flowers:dandelion_yellow", "Yellow Dandelion"},
	{"dandelion_white", "flowers:dandelion_white", "White Dandelion"},

--	{"grass", "default:grass_1", "Grass"},
--	{"junglegrass", "default:junglegrass", "junglegrass"},
--	{"dry_shrub", "default:dry_shrub", "Dry Shrub"},
--	{"papyrus", "default:papyrus", "Papyrus"},

	{"sapling", "default:sapling", "Common Tree Sapling"},
	{"junglesapling", "default:junglesapling", "Common Jungle Tree Sapling"},
	{"cjsapling", "farming_plus:cjsapling", "Cultivated Jungle Tree Sapling"},
	{"olive_sapling", "farming_plus:olive_sapling", "Olive Tree Sapling"},
	{"pale_sapling", "farming_plus:pale_sapling", "Pale Tree Sapling"},
	{"birch_sapling", "farming_plus:birch_sapling", "Birch Tree Sapling"},
}

local cubes = {
	{"cactus", "default:cactus", "Cactus"},
	{"leaves", "default:leaves", "Common Leaves"},
	{"jungleleaves", "default:jungleleaves", "Common Jungle Leaves"},
	{"cj_leaves", "farming_plus:cj_leaves", "Cultivated Jungle Leaves"},
	{"olive_leaves", "farming_plus:olive_leaves", "Olive Leaves"},
	{"leaves_birch", "farming_plus:leaves_birch", "Birch Leaves"},
	{"pale_leaves", "farming_plus:pale_leaves", "Pale Leaves"},
}

minetest.register_node("flowerpots:flower_pot", {
	description = "Flower Pot",
	drawtype = "mesh",
	mesh = "flowerpot.obj",
	tiles = {
		"flowerpot.png",
	},
	visual_scale = 0.5,
	wield_scale = {x=1.0, y=1.0, z=1.0},
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, -0.1, 0.2}
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, -0.1, 0.2}
	},
	groups = {cracky = 1, oddly_breakable_by_hand = 1, attached_node=1},
	sounds = default.node_sound_stone_defaults(),
	on_rightclick = function(pos, node, clicker, itemstack)
		local item = clicker:get_wielded_item():get_name()
		for _, row in ipairs(flowers) do
			local flower = row[1]
			local flower_node = row[2]
			if item == flower_node then
				minetest.set_node(pos, {name="flowerpots:flower_pot_"..flower})
				if not minetest.settings:get_bool("creative_mode") then
					itemstack:take_item()
				end
			end
		end
		for _, row in ipairs(cubes) do
			local flower = row[1]
			local flower_node = row[2]
			if item == flower_node then
				minetest.set_node(pos, {name="flowerpots:flower_pot_"..flower})
				if not minetest.settings:get_bool("creative_mode") then
					itemstack:take_item()
				end
			end
		end
	end,
})

minetest.register_craft({
	output = 'flowerpots:flower_pot',
	recipe = {
		{'default:clay_brick', '', 'default:clay_brick'},
		{'', 'default:clay_brick', ''},
	}
})

for _, row in ipairs(flowers) do
local flower = row[1]
local flower_node = row[2]
local desc = row[3]
local texture = minetest.registered_nodes[flower_node]["tiles"]
minetest.register_node("flowerpots:flower_pot_"..flower, {
	description = "Flower Pot With "..desc.."",
	drawtype = "mesh",
	mesh = "flowerpot.obj",
	tiles = {
		"[combine:32x32:0,0=flowerpot.png:0,0="..texture[1],
	},
	visual_scale = 0.5,
	wield_scale = {x=1.0, y=1.0, z=1.0},
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, -0.1, 0.2},
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, -0.1, 0.2},
	},
	groups = {cracky = 1, oddly_breakable_by_hand = 1, not_in_creative_inventory=1, attached_node=1},
	sounds = default.node_sound_stone_defaults(),
	on_rightclick = function(pos, item, clicker)
		if not minetest.settings:get_bool("creative_mode") then
			minetest.add_item({x=pos.x, y=pos.y+0.5, z=pos.z}, flower_node)
		end
		minetest.set_node(pos, {name="flowerpots:flower_pot"})
	end,
	drop = {
	max_items = 2,items = {{items = {"flowerpots:flower_pot", flower_node},rarity = 1,},},
	},
})
end

for _, row in ipairs(cubes) do
local flower = row[1]
local flower_node = row[2]
local desc = row[3]
minetest.register_node("flowerpots:flower_pot_"..flower, {
	description = "Flower Pot With "..desc.."",
	drawtype = "mesh",
	mesh = "flowerpot_with_long_cube.obj",
	tiles = {
		"flowerpot_"..flower..".png",
	},
	visual_scale = 0.5,
	wield_scale = {x=1.0, y=1.0, z=1.0},
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, -0.1, 0.2}
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, -0.1, 0.2}
	},
	groups = {cracky = 1, oddly_breakable_by_hand = 1, not_in_creative_inventory=1, attached_node=1},
	sounds = default.node_sound_stone_defaults(),
	on_rightclick = function(pos, item, clicker)
		if not minetest.settings:get_bool("creative_mode") then
			minetest.add_item({x=pos.x, y=pos.y+0.5, z=pos.z}, flower_node)
		end
		minetest.set_node(pos, {name="flowerpots:flower_pot"})
	end,
	drop = {
	max_items = 2,items = {{items = {"flowerpots:flower_pot", flower_node},rarity = 1,},},
	},
})
end


minetest.register_alias("flowers:flower_pot", "flowerpots:flower_pot")
minetest.register_alias("flowers:potted_rose", "flowerpots:flower_pot_rose")
minetest.register_alias("flowers:potted_dandelion_yellow", "flowerpots:flower_pot_dandelion_yellow")
minetest.register_alias("flowers:potted_dandelion_white", "flowerpots:flower_pot_dandelion_white")
minetest.register_alias("flowers:potted_viola", "flowerpots:flower_pot_viola")
minetest.register_alias("flowers:potted_geranium", "flowerpots:flower_pot_geranium")
minetest.register_alias("flowers:potted_tulip", "flowerpots:flower_pot_tulip")
