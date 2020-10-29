local S = minetest.get_translator("hades_trees")

minetest.register_node("hades_trees:cultivated_jungle_leaves", {
	description = S("Cultivated Jungle Leaves"),
	drawtype = "allfaces_optional",
	tiles = {"hades_trees_cultivated_jungle_leaves.png"},
	paramtype = "light",
	waving = 1,
	is_ground_content = false,
	place_param2 = 1,
	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1, ash_fertilizer=3, porous=1},
 	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 chance
				items = {'hades_trees:cultivated_jungle_sapling'},
				rarity = 25,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {'hades_trees:cultivated_jungle_leaves'},
			}
		}
	},
	sounds = hades_sounds.node_sound_leaves_defaults(),
})

minetest.register_node("hades_trees:cultivated_jungle_sapling", {
	description = S("Cultivated Jungle Tree Sapling"),
	_tt_help = S("Needs Dirt and light to grow"),
	drawtype = "plantlike",
	tiles = {"hades_trees_cultivated_jungle_sapling.png"},
	inventory_image = "hades_trees_cultivated_jungle_sapling.png",
	wield_image = "hades_trees_cultivated_jungle_sapling.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {dig_immediate=3,flammable=2,attached_node=1, sapling=1},
	sounds = hades_sounds.node_sound_defaults(),
})

minetest.register_abm({
	nodenames = {"hades_trees:cultivated_jungle_sapling"},
	interval = 60,
	chance = 20,
	action = function(pos, node)
		hades_trees.generate_cjtree(pos)
	end
})


