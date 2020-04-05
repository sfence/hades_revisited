
-- Cave Master
-- (This one spits out fireballs at you)

local cave_master = {
	type = "monster",
	hp_min = 25,
	hp_max = 35,
	collisionbox = {-0.7, -0.01, -0.7, 0.7, 2.6, 0.7},
	visual = "mesh",
	mesh = "mobs_dungeon_master.x",
	textures = {"mobs_dungeon_master.png"},
	visual_size = {x=8, y=8},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_dungeonmaster",
		attack = "mobs_fireball",
	},
	view_range = 24,
	walk_velocity = 1,
	run_velocity = 3,
	damage = 4,
	drops = {
		{name = "hades_core:mese_crystal_fragment",
		chance = 1,
		min = 1,
		max = 3,},
		{name = "hades_core:diamond",
		chance = 4,
		min = 1,
		max = 1,},
		{name = "hades_core:mese_crystal",
		chance = 2,
		min = 1,
		max = 2,},
		{name = "hades_core:mese",
		chance = 30,
		min = 1,
		max = 1,},
	},
	armor = 60,
	drawtype = "front",
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "shoot",
	arrow = "mobs_hades:fireball",
	shoot_interval = 2.5,
	animation = {
		stand_start = 0,
		stand_end = 19,
		walk_start = 20,
		walk_end = 35,
		punch_start = 36,
		punch_end = 48,
		speed_normal = 15,
		speed_run = 15,
	},
	jump = true,
	step = 0.5,
	shoot_offset = 0,
	blood_texture = "mobs_blood.png",
	floats = 1,
	pathfinding = 1,
}
mobs:register_mob("mobs_hades:cave_master", cave_master)
mobs:spawn_specific("mobs_hades:cave_master", {"hades_core:stone"}, "air", 0, 1, 100, 7000, 1, -30000, -1000)

local cave_elder = table.copy(cave_master)
cave_elder.hp_min = 40
cave_elder.hp_max = 50
cave_elder.shoot_interval = 2.0
cave_elder.collisionbox = {-0.875, -0.01, -0.875, 0.875, 3.250, 0.875}
cave_elder.visual_size = {x=10, y=10}
cave_elder.textures = {"mobs_dungeon_master5.png"}
cave_elder.drops = {
	{name = "hades_core:mese_crystal_fragment",
	chance = 1,
	min = 2,
	max = 6,},
	{name = "hades_core:diamond",
	chance = 3,
	min = 1,
	max = 1,},
	{name = "hades_core:mese_crystal",
	chance = 2,
	min = 2,
	max = 4,},
	{name = "hades_core:mese",
	chance = 20,
	min = 1,
	max = 1,},
},

mobs:register_mob("mobs_hades:cave_elder", cave_elder)
mobs:spawn_specific("mobs_hades:cave_elder", {"hades_core:stone"}, "air", 0, 1, 100, 10000, 1, -30000, -7500)

mobs:register_egg("mobs_hades:cave_master", "Cave Master Spawn Egg", "mobs_chicken_egg_overlay.png^[colorize:#5D3000:228", 1, false)
mobs:register_egg("mobs_hades:cave_elder", "Cave Elder Spawn Egg", "mobs_chicken_egg_overlay.png^[colorize:#2D1000:228", 1, false)

-- Fireball (weapon)

mobs:register_arrow("mobs_hades:fireball", {
	visual = "sprite",
	visual_size = {x=1, y=1},
	textures = {"mobs_fireball.png"},
	velocity = 5,

	-- direct hit, no fire... just plenty of pain
	hit_player = function(self, player)
		local s = self.object:get_pos()
		local p = player:get_pos()
		player:punch(self.object, 1.0,  {
			full_punch_interval=1.0,
			damage_groups = {fleshy=8},
		}, 0) -- {x=s.x-p.x, y=s.y-p.y, z=s.z-p.z})
	end,

	-- node hit, bursts into flame (cannot blast through obsidian)
	hit_node = function(self, pos, node)

		for dx=-1,1 do
			for dy=-1,1 do
				for dz=-1,1 do
					local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = minetest.get_node(p).name
					local def = minetest.registered_nodes[n]
					if def and def.on_blast then
						minetest.registered_nodes[n].on_blast(pos, 5)
					else
						minetest.set_node(p, {name="air"})
					end
				end
			end
		end
	end
})
