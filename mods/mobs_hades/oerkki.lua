
-- Oerkki

mobs:register_mob("mobs_hades:oerkki", {
	type = "monster",
	hp_min = 10,
	hp_max = 15,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.9, 0.4},
	visual = "mesh",
	mesh = "mobs_oerkki.x",
	textures = {"mobs_oerkki.png"},
	visual_size = {x=5, y=5},
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_oerkki",
		attack = "mobs_oerkki",
	},
	view_range = 16,
	walk_velocity = 1,
	run_velocity = 3,
	damage = 4,
	drops = {
		{name = "hades_core:obsidian",
		chance = 3,
		min = 1,
		max = 2,},
		{name = "hades_core:gold_lump",
		chance = 5,
		min = 1,
		max = 2,},
	},
	armor = 100,
	drawtype = "front",
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
	attack_type = "dogfight",
	animation = {
		stand_start = 0,
		stand_end = 23,
		walk_start = 24,
		walk_end = 36,
		run_start = 37,
		run_end = 49,
		punch_start = 37,
		punch_end = 49,
		speed_normal = 15,
		speed_run = 15,
	},
	jump = true,
	step = 0.5,
	blood_texture = "mobs_blood.png",
	floats = 1,
	pathfinding = 1,
})
mobs:register_spawn("mobs_hades:oerkki", {"hades_core:stone"}, 0, -1, 10000, 2, -1200)
mobs:register_spawn("mobs_hades:oerkki", {"hades_core:stone"}, 1, -1, 10000, 3, -10000)

mobs:register_egg("mobs_hades:oerkki", "Oerkki Spawn Egg", "default_obsidian.png", 1, false)
