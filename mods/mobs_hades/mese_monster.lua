local S = minetest.get_translator("mobs_hades")

-- Mese monster
local mese_monster = {
	type = "monster",
	hp_min = 20,
	hp_max = 30,
	collisionbox = {-0.5, -1.5, -0.5, 0.5, 0.5, 0.5},
	visual = "mesh",
	mesh = "zmobs_mese_monster.x",
	textures = {"zmobs_mese_monster.png"},
	visual_size = {x=1, y=1},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_mesemonster",
		attack = "mobs_mesemonster",
	},
	view_range = 16,
	walk_velocity = 0.5,
	run_velocity = 2,
	damage = 3,
	drops = {
		{name = "hades_core:mese_crystal",
		chance = 9,
		min = 1,
		max = 3,},
		{name = "hades_core:mese_crystal_fragment",
		chance = 1,
		min = 1,
		max = 9,},
	},
	armor = 80,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	attack_type = "shoot",
	arrow = "mobs_hades:mese_arrow",
	shoot_interval = .5,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 14,
		walk_start = 15,
		walk_end = 38,
		run_start = 40,
		run_end = 63,
		punch_start = 15, -- 40
		punch_end = 38, -- 63
	},
	jump = true,
	step = 0.5,
	shoot_offset = 2,
	blood_texture = "default_mese_crystal_fragment.png",
	pathfinding = 1,
}
mobs:register_mob("mobs_hades:mese_monster", mese_monster)

-- Deep mese monster

local deep_mese_monster = table.copy(mese_monster)
deep_mese_monster.hp_min = 30
deep_mese_monster.hp_max = 45
mobs:register_mob("mobs_hades:deep_mese_monster", deep_mese_monster)


mobs:spawn_specific("mobs_hades:mese_monster", {"hades_core:stone"}, "air", 0, 4, 70, 7000, 1, -10000, -250)
mobs:spawn_specific("mobs_hades:deep_mese_monster", {"hades_core:stone"}, "air", 0, 4, 70, 7000, 1, -30000, -5000)

mobs:register_egg("mobs_hades:mese_monster", S("Mese Monster Spawn Egg"), "default_mese_block.png", 1, false)
mobs:register_egg("mobs_hades:deep_mese_monster", S("Deep Mese Monster Spawn Egg"), "default_mese_block.png^[colorize:#000000:65", 1, false)

-- Mese Monster Crystal Shards (weapon)

mobs:register_arrow("mobs_hades:mese_arrow", {
	visual = "sprite",
	visual_size = {x=.5, y=.5},
	textures = {"default_mese_crystal_fragment.png"},
	velocity = 5,
	
	hit_player = function(self, player)
		local s = self.object:get_pos()
		local p = player:get_pos()

		player:punch(self.object, 1.0,  {
			full_punch_interval=1.0,
			damage_groups = {fleshy=1},
		})
	end,
	
	hit_node = function(self, pos, node)
	end
})
