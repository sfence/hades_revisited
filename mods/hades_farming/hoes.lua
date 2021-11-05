local S = minetest.get_translator("hades_farming")
local tt = S("Turns Dirt to Soil")

hades_farming.register_hoe(":hades_farming:hoe_wood", {
	description = S("Wooden Hoe"),
	_tt_help = tt,
	inventory_image = "hades_farming_tool_woodhoe.png",
	groups = { hoe = 1, },
	max_uses = 30,
	material = "group:wood"
})

hades_farming.register_hoe(":hades_farming:hoe_stone", {
	description = S("Stone Hoe"),
	_tt_help = tt,
	inventory_image = "hades_farming_tool_stonehoe.png",
	groups = { hoe = 1, },
	max_uses = 90,
	material = "group:stone"
})

hades_farming.register_hoe(":hades_farming:hoe_steel", {
	description = S("Steel Hoe"),
	_tt_help = tt,
	inventory_image = "hades_farming_tool_steelhoe.png",
	groups = { hoe = 1, },
	max_uses = 200,
	material = "hades_core:steel_ingot"
})

hades_farming.register_hoe(":hades_farming:hoe_bronze", {
	description = S("Bronze Hoe"),
	_tt_help = tt,
	inventory_image = "hades_farming_tool_bronzehoe.png",
	groups = { hoe = 1, },
	max_uses = 220,
	material = "hades_core:bronze_ingot"
})

hades_farming.register_hoe(":hades_farming:hoe_mese", {
	description = S("Mese Hoe"),
	_tt_help = tt,
	inventory_image = "hades_farming_tool_mesehoe.png",
	groups = { hoe = 1, },
	max_uses = 350,
	material = "hades_core:mese_crystal",
	material_handle = "hades_core:steel_rod",
})

hades_farming.register_hoe(":hades_farming:hoe_prism", {
	description = S("Prism Hoe"),
	_tt_help = tt,
	inventory_image = "hades_farming_tool_prismhoe.png",
	groups = { hoe = 1, },
	max_uses = 1050,
	material = "hades_core:prismatic_gem",
	material_handle = "hades_core:steel_rod",
})

minetest.register_craft({
	type = "fuel",
	recipe = "hades_farming:hoe_wood",
	burntime = 10,
})
