local S = minetest.get_translator("hades_trees")
local pr

minetest.register_node("hades_trees:apple", {
	description = S("Apple (+@1)", 2),
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
	groups = {dig_immediate=3,flammable=2,leafdecay=3,leafdecay_drop=1,food=2,eatable=2},
	on_use = minetest.item_eat(2),
	sounds = hades_sounds.node_sound_leaves_defaults(),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name="hades_trees:apple", param2=1})
		end
	end,
})

minetest.register_node("hades_trees:sapling", {
	description = S("Common Tree Sapling"),
	_tt_help = S("Needs Dirt and light to grow"),
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
	sounds = hades_sounds.node_sound_leaves_defaults(),
})

minetest.register_node("hades_trees:tree", {
	description = S("Common Tree Trunk"),
	tiles = {"default_tree_top.png", "default_tree_top.png", "default_tree.png"},
	paramtype = "light",
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
	is_ground_content = false,
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	sounds = hades_sounds.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("hades_trees:leaves", {
	description = S("Common Leaves"),
	drawtype = "allfaces_optional",
	tiles = {"default_leaves.png"},
	paramtype = "light",
	waving = 1,
	is_ground_content = true,
	place_param2 = 1,
	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1, ash_fertilizer=3, porous=1},
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 chance
				items = {'hades_trees:sapling'},
				rarity = 20,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {'hades_trees:leaves'},
			}
		}
	},
	sounds = hades_sounds.node_sound_leaves_defaults(),
})

minetest.register_node("hades_trees:bark", {
	description = S("Common Bark"),
	paramtype2 = "facedir",
	tiles = { "default_tree.png" },
	is_ground_content = false,
	groups = { choppy = 3, oddly_breakable_by_hand = 1, flammable = 2 },
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_abm({
	label = "Grow sapling to apple tree",
	nodenames = {"hades_trees:sapling"},
	interval = 20,
	chance = 50,
	action = function(pos, node)
		hades_trees.generate_appletree(pos)
	end
})

