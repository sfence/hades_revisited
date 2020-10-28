local S = minetest.get_translator("hades_trees")

minetest.register_node("hades_trees:olive_sapling", {
	description = S("Olive Tree Sapling"),
	_tt_help = S("Needs Dirt and light to grow"),
	drawtype = "plantlike",
	tiles = {"farming_olive_sapling.png"},
	inventory_image = "farming_olive_sapling.png",
	wield_image = "farming_olive_sapling.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {dig_immediate=3,flammable=2, sapling=1},
	sounds = hades_sounds.node_sound_defaults(),
})


minetest.register_node("hades_trees:olive_leaves", {
	description = S("Olive Leaves"),
	drawtype = "allfaces_optional",
	tiles = {"farming_olive_leaves.png"},
	paramtype = "light",
	waving = 1,
	is_ground_content = false,
	place_param2 = 1,
	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1, porous=1},
 	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 chance
				items = {'hades_trees:olive_sapling'},
				rarity = 25,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {'hades_trees:olive_leaves'},
			}
		}
	},
	sounds = hades_sounds.node_sound_leaves_defaults(),
})


minetest.register_abm({
	nodenames = {"hades_trees:olive_sapling"},
	interval = 60,
	chance = 20,
	action = function(pos, node)
		hades_trees:generate_tree(pos, "hades_trees:tree", "hades_trees:olive_leaves", {"hades_core:dirt", "hades_core:dirt_with_grass"}, {["hades_trees:olive"]=10})
	end
})

minetest.register_node("hades_trees:olive", {
	description = S("Olive (+1)"),
	tiles = {"farming_olive.png"},
	inventory_image = "farming_olive.png",
	wield_image = "farming_olive.png",
	drawtype = "plantlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {dig_immediate=3,flammable=2,leafdecay=3,leafdecay_drop=1,food=2,eatable=1,},
	sounds = hades_sounds.node_sound_defaults(),
	on_use = minetest.item_eat(1),
})
