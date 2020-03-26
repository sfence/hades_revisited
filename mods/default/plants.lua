
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
	groups = {snappy=3,flammable=3,flora=1,grass=1,attached_node=1},
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

for i=2,5 do
	minetest.register_node("default:grass_"..i, {
		description = "Grass",
		drawtype = "plantlike",
		tiles = {"default_grass_"..i..".png"},
		inventory_image = "default_grass_"..i..".png",
		wield_image = "default_grass_"..i..".png",
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		is_ground_content = true,
		drop = "default:grass_1",
		groups = {snappy=3,flammable=3,flora=1,grass=1,attached_node=1,not_in_creative_inventory=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6/16, -0.5, -6/16, 6/16, -3/16, 6/16},
		},
	})
end

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
	groups = {snappy=3,flammable=2,flora=1,grass=1,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -0.5, -7/16, 7/16, 0.9, 7/16},
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
	groups = {choppy=2,oddly_breakable_by_hand=1,flammable=2},
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
	groups = {choppy=3,flammable=2},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:cactus_brick", {
	description = "Cactus Brick",
	tiles = {"default_cactus_brick.png"},
	is_ground_content = false,
	groups = {choppy=3,flammable=2},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:glowing_cactus_block", {
	description = "Glowing Cactus Block",
	tiles = {"default_cactus_block.png"},
	is_ground_content = false,
	light_source = 5,
	groups = {choppy=3,flammable=2},
	sounds = default.node_sound_wood_defaults(),
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

