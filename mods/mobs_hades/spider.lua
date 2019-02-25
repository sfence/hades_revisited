-- Spiders (based on Glowtest)

local spider = {
	type = "monster",
	hp_min = 20,
	hp_max = 25,
	collisionbox = {-0.9, -0.01, -0.7, 0.7, 0.6, 0.7},
	textures = {"mobs_spider.png"},
	visual_size = {x=7,y=7},
	visual = "mesh",
	mesh = "mobs_spider.x",
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_spider",
		attack = "mobs_spider",
	},
	view_range = 16,
	walk_velocity = 1,
	run_velocity = 3,
	armor = 100,
	damage = 3,
	replace_rate = 15000,
	replace_what = {"air"},
	replace_with = "mobs_hades:cobweb",
	drops = {
		{name = "farming:string",
		chance = 1,
		min = 1,
		max = 5,},
		{name = "farming:string",
		chance = 15,
		min = 2,
		max = 6,},
	},
	drawtype = "front",
	water_damage = 5,
	lava_damage = 5,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogfight",
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 1,
		stand_end = 1,
		walk_start = 20,
		walk_end = 40,
		run_start = 20,
		run_end = 40,
		punch_start = 50,
		punch_end = 90,
	},
	jump = true,
	step = 1,
	floats = 1,
	pathfinding = 1,
}
mobs:register_mob("mobs_hades:spider_gold", spider)

local spider2 = table.copy(spider)
spider2.hp_min = 30
spider2.hp_max = 40
spider2.textures = { "mobs_spider2.png" }
mobs:register_mob("mobs_hades:spider_sapphire", spider2)


local spider3 = table.copy(spider)
spider3.hp_min = 40
spider3.hp_max = 50
spider3.textures = { "mobs_spider3.png" }
mobs:register_mob("mobs_hades:spider_ruby", spider3)

local spider4 = table.copy(spider)
spider4.hp_min = 50
spider4.hp_max = 75
spider4.textures = { "mobs_spider4.png" }
mobs:register_mob("mobs_hades:spider_mese", spider4)


mobs:spawn_specific("mobs_hades:spider_gold", {"default:tuff", "default:stone"}, "air", 0, 4, 50, 7000, 1, -100, 31000)
mobs:spawn_specific("mobs_hades:spider_sapphire", {"default:tuff", "default:stone"}, "air", 0, 4, 50, 7000, 1, -7500, -100)
mobs:spawn_specific("mobs_hades:spider_ruby", {"default:tuff", "default:stone"}, "air", 0, 4, 50, 7000, 1, -15000, -5000)
mobs:spawn_specific("mobs_hades:spider_mese", {"default:tuff", "default:stone"}, "air", 0, 4, 50, 7000, 1, -30000, -10000)

-- Cobweb
minetest.register_node("mobs_hades:cobweb", {
	description = "Cobweb",
	drawtype = "plantlike",
	visual_scale = 1.1,
	tiles = {"mobs_cobweb.png"},
	inventory_image = "mobs_cobweb.png",
	paramtype = "light",
	sunlight_propagates = true,
	liquid_viscosity = 11,
	liquidtype = "source",
	liquid_alternative_flowing = "mobs_hades:cobweb",
	liquid_alternative_source = "mobs_hades:cobweb",
	liquid_renewable = false,
	liquid_range = 0,
	walkable = false,
	groups = {snappy=2,liquid=3,disable_jump=1,fake_liquid=1},
	drop = "farming:cotton",
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craft({
	output = "mobs_hades:cobweb",
	recipe = {
		{"farming:string", "farming:string", "farming:string"},
		{"farming:string", "farming:string", "farming:string"},
		{"farming:string", "farming:string", "farming:string"},
	}
})

mobs:register_egg("mobs_hades:spider_gold", "Gold Spider Spawn Egg", "default_gold_block.png", 1, false)
mobs:register_egg("mobs_hades:spider_sapphire", "Sapphire Spider Spawn Egg", "default_sapphire_block.png", 1, false)
mobs:register_egg("mobs_hades:spider_ruby", "Ruby Spider Spawn Egg", "default_ruby_block.png", 1, false)
mobs:register_egg("mobs_hades:spider_mese", "Mese Spider Spawn Egg", "default_mese_block.png^[brighten", 1, false)
