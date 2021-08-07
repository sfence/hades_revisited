local S = minetest.get_translator("hades_trees")

hades_trees.register_trunk("charred_tree", {
	description = S("Charred Tree Trunk"),
	tiles = {
		"hades_trees_charred_tree_top.png",
		"hades_trees_charred_tree_top.png",
		"hades_trees_charred_tree.png",
	},
	sounds = hades_sounds.node_sound_wood_defaults({pitch=0.8}),
})
hades_trees.register_bark("charred_bark", {
	description = S("Charred Bark"),
	image = "hades_trees_charred_tree.png",
	sounds = hades_sounds.node_sound_wood_defaults({pitch=0.8}),
})

hades_trees.register_leaves("burned_branches", {
	description = S("Burned Branches"),
	image = "hades_trees_burned_branches.png",
	sounds = hades_sounds.node_sound_straw_defaults(),
})

minetest.register_craft({
	output = "hades_core:stick 2",
	recipe = {{ "hades_trees:burned_branches" }},
})

minetest.register_craft({
	output = "hades_trees:charred_wood",
	recipe = {{ "hades_trees:charred_tree" }},
})

minetest.register_abm({
	label = "Scorch tree trunks and leaves",
	nodenames = {"group:tree", "group:leaves"},
	neighbors  = {"group:lava"},
	interval = 20,
	chance = 20,
	action = function(pos, node)
		if minetest.get_item_group(node.name, "tree") ~= 0 then
			if node.name ~= "hades_trees:charred_tree" then
				node.name = "hades_trees:charred_tree"
				minetest.swap_node(pos, node)
			end
		elseif minetest.get_item_group(node.name, "leaves") ~= 0 then
			if node.name ~= "hades_trees:burned_branches" then
				node.name = "hades_trees:burned_branches"
				minetest.swap_node(pos, node)
			end
		end
	end
})
