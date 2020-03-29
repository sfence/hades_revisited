farming.register_hoe(":farming:hoe_wood", {
	description = "Wooden Hoe",
	inventory_image = "farming_tool_woodhoe.png",
	groups = { hoe = 1, },
	max_uses = 30,
	material = "group:wood"
})

farming.register_hoe(":farming:hoe_stone", {
	description = "Stone Hoe",
	inventory_image = "farming_tool_stonehoe.png",
	groups = { hoe = 1, },
	max_uses = 90,
	material = "group:stone"
})

farming.register_hoe(":farming:hoe_steel", {
	description = "Steel Hoe",
	inventory_image = "farming_tool_steelhoe.png",
	groups = { hoe = 1, },
	max_uses = 200,
	material = "default:steel_ingot"
})

farming.register_hoe(":farming:hoe_bronze", {
	description = "Bronze Hoe",
	inventory_image = "farming_tool_bronzehoe.png",
	groups = { hoe = 1, },
	max_uses = 220,
	material = "default:bronze_ingot"
})

farming.register_hoe(":farming:hoe_mese", {
	description = "Mese Hoe",
	inventory_image = "farming_tool_mesehoe.png",
	groups = { hoe = 1, },
	max_uses = 350,
	material = "default:mese_crystal",
	material_handle = "default:steel_ingot",
})

farming.register_hoe(":farming:hoe_prism", {
	description = "Prism Hoe",
	inventory_image = "farming_tool_prismhoe.png",
	groups = { hoe = 1, },
	max_uses = 1050,
	material = "travelnet:prismatic_gem",
	material_handle = "default:steel_ingot",
})

minetest.register_craft({
	type = "fuel",
	recipe = "farming:hoe_wood",
	burntime = 10,
})
