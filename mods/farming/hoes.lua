local S = minetest.get_translator("farming")

farming.register_hoe(":farming:hoe_wood", {
	description = S("Wooden Hoe"),
	inventory_image = "farming_tool_woodhoe.png",
	groups = { hoe = 1, },
	max_uses = 30,
	material = "group:wood"
})

farming.register_hoe(":farming:hoe_stone", {
	description = S("Stone Hoe"),
	inventory_image = "farming_tool_stonehoe.png",
	groups = { hoe = 1, },
	max_uses = 90,
	material = "group:stone"
})

farming.register_hoe(":farming:hoe_steel", {
	description = S("Steel Hoe"),
	inventory_image = "farming_tool_steelhoe.png",
	groups = { hoe = 1, },
	max_uses = 200,
	material = "hades_core:steel_ingot"
})

farming.register_hoe(":farming:hoe_bronze", {
	description = S("Bronze Hoe"),
	inventory_image = "farming_tool_bronzehoe.png",
	groups = { hoe = 1, },
	max_uses = 220,
	material = "hades_core:bronze_ingot"
})

farming.register_hoe(":farming:hoe_mese", {
	description = S("Mese Hoe"),
	inventory_image = "farming_tool_mesehoe.png",
	groups = { hoe = 1, },
	max_uses = 350,
	material = "hades_core:mese_crystal",
	material_handle = "hades_core:steel_ingot",
})

farming.register_hoe(":farming:hoe_prism", {
	description = S("Prism Hoe"),
	inventory_image = "farming_tool_prismhoe.png",
	groups = { hoe = 1, },
	max_uses = 1050,
	material = "hades_core:prismatic_gem",
	material_handle = "hades_core:steel_ingot",
})

minetest.register_craft({
	type = "fuel",
	recipe = "farming:hoe_wood",
	burntime = 10,
})
