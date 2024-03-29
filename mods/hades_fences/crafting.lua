-- Simple fences

minetest.register_craft({
	output = 'hades_fences:fence_wood 4',
	recipe = {
		{'hades_trees:wood', 'group:stick', 'hades_trees:wood'},
		{'hades_trees:wood', 'group:stick', 'hades_trees:wood'},
	}
})
minetest.register_craft({
	output = 'hades_fences:fence_jungle_wood 4',
	recipe = {
		{'hades_trees:jungle_wood', 'group:stick', 'hades_trees:jungle_wood'},
		{'hades_trees:jungle_wood', 'group:stick', 'hades_trees:jungle_wood'},
	}
})
minetest.register_craft({
	output = 'hades_fences:fence_pale_wood 4',
	recipe = {
		{'hades_trees:pale_wood', 'group:stick', 'hades_trees:pale_wood'},
		{'hades_trees:pale_wood', 'group:stick', 'hades_trees:pale_wood'},
	}
})

minetest.register_craft({
	output = 'hades_fences:fence_cream_wood 4',
	recipe = {
		{'hades_trees:cream_wood', 'group:stick', 'hades_trees:cream_wood'},
		{'hades_trees:cream_wood', 'group:stick', 'hades_trees:cream_wood'},
	}
})

minetest.register_craft({
	output = 'hades_fences:fence_lush_wood 4',
	recipe = {
		{'hades_trees:lush_wood', 'group:stick', 'hades_trees:lush_wood'},
		{'hades_trees:lush_wood', 'group:stick', 'hades_trees:lush_wood'},
	}
})

minetest.register_craft({
	output = 'hades_fences:fence_rusty 4',
	recipe = {
		{'hades_core:iron_lump', 'hades_core:iron_lump', 'hades_core:iron_lump'},
		{'hades_core:iron_lump', 'hades_core:iron_lump', 'hades_core:iron_lump'},
	}
})

-- Canvas wood fences

minetest.register_craft({
	type = "shapeless",
	output = 'hades_fences:fence_wood_uncolored',
	recipe = { 'group:fence_colwood', 'hades_trees:canvas_leaves' },
})

minetest.register_craft({
	output = 'hades_fences:fence_wood_uncolored',
	recipe = {
		{'hades_trees:colwood_uncolored', 'group:stick', 'hades_trees:colwood_uncolored'},
		{'hades_trees:colwood_uncolored', 'group:stick', 'hades_trees:colwood_uncolored'},
	}
})

minetest.register_craft({
	type = "shapeless",
	output = 'hades_fences:fence_wood_black',
	recipe = {'group:fence_colwood', 'hades_dye:black'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'hades_fences:fence_wood_blue',
	recipe = {'group:fence_colwood', 'hades_dye:blue'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'hades_fences:fence_wood_brown',
	recipe = {'group:fence_colwood', 'hades_dye:brown'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'hades_fences:fence_wood_cyan',
	recipe = {'group:fence_colwood', 'hades_dye:cyan'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'hades_fences:fence_wood_dark_green',
	recipe = {'group:fence_colwood', 'hades_dye:dark_green'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'hades_fences:fence_wood_dark_grey',
	recipe = {'group:fence_colwood', 'hades_dye:dark_grey'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'hades_fences:fence_wood_green',
	recipe = {'group:fence_colwood', 'hades_dye:green'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'hades_fences:fence_wood_grey',
	recipe = {'group:fence_colwood', 'hades_dye:grey'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'hades_fences:fence_wood_magenta',
	recipe = {'group:fence_colwood', 'hades_dye:magenta'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'hades_fences:fence_wood_orange',
	recipe = {'group:fence_colwood', 'hades_dye:orange'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'hades_fences:fence_wood_pink',
	recipe = {'group:fence_colwood', 'hades_dye:pink'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'hades_fences:fence_wood_red',
	recipe = {'group:fence_colwood', 'hades_dye:red'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'hades_fences:fence_wood_violet',
	recipe = {'group:fence_colwood', 'hades_dye:violet'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'hades_fences:fence_wood_white',
	recipe = {'group:fence_colwood', 'hades_dye:white'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'hades_fences:fence_wood_yellow',
	recipe = {'group:fence_colwood', 'hades_dye:yellow'},
})

minetest.register_craft({
	type = "fuel",
	recipe = "group:fence_wood",
	burntime = 15,
})


