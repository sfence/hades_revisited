minetest.register_craftitem("default:stick", {
	description = "Stick",
	inventory_image = "default_stick.png",
	groups = {stick=1},
})


minetest.register_craftitem("default:paper", {
	description = "Paper",
	inventory_image = "default_paper.png",
})

minetest.register_craftitem("default:book", {
	description = "Book",
	inventory_image = "default_book.png",
})


minetest.register_craftitem("default:coal_lump", {
	description = "Coal Lump",
	inventory_image = "default_coal_lump.png",
})


minetest.register_craftitem("default:iron_lump", {
	description = "Iron Lump",
	inventory_image = "default_iron_lump.png",
})

minetest.register_craftitem("default:tin_lump", {
	description = "Tin Lump",
	inventory_image = "default_tin_lump.png",
})

minetest.register_craftitem("default:copper_lump", {
	description = "Copper Lump",
	inventory_image = "default_copper_lump.png",
})


minetest.register_craftitem("default:mese_crystal", {
	description = "Mese Crystal",
	inventory_image = "default_mese_crystal.png",
})


minetest.register_craftitem("default:gold_lump", {
	description = "Gold Lump",
	inventory_image = "default_gold_lump.png",
})


minetest.register_craftitem("default:diamond", {
	description = "Diamond",
	inventory_image = "default_diamond.png",
})


minetest.register_craftitem("default:clay_lump", {
	description = "Clay Lump",
	inventory_image = "default_clay_lump.png",
})


minetest.register_craftitem("default:steel_ingot", {
	description = "Steel Ingot",
	inventory_image = "default_steel_ingot.png",
})

minetest.register_craftitem("default:tin_ingot", {
	description = "Tin Ingot",
	inventory_image = "default_tin_ingot.png",
})


minetest.register_craftitem("default:copper_ingot", {
	description = "Copper Ingot",
	inventory_image = "default_copper_ingot.png",
})


minetest.register_craftitem("default:bronze_ingot", {
	description = "Bronze Ingot",
	inventory_image = "default_bronze_ingot.png",
})


minetest.register_craftitem("default:gold_ingot", {
	description = "Gold Ingot",
	inventory_image = "default_gold_ingot.png"
})


minetest.register_craftitem("default:mese_crystal_fragment", {
	description = "Mese Crystal Fragment",
	inventory_image = "default_mese_crystal_fragment.png",
})


minetest.register_craftitem("default:clay_brick", {
	description = "Clay Brick",
	inventory_image = "default_clay_brick.png",
})


minetest.register_craftitem("default:obsidian_shard", {
	description = "Obsidian Shard",
	inventory_image = "default_obsidian_shard.png",
})

minetest.register_craftitem("default:emerald", {
	description = "Emerald",
	inventory_image = "default_emerald.png",
})

minetest.register_craftitem("default:sapphire", {
	description = "Sapphire",
	inventory_image = "default_sapphire.png",
})

minetest.register_craftitem("default:ruby", {
	description = "Ruby",
	inventory_image = "default_ruby.png",
})

minetest.register_craftitem("default:nails", {
	description = "Nails",
	inventory_image = "default_nails.png",
})

-- Foods 

minetest.register_craftitem("default:sugar", {
	description = "Sugar",
	inventory_image = "default_sugar.png",
})

minetest.register_craftitem("default:pie_strawberry_raw", {
	description = "Raw Strawberry Pie (+3)",
	inventory_image = "default_strawberry_pie_raw.png",
	on_use = minetest.item_eat(3),
	groups = { food = 2, eatable = 3 },
})

minetest.register_craftitem("default:pie_strawberry", {
	description = "Strawberry Pie (+5)",
	inventory_image = "default_strawberry_pie.png",
	on_use = minetest.item_eat(5),
	groups = { food = 2, eatable = 5 },
})

minetest.register_craftitem("default:bottle_olive_oil", {
	description = "Bottle of Olive Oil (+3)",
	inventory_image = "default_bottle_olive_oil.png",
	on_use = minetest.item_eat(3, "vessels:glass_bottle"),
	groups = { food = 3, eatable = 3 },
})

minetest.register_craftitem("default:tomatosalad", {
	description = "Tomato Salad (+6)",
	inventory_image = "default_tomatosalad.png",
	on_use = minetest.item_eat(6, "default:plate"),
	groups = { food = 2, eatable = 6 },
})

minetest.register_craftitem("default:tomato_potato_salad", {
	description = "Tomato-Potato Salad (+8)",
	inventory_image = "default_tpsalad.png",
	on_use = minetest.item_eat(8, "default:plate"),
	groups = { food = 2, eatable = 8 },
})

minetest.register_craftitem("default:spiced_potato", {
	description = "Spiced Potato (+0)",
	inventory_image = "default_spiced_potato.png",
	on_use = minetest.item_eat(0),
	groups = { food = 2 },
})

minetest.register_craftitem("default:baked_potato", {
	description = "Baked Potato (+4)",
	inventory_image = "default_baked_potato.png",
	on_use = minetest.item_eat(4),
	groups = { food = 2, eatable = 4 },
})

minetest.register_craftitem("default:pie_apple_raw", {
	description = "Raw Apple Pie (+3)",
	inventory_image = "default_apple_pie_raw.png",
	on_use = minetest.item_eat(3),
	groups = { food = 2, eatable = 3 },
})

minetest.register_craftitem("default:pie_apple", {
	description = "Apple Pie (+5)",
	inventory_image = "default_apple_pie.png",
	on_use = minetest.item_eat(5),
	groups = { food = 2, eatable = 5 },
})

