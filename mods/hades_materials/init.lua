local S = minetest.get_translator("hades_materials")

minetest.register_craftitem("hades_materials:plastic_sheeting", {
	description = S("Plastic Sheet"),
	inventory_image = "hades_materials_plastic_sheeting.png",
})

minetest.register_craftitem("hades_materials:plastic_base", {
	description = S("Unprocessed Plastic Base"),
	wield_image = "hades_materials_plastic_base.png",
	inventory_image = "hades_materials_plastic_base_inv.png",
})

minetest.register_craft({
	type = "shapeless",
	output = 'hades_materials:plastic_base 4',
	recipe = { "group:leaves",
		   "group:leaves",
		   "group:leaves",
		   "group:leaves",
		   "group:leaves",
		   "group:leaves"
	}
})

minetest.register_craft({
	type = "cooking",
	output = "hades_materials:plastic_sheeting",
	recipe = "hades_materials:plastic_base",
})

minetest.register_craft({
	type = 'fuel',
	recipe = 'hades_materials:plastic_base',
	burntime = 30,
})

minetest.register_craft({
	type = 'fuel',
	recipe = 'hades_materials:plastic_sheeting',
	burntime = 30,
})

minetest.register_alias("homedecor:plastic_base", "hades_materials_plastic_base")
minetest.register_alias("homedecor:plastic_sheeting", "hades_materials_plastic_sheeting")
