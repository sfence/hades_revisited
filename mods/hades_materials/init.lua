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

minetest.register_craftitem("hades_materials:teleporter_device", {
	description = S("Teleporter Device"),
	inventory_image = "hades_materials_teleporter_device.png",
})

minetest.register_craft({
	output = 'hades_materials:teleporter_device',
	recipe = {
		{'hades_core:tin_ingot', 'hades_core:gold_ingot', 'hades_core:tin_ingot'},
		{'hades_core:gold_ingot', 'hades_core:prismatic_gem', 'hades_core:gold_ingot'},
		{'hades_core:tin_ingot', 'hades_core:mese_crystal', 'hades_core:tin_ingot'},
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

minetest.register_alias("homedecor:plastic_base", "hades_materials:plastic_base")
minetest.register_alias("homedecor:plastic_sheeting", "hades_materials:plastic_sheeting")

-- Silicon
minetest.register_craftitem("hades_materials:silicon", {
	description= S("Silicon"),
	inventory_image = "jeija_silicon.png",
	wield_image = "jeija_silicon.png",
})
minetest.register_craft({
	output = "hades_materials:silicon 4",
	recipe = {
		{"hades_core:volcanic_sand", "hades_core:volcanic_sand"},
		{"hades_core:volcanic_sand", "hades_core:steel_ingot"},
	}
})
