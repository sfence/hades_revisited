local S = minetest.get_translator("hades_trees")

minetest.register_node("hades_trees:orange_sapling", {
	description = S("Orange Tree Sapling"),
	_tt_help = S("Needs Dirt and light to grow"),
	drawtype = "plantlike",
	tiles = {"farming_orange_sapling.png"},
	inventory_image = "farming_orange_sapling.png",
	wield_image = "farming_orange_sapling.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {dig_immediate=3,flammable=2,sapling=1,attached_node=1},
	sounds = hades_sounds.node_sound_leaves_defaults(),
})


minetest.register_node("hades_trees:orange_leaves", {
	description = S("Orange Leaves"),
	drawtype = "allfaces_optional",
	tiles = {"farming_orange_leaves.png"},
	paramtype = "light",
	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1, ash_fertilizer=3, porous=1},
	place_param2 = 1,
 	drop = {
		max_items = 1,
		items = {
			{
				items = {'hades_trees:orange_sapling'},
				rarity = 20,
			},
		}
	},
	sounds = hades_sounds.node_sound_leaves_defaults(),
})

minetest.register_abm({
	nodenames = {"hades_trees:orange_sapling"},
	interval = 60,
	chance = 10,
	action = function(pos, node)
		hades_trees.generate_orangetree(pos)
	end
})

minetest.register_node("hades_trees:orange", {
	description = S("Orange"),
	tiles = {"farming_orange.png"},
	inventory_image = "farming_orange.png",
	wield_image = "farming_orange.png",
	drawtype = "plantlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {food=2,eatable=1,dig_immediate=3,flammable=2,leafdecay=3,leafdecay_drop=1},
	selection_box = {
		type = "fixed",
		fixed = {-3/16, -4/16, -3/16, 3/16, 5/16, 3/16},
	},
	sounds = hades_sounds.node_sound_leaves_defaults(),

	on_use = minetest.item_eat(1),
})


