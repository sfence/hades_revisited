-- Stone monster and deep stone monster

local stone_monster = {
	type = "monster",
	hp_min = 15,
	hp_max = 25,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.9, 0.4},
	visual = "mesh",
	mesh = "mobs_stone_monster.x",
	textures = {"mobs_stone_monster.png"},
	visual_size = {x=3, y=2.6},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_stonemonster",
		attack = "mobs_stonemonster",
		hurt = "default_node_dig",
		die = "default_node_dug",
	},
	view_range = 10,
	walk_velocity = 0.5,
	run_velocity = 2,
	damage = 3,
	drops = {
		{name = "default:stone",
		chance = 2,
		min = 3,
		max = 5,},
		{name = "default:chondrite",
		chance=3,
		min=1,
		max=2,},
		{name = "default:coal_lump",
		chance=5,
		min=1,
		max=3,},
	},
	armor = 80,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	attack_type = "dogfight",
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 14,
		walk_start = 15,
		walk_end = 38,
		run_start = 40,
		run_end = 63,
		punch_start = 40,
		punch_end = 63,
	},
	jump = true,
	step = 0.5,
	blood_amount = 0,
	pathfinding = 1,
}
mobs:register_mob("mobs_hades:stone_monster", stone_monster)
mobs:spawn_specific("mobs_hades:stone_monster", {"default:stone", "default:mossystone"}, "air", 0, 3, 90, 7000, 1, -5000, -50)

-- Deep stone monster
local deep_stone_monster = table.copy(stone_monster)

deep_stone_monster.hp_min = 25
deep_stone_monster.hp_max = 35
deep_stone_monster.damage = 5
deep_stone_monster.walk_velocity = 0.4
deep_stone_monster.textures = {"mobs_stone_monster2.png"}
deep_stone_monster.view_range = 20

mobs:register_mob("mobs_hades:deep_stone_monster", deep_stone_monster)

mobs:spawn_specific("mobs_hades:deep_stone_monster", {"default:stone", "default:mossystone", "default:chondrite", "default:essexite"}, "air", 0, 3, 90, 7000, 1, -5000, -2500)
mobs:spawn_specific("mobs_hades:deep_stone_monster", {"default:stone", "default:mossystone", "default:chondrite", "default:essexite"}, "air", 0, 3, 90, 7000, 1, -30000, -5000)

mobs:register_egg("mobs_hades:stone_monster", "Stone Monster Spawn Egg", "default_stone.png", 1, false)
mobs:register_egg("mobs_hades:deep_stone_monster", "Deep Stone Monster Spawn Egg", "default_stone.png^[colorize:#000000:127", 1, false)
