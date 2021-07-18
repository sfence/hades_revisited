--Dripping Water Mod
--by kddekadenz

-- License of code, textures & sounds: CC0

--Drop entities

local GRAVITY = -(tonumber(minetest.settings:get("movement_gravity")) or 10)

minetest.register_entity("drippingwater:drop_water", {
	hp_max = 2,
	physical = true,
	collide_with_objects = false,
	collisionbox = { -0.025, -0.05, -0.025, 0.025, -0.01, 0.025 },
	pointable = false,
	visual = "cube",
	visual_size = {x=0.05, y=0.1},
	textures = {"default_water.png","default_water.png","default_water.png","default_water.png", "default_water.png","default_water.png"},
	spritediv = {x=1, y=1},
	initial_sprite_basepos = {x=0, y=0},
	static_save = false,

	on_activate = function(self, staticdata)
		self.object:set_sprite({x=0,y=0}, 1, 1, true)
		self.object:set_armor_groups({immortal=1})
	end,

	on_step = function(self, dtime)
		local ownpos = self.object:get_pos()

		local falling = false
		local acc = self.object:get_acceleration()
		if acc.y < -0.01 then
			falling = true
		end

		if not falling then
			local k = math.random(1,222)
			if k==1 then
				self.object:set_acceleration({x=0, y=GRAVITY, z=0})
			else
				local n_above = minetest.get_node({x=ownpos.x, y=ownpos.y+0.5, z=ownpos.z})
				local d_above = minetest.registered_nodes[n_above.name]
				if not d_above then
					self.object:remove()
					return
				end
				if not d_above.walkable then
					self.object:set_acceleration({x=0, y=GRAVITY, z=0})
				end
			end
		end
	
		local n_below = minetest.get_node({x=ownpos.x, y=ownpos.y -0.5, z=ownpos.z})
		local d_below = minetest.registered_nodes[n_below.name]
		if not d_below then
			self.object:remove()
			return
		end
		if d_below.walkable or d_below.liquidtype ~= "none" then
			self.object:remove()
			local snd, gain = "drippingwater_drip", 0.5
			local n_here = minetest.get_node(ownpos)
			if minetest.get_item_group(n_below.name, "water") ~= 0 or
					minetest.get_item_group(n_here.name, "water") ~= 0 then
				snd, gain = "drippingwater_drip_on_water", 0.5
			elseif minetest.get_item_group(n_below.name, "lava") ~= 0 or
					minetest.get_item_group(n_here.name, "lava") ~= 0 then
				snd, gain = "drippingwater_drip_on_lava", 0.2
			end
			minetest.sound_play({name=snd}, {pos = ownpos, gain = gain, max_hear_distance = 8}, true)
		end
	end,
})

--Create drop

minetest.register_abm({
	label = "Spawn water droplets",
	nodenames = {"group:porous"},
	neighbors = {"group:water"},
        interval = 2,
        chance = 22,
        action = function(pos)
		if minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name == "air" and 
				minetest.get_node({x=pos.x, y=pos.y-2, z=pos.z}).name == "air" then
			local i = math.random(-45,45) / 100
			minetest.add_entity({x=pos.x + i, y=pos.y-0.501, z=pos.z + i}, "drippingwater:drop_water")
		end
        end,
})

