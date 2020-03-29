-- mods/default/crafting.lua



minetest.register_craft({
	output = 'default:stick 4',
	recipe = {
		{'group:wood'},
	}
})


minetest.register_craft({
	output = 'default:pick_wood',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})


minetest.register_craft({
	output = 'default:pick_stone',
	recipe = {
		{'group:stone', 'group:stone', 'group:stone'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})


minetest.register_craft({
	output = 'default:pick_steel',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})


minetest.register_craft({
	output = 'default:pick_bronze',
	recipe = {
		{'default:bronze_ingot', 'default:bronze_ingot', 'default:bronze_ingot'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})


minetest.register_craft({
	output = 'default:pick_mese',
	recipe = {
		{'default:mese_crystal', 'default:mese_crystal', 'default:mese_crystal'},
		{'', 'default:steel_ingot', ''},
		{'', 'default:steel_ingot', ''},
	}
})


minetest.register_craft({
	output = 'default:pick_prism',
	recipe = {
		{'travelnet:prismatic_gem', 'travelnet:prismatic_gem', 'travelnet:prismatic_gem'},
		{'', 'default:steel_ingot', ''},
		{'', 'default:steel_ingot', ''},
	}
})


minetest.register_craft({
	output = 'default:shovel_wood',
	recipe = {
		{'group:wood'},
		{'group:stick'},
		{'group:stick'},
	}
})


minetest.register_craft({
	output = 'default:shovel_stone',
	recipe = {
		{'group:stone'},
		{'group:stick'},
		{'group:stick'},
	}
})


minetest.register_craft({
	output = 'default:shovel_steel',
	recipe = {
		{'default:steel_ingot'},
		{'group:stick'},
		{'group:stick'},
	}
})


minetest.register_craft({
	output = 'default:shovel_bronze',
	recipe = {
		{'default:bronze_ingot'},
		{'group:stick'},
		{'group:stick'},
	}
})


minetest.register_craft({
	output = 'default:shovel_mese',
	recipe = {
		{'default:mese_crystal'},
		{'default:steel_ingot'},
		{'default:steel_ingot'},
	}
})


minetest.register_craft({
	output = 'default:shovel_prism',
	recipe = {
		{'travelnet:prismatic_gem'},
		{'default:steel_ingot'},
		{'default:steel_ingot'},
	}
})


minetest.register_craft({
	output = 'default:axe_wood',
	recipe = {
		{'group:wood', 'group:wood'},
		{'group:wood', 'group:stick'},
		{'', 'group:stick'},
	}
})


minetest.register_craft({
	output = 'default:axe_stone',
	recipe = {
		{'group:stone', 'group:stone'},
		{'group:stone', 'group:stick'},
		{'', 'group:stick'},
	}
})


minetest.register_craft({
	output = 'default:axe_steel',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot'},
		{'default:steel_ingot', 'group:stick'},
		{'', 'group:stick'},
	}
})


minetest.register_craft({
	output = 'default:axe_bronze',
	recipe = {
		{'default:bronze_ingot', 'default:bronze_ingot'},
		{'default:bronze_ingot', 'group:stick'},
		{'', 'group:stick'},
	}
})


minetest.register_craft({
	output = 'default:axe_mese',
	recipe = {
		{'default:mese_crystal', 'default:mese_crystal'},
		{'default:mese_crystal', 'default:steel_ingot'},
		{'', 'default:steel_ingot'},
	}
})


minetest.register_craft({
	output = 'default:axe_prism',
	recipe = {
		{'travelnet:prismatic_gem', 'travelnet:prismatic_gem'},
		{'travelnet:prismatic_gem', 'default:steel_ingot'},
		{'', 'default:steel_ingot'},
	}
})


minetest.register_craft({
	output = 'default:sword_wood',
	recipe = {
		{'group:wood'},
		{'group:wood'},
		{'group:stick'},
	}
})


minetest.register_craft({
	output = 'default:sword_stone',
	recipe = {
		{'group:stone'},
		{'group:stone'},
		{'group:stick'},
	}
})


minetest.register_craft({
	output = 'default:sword_steel',
	recipe = {
		{'default:steel_ingot'},
		{'default:steel_ingot'},
		{'group:stick'},
	}
})


minetest.register_craft({
	output = 'default:sword_bronze',
	recipe = {
		{'default:bronze_ingot'},
		{'default:bronze_ingot'},
		{'group:stick'},
	}
})


minetest.register_craft({
	output = 'default:sword_mese',
	recipe = {
		{'default:mese_crystal'},
		{'default:mese_crystal'},
		{'default:steel_ingot'},
	}
})


minetest.register_craft({
	output = 'default:sword_prism',
	recipe = {
		{'travelnet:prismatic_gem'},
		{'travelnet:prismatic_gem'},
		{'default:steel_ingot'},
	}
})


minetest.register_craft({
	output = 'default:rail 18',
	recipe = {
		{'default:steel_ingot', '', 'default:steel_ingot'},
		{'default:steel_ingot', 'group:stick', 'default:steel_ingot'},
		{'default:steel_ingot', '', 'default:steel_ingot'},
	}
})



minetest.register_craft({
	type = "shapeless",
	output = "default:bronze_ingot 2",
	recipe = {"default:copper_ingot", "default:tin_ingot"},
})

minetest.register_craft({
	output = 'default:cobble_block',
	recipe = {
		{'default:cobble', 'default:cobble', 'default:cobble'},
		{'default:cobble', 'default:cobble', 'default:cobble'},
		{'default:cobble', 'default:cobble', 'default:cobble'},
	}
})

minetest.register_craft({
	output = 'default:cobble_baked 9',
	recipe = {
		{'default:cobble_block_baked'},
	}
})

minetest.register_craft({
	output = 'default:cobble_block_baked',
	recipe = {
		{'default:cobble_baked', 'default:cobble_baked', 'default:cobble_baked'},
		{'default:cobble_baked', 'default:cobble_baked', 'default:cobble_baked'},
		{'default:cobble_baked', 'default:cobble_baked', 'default:cobble_baked'},
	}
})

minetest.register_craft({
	output = 'default:cobble 9',
	recipe = {
		{'default:cobble_block'},
	}
})



minetest.register_craft({
	output = 'default:coalblock',
	recipe = {
		{'default:coal_lump', 'default:coal_lump', 'default:coal_lump'},
		{'default:coal_lump', 'default:coal_lump', 'default:coal_lump'},
		{'default:coal_lump', 'default:coal_lump', 'default:coal_lump'},
	}
})


minetest.register_craft({
	output = 'default:coal_lump 9',
	recipe = {
		{'default:coalblock'},
	}
})


minetest.register_craft({
	output = 'default:steelblock',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
	}
})


minetest.register_craft({
	output = 'default:steel_ingot 9',
	recipe = {
		{'default:steelblock'},
	}
})


minetest.register_craft({
	output = 'default:tinblock',
	recipe = {
		{'default:tin_ingot', 'default:tin_ingot', 'default:tin_ingot'},
		{'default:tin_ingot', 'default:tin_ingot', 'default:tin_ingot'},
		{'default:tin_ingot', 'default:tin_ingot', 'default:tin_ingot'},
	}
})


minetest.register_craft({
	output = 'default:tin_ingot 9',
	recipe = {
		{'default:tinblock'},
	}
})

minetest.register_craft({
	output = 'default:copperblock',
	recipe = {
		{'default:copper_ingot', 'default:copper_ingot', 'default:copper_ingot'},
		{'default:copper_ingot', 'default:copper_ingot', 'default:copper_ingot'},
		{'default:copper_ingot', 'default:copper_ingot', 'default:copper_ingot'},
	}
})


minetest.register_craft({
	output = 'default:copper_ingot 9',
	recipe = {
		{'default:copperblock'},
	}
})


minetest.register_craft({
	output = 'default:bronzeblock',
	recipe = {
		{'default:bronze_ingot', 'default:bronze_ingot', 'default:bronze_ingot'},
		{'default:bronze_ingot', 'default:bronze_ingot', 'default:bronze_ingot'},
		{'default:bronze_ingot', 'default:bronze_ingot', 'default:bronze_ingot'},
	}
})


minetest.register_craft({
	output = 'default:bronze_ingot 9',
	recipe = {
		{'default:bronzeblock'},
	}
})


minetest.register_craft({
	output = 'default:goldblock',
	recipe = {
		{'default:gold_ingot', 'default:gold_ingot', 'default:gold_ingot'},
		{'default:gold_ingot', 'default:gold_ingot', 'default:gold_ingot'},
		{'default:gold_ingot', 'default:gold_ingot', 'default:gold_ingot'},
	}
})


minetest.register_craft({
	output = 'default:gold_ingot 9',
	recipe = {
		{'default:goldblock'},
	}
})

minetest.register_craft({
	output = 'default:emerald_block',
	recipe = {
		{'default:emerald', 'default:emerald', 'default:emerald'},
		{'default:emerald', 'default:emerald', 'default:emerald'},
		{'default:emerald', 'default:emerald', 'default:emerald'},
	}
})


minetest.register_craft({
	output = 'default:emerald 9',
	recipe = {
		{'default:emerald_block'},
	}
})

minetest.register_craft({
	output = 'default:sapphire_block',
	recipe = {
		{'default:sapphire', 'default:sapphire', 'default:sapphire'},
		{'default:sapphire', 'default:sapphire', 'default:sapphire'},
		{'default:sapphire', 'default:sapphire', 'default:sapphire'},
	}
})


minetest.register_craft({
	output = 'default:sapphire 9',
	recipe = {
		{'default:sapphire_block'},
	}
})

minetest.register_craft({
	output = 'default:ruby_block',
	recipe = {
		{'default:ruby', 'default:ruby', 'default:ruby'},
		{'default:ruby', 'default:ruby', 'default:ruby'},
		{'default:ruby', 'default:ruby', 'default:ruby'},
	}
})


minetest.register_craft({
	output = 'default:ruby 9',
	recipe = {
		{'default:ruby_block'},
	}
})

minetest.register_craft({
	output = 'default:diamondblock',
	recipe = {
		{'default:diamond', 'default:diamond', 'default:diamond'},
		{'default:diamond', 'default:diamond', 'default:diamond'},
		{'default:diamond', 'default:diamond', 'default:diamond'},
	}
})

minetest.register_craft({
	output = 'default:diamond 9',
	recipe = {
		{'default:diamondblock'},
	}
})


minetest.register_craft({
	output = 'default:sandstone',
	recipe = {
		{'default:fertile_sand', 'default:fertile_sand'},
		{'default:fertile_sand', 'default:fertile_sand'},
	}
})


minetest.register_craft({
	output = 'default:fertile_sand 4',
	recipe = {
		{'default:sandstone'},
	}
})


minetest.register_craft({
	output = 'default:sandstonebrick 4',
	recipe = {
		{'default:sandstone', 'default:sandstone'},
		{'default:sandstone', 'default:sandstone'},
	}
})


minetest.register_craft({
	output = 'default:clay',
	recipe = {
		{'default:clay_lump', 'default:clay_lump'},
		{'default:clay_lump', 'default:clay_lump'},
	}
})


minetest.register_craft({
	output = 'default:brick',
	recipe = {
		{'default:clay_brick', 'default:clay_brick'},
		{'default:clay_brick', 'default:clay_brick'},
	}
})


minetest.register_craft({
	output = 'default:clay_brick 4',
	recipe = {
		{'default:brick'},
	}
})


minetest.register_craft({
	output = 'default:paper',
	recipe = {
		{'default:papyrus', 'default:papyrus', 'default:papyrus'},
	}
})


minetest.register_craft({
	output = 'default:book',
	recipe = {
		{'default:paper'},
		{'default:paper'},
		{'default:paper'},
	}
})


minetest.register_craft({
	output = 'default:bookshelf',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'default:book', 'default:book', 'default:book'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})


minetest.register_craft({
	output = 'default:ladder 2',
	recipe = {
		{'group:stick', 'default:nails', 'group:stick'},
		{'group:stick', 'group:stick', 'group:stick'},
		{'group:stick', 'default:nails', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:ladder_bronze 24',
	recipe = {
		{'default:bronze_ingot', 'default:steel_ingot', 'default:bronze_ingot'},
		{'default:bronze_ingot', 'default:bronze_ingot', 'default:bronze_ingot'},
		{'default:bronze_ingot', 'default:steel_ingot', 'default:bronze_ingot'},
	}
})


minetest.register_craft({
	output = 'default:mese',
	recipe = {
		{'default:mese_crystal', 'default:mese_crystal', 'default:mese_crystal'},
		{'default:mese_crystal', 'default:mese_crystal', 'default:mese_crystal'},
		{'default:mese_crystal', 'default:mese_crystal', 'default:mese_crystal'},
	}
})


minetest.register_craft({
	output = 'default:mese_crystal 9',
	recipe = {
		{'default:mese'},
	}
})


minetest.register_craft({
	output = 'default:mese_crystal_fragment 9',
	recipe = {
		{'default:mese_crystal'},
	}
})

-- 9 mese crystal fragments = 1 mese crystal
minetest.register_craft({
	output = "default:mese_crystal",
	recipe = {
		{"default:mese_crystal_fragment", "default:mese_crystal_fragment", "default:mese_crystal_fragment"},
		{"default:mese_crystal_fragment", "default:mese_crystal_fragment", "default:mese_crystal_fragment"},
		{"default:mese_crystal_fragment", "default:mese_crystal_fragment", "default:mese_crystal_fragment"},
	}
})

minetest.register_craft({
	output = 'default:obsidian_shard 9',
	recipe = {
		{'default:obsidian'}
	}
})


minetest.register_craft({
	output = 'default:obsidian',
	recipe = {
		{'default:obsidian_shard', 'default:obsidian_shard', 'default:obsidian_shard'},
		{'default:obsidian_shard', 'default:obsidian_shard', 'default:obsidian_shard'},
		{'default:obsidian_shard', 'default:obsidian_shard', 'default:obsidian_shard'},
	}
})

minetest.register_craft({
	output = 'default:obsidian_block',
	recipe = {
		{'default:obsidian', 'default:obsidian', 'default:obsidian'},
		{'default:obsidian', 'default:obsidian', 'default:obsidian'},
		{'default:obsidian', 'default:obsidian', 'default:obsidian'},
	}
})

minetest.register_craft({
	output = 'default:obsidian 9',
	recipe = {
		{'default:obsidian_block'}
	}
})

minetest.register_craft({
	output = 'default:stone_block_baked',
	recipe = {
		{'default:stone_baked', 'default:stone_baked', 'default:stone_baked'},
		{'default:stone_baked', 'default:stone_baked', 'default:stone_baked'},
		{'default:stone_baked', 'default:stone_baked', 'default:stone_baked'},
	}
})

minetest.register_craft({
	output = 'default:stone_baked 9',
	recipe = {
		{'default:stone_block_baked'}
	}
})

minetest.register_craft({
	output = 'default:essexite_block',
	recipe = {
		{'default:essexite', 'default:essexite', 'default:essexite'},
		{'default:essexite', 'default:essexite', 'default:essexite'},
		{'default:essexite', 'default:essexite', 'default:essexite'},
	}
})

minetest.register_craft({
	output = 'default:essexite 9',
	recipe = {
		{'default:essexite_block'}
	}
})

minetest.register_craft({
	output = 'default:marble_block',
	recipe = {
		{'default:marble', 'default:marble', 'default:marble'},
		{'default:marble', 'default:marble', 'default:marble'},
		{'default:marble', 'default:marble', 'default:marble'},
	}
})

minetest.register_craft({
	output = 'default:marble 9',
	recipe = {
		{'default:marble_block'}
	}
})

minetest.register_craft({
	output = 'default:tuff_block',
	recipe = {
		{'default:tuff', 'default:tuff', 'default:tuff'},
		{'default:tuff', 'default:tuff', 'default:tuff'},
		{'default:tuff', 'default:tuff', 'default:tuff'},
	}
})

minetest.register_craft({
	output = 'default:tuff 9',
	recipe = {
		{'default:tuff_block'}
	}
})

minetest.register_craft({
	output = 'default:tuff_baked_block',
	recipe = {
		{'default:tuff_baked', 'default:tuff_baked', 'default:tuff_baked'},
		{'default:tuff_baked', 'default:tuff_baked', 'default:tuff_baked'},
		{'default:tuff_baked', 'default:tuff_baked', 'default:tuff_baked'},
	}
})

minetest.register_craft({
	output = 'default:tuff_baked 9',
	recipe = {
		{'default:tuff_baked_block'}
	}
})

minetest.register_craft({
	output = 'default:chondrite_block',
	recipe = {
		{'default:chondrite', 'default:chondrite', 'default:chondrite'},
		{'default:chondrite', 'default:chondrite', 'default:chondrite'},
		{'default:chondrite', 'default:chondrite', 'default:chondrite'},
	}
})

minetest.register_craft({
	output = 'default:chondrite 9',
	recipe = {
		{'default:chondrite_block'}
	}
})

minetest.register_craft({
	output = 'default:ash_block',
	recipe = {
		{'default:ash', 'default:ash', 'default:ash'},
		{'default:ash', 'default:ash', 'default:ash'},
		{'default:ash', 'default:ash', 'default:ash'},
	}
})

minetest.register_craft({
	output = 'default:ash 9',
	recipe = {
		{'default:ash_block'}
	}
})

minetest.register_craft({
	output = 'default:gravel_block',
	recipe = {
		{'default:gravel', 'default:gravel', 'default:gravel'},
		{'default:gravel', 'default:gravel', 'default:gravel'},
		{'default:gravel', 'default:gravel', 'default:gravel'},
	}
})

minetest.register_craft({
	output = 'default:gravel 9',
	recipe = {
		{'default:gravel_block'}
	}
})

minetest.register_craft({
	output = 'default:gravel_volcanic_block',
	recipe = {
		{'default:gravel_volcanic', 'default:gravel_volcanic', 'default:gravel_volcanic'},
		{'default:gravel_volcanic', 'default:gravel_volcanic', 'default:gravel_volcanic'},
		{'default:gravel_volcanic', 'default:gravel_volcanic', 'default:gravel_volcanic'},
	}
})

minetest.register_craft({
	output = 'default:gravel_volcanic 9',
	recipe = {
		{'default:gravel_volcanic_block'}
	}
})



minetest.register_craft({
	output = 'default:stonebrick 4',
	recipe = {
		{'default:stone', 'default:stone'},
		{'default:stone', 'default:stone'},
	}
})


minetest.register_craft({
	output = 'default:stonebrick_baked 4',
	recipe = {
		{'default:stone_baked', 'default:stone_baked'},
		{'default:stone_baked', 'default:stone_baked'},
	}
})



--
-- Crafting (tool repair)
--
minetest.register_craft({
	type = "toolrepair",
	additional_wear = -0.02,
})


--
-- Cooking recipes
--


minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "default:glass",
	recipe = "default:fertile_sand",
})


minetest.register_craft({
	type = "cooking",
	cooktime = 25,
	output = "default:obsidian_glass",
	recipe = "default:obsidian_shard",
})


minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "default:stone",
	recipe = "default:cobble",
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "default:stone_baked",
	recipe = "default:cobble_baked",
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "default:cobble",
	recipe = "default:mossycobble",
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "default:steel_ingot",
	recipe = "default:iron_lump",
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "default:tin_ingot",
	recipe = "default:tin_lump",
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "default:copper_ingot",
	recipe = "default:copper_lump",
})


minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "default:gold_ingot",
	recipe = "default:gold_lump",
})


minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "default:clay_brick",
	recipe = "default:clay_lump",
})

minetest.register_craft({
	type = "cooking",
	cooktime = 15,
	output = "default:coal_lump 2",
	recipe = "group:tree",
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "default:stone_baked",
	recipe = "default:stone",
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "default:ash",
	recipe = "default:stone_baked",
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "default:ash",
	recipe = "default:tuff_baked",
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "default:tuff_baked",
	recipe = "default:tuff",
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "default:tuff",
	recipe = "default:mossytuff",
})


--
-- Fuels
--



minetest.register_craft({
	type = "fuel",
	recipe = "default:junglegrass",
	burntime = 2,
})



minetest.register_craft({
	type = "fuel",
	recipe = "default:cactus",
	burntime = 25,
})


minetest.register_craft({
	type = "fuel",
	recipe = "default:papyrus",
	burntime = 1,
})


minetest.register_craft({
	type = "fuel",
	recipe = "default:bookshelf",
	burntime = 20,
})


minetest.register_craft({
	type = "fuel",
	recipe = "default:ladder",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "group:wood",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:lava_source",
	burntime = 60,
})



minetest.register_craft({
	type = "fuel",
	recipe = "default:coal_lump",
	burntime = 35,
})


minetest.register_craft({
	type = "fuel",
	recipe = "default:coalblock",
	burntime = 350,
})


minetest.register_craft({
	type = "fuel",
	recipe = "default:grass_1",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:axe_wood",
	burntime = 10,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:sword_wood",
	burntime = 10,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:pick_wood",
	burntime = 10,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:shovel_wood",
	burntime = 10,
})

-- Hadesstuff

minetest.register_craft({
	output = 'farming:flowergrass',
	recipe = {
		{'flowers:dandelion_white', 'flowers:dandelion_yellow', 'flowers:geranium'},
		{'flowers:rose', 'flowers:tulip', 'flowers:viola'},
		{'default:grass_1', 'default:dirt', 'default:grass_1'},
	}
})

minetest.register_craft({
	output = 'farming:seed_tomato',
	recipe = {{'farming:tomato'},}
})

minetest.register_craft({
	output = 'farming:seed_strawberry',
	recipe = {{'farming:strawberry'},}
})

minetest.register_craft({
	output = 'farming:seed_potato',
	recipe = {{'farming:potato'},}
})

minetest.register_craft({
	output = 'farming:seed_spice',
	recipe = {{'farming:spice'},}
})

minetest.register_craft({
	output = 'default:nails 24',
	recipe = {{'default:steel_ingot'},}
})

-- gemtransform
minetest.register_craft({
	output = 'default:emerald 2',
	recipe = {{'default:sapphire'},}
})

minetest.register_craft({
    type = "shapeless",
	output = 'default:sapphire',
	recipe = {'default:emerald', 'default:emerald'},
})

minetest.register_craft({
	output = 'default:sapphire 2',
	recipe = {{'default:ruby'},}
})

minetest.register_craft({
	output = 'default:ruby 2',
	recipe = {{'default:diamond'},}
})

minetest.register_craft({
	output = 'default:diamond',
	recipe = {{'default:ruby', 'default:ruby'},}
})

minetest.register_craft({
    type = "shapeless",
	output = 'default:ruby',
	recipe = {'default:sapphire', 'default:sapphire'},
})

minetest.register_craft({
	output = 'default:dirt 3',
	recipe = {
		{'group:leaves', 'group:leaves', 'group:leaves'},
		{'group:leaves', 'group:leaves', 'group:leaves'},
		{'group:leaves', 'group:leaves', 'group:leaves'},
	}
})
minetest.register_craft({
    type = "shapeless",
	output = 'default:fertile_sand 2',
	recipe = {'default:cobble', 'default:ash'},
})

minetest.register_craft({
    type = "shapeless",
	output = 'default:fertile_sand 2',
	recipe = {'default:mossycobble', 'default:ash'},
})

minetest.register_craft({
    type = "shapeless",
	output = 'default:fertile_sand 2',
	recipe = {'default:tuff', 'default:ash'},
})

minetest.register_craft({
    type = "shapeless",
	output = 'default:fertile_sand 2',
	recipe = {'default:mossytuff', 'default:ash'},
})

minetest.register_craft({
	output = 'default:grass_1',
	recipe = {
	    {'default:mossycobble', '', ''},
		{'default:mossycobble', '', ''},
		{'default:dirt', '', ''},
	}
})

minetest.register_craft({
	output = 'default:grass_1',
	recipe = {
	    {'default:mossytuff', '', ''},
		{'default:mossytuff', '', ''},
		{'default:dirt', '', ''},
	}
})

minetest.register_craft({
	output = 'default:junglegrass',
	recipe = {
		{'default:grass_1', '', ''},
		{'default:dirt', '', ''},
	}
})

minetest.register_craft({
	output = 'default:papyrus',
	recipe = {
		{'default:junglegrass', '', ''},
		{'default:dirt', '', ''},
	}
})

minetest.register_craft({
	output = 'default:cactus',
	recipe = {
		{'', 'default:papyrus', ''},
		{'default:ash', 'default:dirt', 'default:ash'},
	}
})

-- HadesFood

minetest.register_craft({
	output = 'default:sugar',
	recipe = {
		{'default:sugarcane', 'default:sugarcane', 'default:sugarcane'},
	}
})

minetest.register_craft({
	output = 'default:pie_strawberry_raw',
	recipe = {
		{'', 'default:sugar', ''},
        {'farming:strawberry', 'farming:strawberry', 'farming:strawberry'},
        {'default:sugar', 'farming:flour', 'default:sugar'},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "default:pie_strawberry",
	recipe = "default:pie_strawberry_raw",
	cooktime = 10,
})

minetest.register_craft({
	output = 'default:pie_apple_raw',
	recipe = {
		{'', 'default:sugar', ''},
        {'hades_trees:apple', 'hades_trees:apple', 'hades_trees:apple'},
        {'default:sugar', 'farming:flour', 'default:sugar'},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "default:pie_apple",
	recipe = "default:pie_apple_raw",
	cooktime = 10,
})

minetest.register_craft({
	output = 'default:bottle_olive_oil',
	recipe = {
		{'hades_trees:olive', 'hades_trees:olive', 'hades_trees:olive'},
        {'', 'vessels:glass_bottle', ''},
	}
})

minetest.register_craft({
	output = 'default:tomatosalad 2',
	recipe = {
	    {'farming:spice', 'default:bottle_olive_oil', 'farming:spice'},
		{'farming:tomato', 'farming:tomato', 'farming:tomato'},
		{'default:plate', 'farming:bread', 'default:plate'},
	}
})

minetest.register_craft({
    type = "shapeless",
	output = 'default:tomato_potato_salad',
	recipe = {'default:tomatosalad', 'default:baked_potato'},
})

minetest.register_craft({
    type = "shapeless",
	output = 'default:spiced_potato',
	recipe = {'farming:spice', 'farming:potato'},
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "default:baked_potato",
	recipe = "default:spiced_potato",
})

minetest.register_craft({
	output = 'default:plate 10',
	recipe = {
		{'', 'default:clay', ''},
        {'default:clay', 'default:clay', 'default:clay'},
		{'', 'default:clay', ''},
	}
})


-- New Bricks

minetest.register_craft({
	output = 'default:cactus_block',
	recipe = {
		{'default:cactus', 'default:cactus', 'default:cactus'},
		{'default:cactus', 'default:cactus', 'default:cactus'},
		{'default:cactus', 'default:cactus', 'default:cactus'},
	}
})

minetest.register_craft({
	output = 'default:cactus 9',
	recipe = {
		{'default:cactus_block'},
	}
})

minetest.register_craft({
	output = 'default:cactus_brick 4',
	recipe = {
		{'default:cactus', 'default:cactus'},
		{'default:cactus', 'default:cactus'},
	}
})

minetest.register_craft({
	output = 'default:obsidianbrick 4',
	recipe = {
		{'default:obsidian', 'default:obsidian'},
		{'default:obsidian', 'default:obsidian'}
	}
})


minetest.register_craft({
	output = 'default:chondrite_brick 4',
	recipe = {
		{'default:chondrite', 'default:chondrite'},
		{'default:chondrite', 'default:chondrite'},
	}
})

minetest.register_craft({
	output = 'default:essexite_brick 4',
	recipe = {
		{'default:essexite', 'default:essexite'},
		{'default:essexite', 'default:essexite'},
	}
})

minetest.register_craft({
	output = 'default:marble_brick 4',
	recipe = {
		{'default:marble', 'default:marble'},
		{'default:marble', 'default:marble'},
	}
})

minetest.register_craft({
	output = 'default:tuff_brick 4',
	recipe = {
		{'default:tuff', 'default:tuff'},
		{'default:tuff', 'default:tuff'},
	}
})

minetest.register_craft({
	output = 'default:tuff_baked_brick 4',
	recipe = {
		{'default:tuff_baked', 'default:tuff_baked'},
		{'default:tuff_baked', 'default:tuff_baked'},
	}
})
-- floors

minetest.register_craft({
	output = 'default:floor_chondrite_stone 4',
	recipe = {
		{'default:stone', 'default:chondrite'},
		{'default:chondrite', 'default:stone'},
	}
})

minetest.register_craft({
	output = 'default:floor_chondrite_stone2 4',
	recipe = {
		{'default:chondrite', 'default:stone'},
		{'default:stone', 'default:chondrite'},
	}
})

minetest.register_craft({
	output = 'default:floor_bstone_stone 4',
	recipe = {
		{'default:stone', 'default:stone_baked'},
		{'default:stone_baked', 'default:stone'},
	}
})

minetest.register_craft({
	output = 'default:floor_btuff_tuff 4',
	recipe = {
		{'default:tuff', 'default:tuff_baked'},
		{'default:tuff_baked', 'default:tuff'},
	}
})

minetest.register_craft({
	output = 'default:floor_bstone_sandstone 4',
	recipe = {
		{'default:stone_baked', 'default:sandstone'},
		{'default:sandstone', 'default:stone_baked'},
	}
})

minetest.register_craft({
	output = 'default:floor_bstone_sandstone2 4',
	recipe = {
		{'default:sandstone', 'default:stone_baked'},
		{'default:stone_baked', 'default:sandstone'},
	}
})

minetest.register_craft({
	output = 'default:floor_marble_essexite 4',
	recipe = {
		{'default:marble', 'default:essexite'},
		{'default:essexite', 'default:marble'},
	}
})

minetest.register_craft({
	output = 'default:floor_marble_essexite2 4',
	recipe = {
		{'default:essexite', 'default:marble'},
		{'default:marble', 'default:essexite'},
	}
})

minetest.register_craft({
	output = 'default:floor_essexite_gold 3',
	recipe = {
		{'default:essexite', 'default:essexite'},
		{'default:essexite', 'default:gold_ingot'},
	}
})

minetest.register_craft({
	output = 'default:floor_essexite_gold2 3',
	recipe = {
		{'default:gold_ingot', 'default:essexite'},
		{'default:essexite', 'default:essexite'},
	}
})

-- Color Bricks

minetest.register_craft({
	output = 'default:brick_black',
	recipe = {
		{'group:claybricks', 'dye:black'},
	}
})

minetest.register_craft({
	output = 'default:brick_blue',
	recipe = {
		{'group:claybricks', 'dye:blue'},
	}
})

minetest.register_craft({
	output = 'default:brick_brown',
	recipe = {
		{'group:claybricks', 'dye:brown'},
	}
})

minetest.register_craft({
	output = 'default:brick_cyan',
	recipe = {
		{'group:claybricks', 'dye:cyan'},
	}
})

minetest.register_craft({
	output = 'default:brick_dark_green',
	recipe = {
		{'group:claybricks', 'dye:dark_green'},
	}
})

minetest.register_craft({
	output = 'default:brick_dark_grey',
	recipe = {
		{'group:claybricks', 'dye:dark_grey'},
	}
})

minetest.register_craft({
	output = 'default:brick_green',
	recipe = {
		{'group:claybricks', 'dye:green'},
	}
})

minetest.register_craft({
	output = 'default:brick_grey',
	recipe = {
		{'group:claybricks', 'dye:grey'},
	}
})

minetest.register_craft({
	output = 'default:brick_magenta',
	recipe = {
		{'group:claybricks', 'dye:magenta'},
	}
})

minetest.register_craft({
	output = 'default:brick_orange',
	recipe = {
		{'group:claybricks', 'dye:orange'},
	}
})

minetest.register_craft({
	output = 'default:brick_pink',
	recipe = {
		{'group:claybricks', 'dye:pink'},
	}
})

minetest.register_craft({
	output = 'default:brick_red',
	recipe = {
		{'group:claybricks', 'dye:red'},
	}
})

minetest.register_craft({
	output = 'default:brick_violet',
	recipe = {
		{'group:claybricks', 'dye:violet'},
	}
})

minetest.register_craft({
	output = 'default:brick_white',
	recipe = {
		{'group:claybricks', 'dye:white'},
	}
})

minetest.register_craft({
	output = 'default:brick_yellow',
	recipe = {
		{'group:claybricks', 'dye:yellow'},
	}
})

minetest.register_craft({
	output = 'default:lamp_wall 2',
	recipe = {
		{'default:glass', '', ''},
		{'hades_torches:torch', '', ''},
		{'default:glass', '', ''},
	}
})

minetest.register_craft({
	output = 'default:latern 2',
	recipe = {
		{'', 'default:bronze_ingot', ''},
		{'default:glass', 'hades_torches:torch', 'default:glass'},
		{'', 'default:bronze_ingot', ''},
	}
})

minetest.register_craft({
	output = 'default:laternrusty 2',
	recipe = {
		{'', 'default:steel_ingot', ''},
		{'default:glass', 'hades_torches:torch', 'default:glass'},
		{'', 'default:steel_ingot', ''},
	}
})


