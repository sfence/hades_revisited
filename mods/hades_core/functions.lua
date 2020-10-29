-- This file registers ABMs

--
-- Lava cooling
--

local cool_lava_source = function(pos)
	if minetest.find_node_near(pos, 5, {"hades_core:water_flowing"}) == nil then
		minetest.sound_play({name="fire_extinguish_flame", gain = 0.2}, {pos=pos, max_hear_distance = 16}, true)
		minetest.set_node(pos, {name="hades_core:tuff"})
	else
		if minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "air" then
			minetest.sound_play({name="fire_extinguish_flame", gain = 0.05}, {pos=pos, max_hear_distance = 6}, true)
		end
		minetest.set_node(pos, {name="hades_core:water_source"})
	end
end

local cool_lava_flowing = function(pos)
	minetest.sound_play({name="fire_extinguish_flame", gain = 0.2}, {pos=pos, max_hear_distance = 16}, true)
	minetest.set_node(pos, {name="hades_core:gravel_volcanic"})
end

minetest.register_abm({
	label = "Cool flowing lava",
	nodenames = {"hades_core:lava_flowing"},
	neighbors = {"group:water"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		cool_lava_flowing(pos, node, active_object_count, active_object_count_wider)
	end,
})


minetest.register_abm({
	label = "Cool lava source",
	nodenames = {"hades_core:lava_source"},
	neighbors = {"group:water"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		cool_lava_source(pos, node, active_object_count, active_object_count_wider)
	end,
})

--
-- Stone transformation
--

minetest.register_abm({
	label = "Burn stone",
	nodenames = {"hades_core:stone", "hades_core:mossystone"},
	neighbors = {"group:lava"},
	interval = 25,
	chance = 15,
	action = function(pos, node)
		local nn
		if node.name == "hades_core:mossystone" then
			nn = "hades_core:stone"
		else
			nn = "hades_core:stone_baked"
		end
		minetest.set_node(pos, {name=nn})
	end,
})

minetest.register_abm({
	label = "Create mossy stone",
	nodenames = {"hades_core:stone"},
	interval = 600,
	chance = 65,
	action = function(pos, node)
		if minetest.find_node_near(pos, 2, {"group:water"}) == nil then
			return
		else
			minetest.set_node(pos, {name="hades_core:mossystone"})
		end
	end,
})

--
-- Tuff transformation
--

minetest.register_abm({
	label = "Burn tuff",
	nodenames = {"hades_core:tuff", "hades_core:mossytuff"},
	neighbors = {"group:lava"},
	interval = 25,
	chance = 15,
	action = function(pos, node)
		local nn = "hades_core:tuff_baked"
		if node.name == "hades_core:mossytuff" then
			minetest.set_node(pos, {name="hades_core:tuff"})
		else
			minetest.set_node(pos, {name="hades_core:tuff_baked"})
		end
	end,
})

minetest.register_abm({
	label = "Grow moss on tuff",
	nodenames = {"hades_core:tuff"},
	interval = 600,
	chance = 65,
	action = function(pos, node)
		if minetest.find_node_near(pos, 2, {"group:water"}) == nil then
			return
		else
			minetest.set_node(pos, {name="hades_core:mossytuff"})
		end
	end,
})

--
-- Create marble
-- Requirements: chondrite at Y <= -500 next to water and lava is within reach of 4 nodes
--

minetest.register_abm({
	label = "Create marble",
	nodenames = {"hades_core:chondrite"},
	neighbors = {"group:water"},
	interval = 171,
	chance = 55,
	action = function(pos, node)
		if minetest.find_node_near(pos, 4, {"group:lava"}) == nil or pos.y > -500 then
			return
		else
			minetest.set_node(pos, {name="hades_core:marble"})
		end
	end,
})


--
-- Create obsidian
-- Requirements: Volcanic gravel at Y <= -1000 next to lava and water is within reach of 4 nodes
--

minetest.register_abm({
	label = "Create obsidian",
	nodenames = {"hades_core:gravel_volcanic"},
	neighbors = {"group:lava"},
	interval = 180,
	chance = 65,
	action = function(pos, node)
		if minetest.find_node_near(pos, 4, {"group:water"}) == nil or pos.y > -1000 then
			return
		else
			minetest.set_node(pos, {name="hades_core:obsidian"})
		end
	end,
})

--
-- Cobble transformation
--

minetest.register_abm({
	label = "Grow moss on cobblestone (neighboring water)",
	nodenames = {"hades_core:cobble"},
	neighbors = {"group:water"},
	interval = 500,
	chance = 35,
	action = function(pos, node)
		minetest.set_node(pos, {name="hades_core:mossycobble"})
	end,
})

minetest.register_abm({
	label = "Grow moss on cobblestone (extended water check)",
	nodenames = {"hades_core:cobble"},
	interval = 500,
	chance = 55,
	action = function(pos, node)
		if minetest.find_node_near(pos, 2, {"group:water"}) == nil then
			return
		else
			minetest.set_node(pos, {name="hades_core:mossycobble"})
		end
	end,
})

-- Dirt ABMs
minetest.register_abm({
	label = "Grow grass on dirt",
	nodenames = {"hades_core:dirt"},
	interval = 2,
	chance = 200,
	action = function(pos, node)
		local above = {x=pos.x, y=pos.y+1, z=pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if nodedef and (nodedef.sunlight_propagates or nodedef.paramtype == "light")
				and nodedef.liquidtype == "none"
				and (minetest.get_node_light(above) or 0) >= 13 then
			minetest.set_node(pos, {name = "hades_core:dirt_with_grass"})
		end
	end
})

minetest.register_abm({
	label = "Turn covered 'dirt with grass' back to dirt",
	nodenames = {"hades_core:dirt_with_grass"},
	interval = 2,
	chance = 20,
	action = function(pos, node)
		local above = {x=pos.x, y=pos.y+1, z=pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if name ~= "ignore" and nodedef
				and not ((nodedef.sunlight_propagates or nodedef.paramtype == "light")
				and nodedef.liquidtype == "none") then
			minetest.set_node(pos, {name = "hades_core:dirt"})
		end
	end
})

minetest.register_abm({
	label = "Grow moss on cobblestone wall",
	nodenames = {"walls:cobble"},
	neighbors = {"group:water"},
	interval = 500,
	chance = 35,
	action = function(pos, node)
		minetest.set_node(pos, {name="walls:mossycobble"})
	end,
})

minetest.register_abm({
	label = "Burn cobblestone",
	nodenames = {"hades_core:cobble", "hades_core:mossycobble"},
	neighbors = {"group:lava"},
	interval = 45,
	chance = 15,
	action = function(pos, node)
		local nn
		if node.name == "hades_core:mossycobble" then
			nn = "hades_core:cobble"
		else
			nn = "hades_core:cobble_baked"
		end
		minetest.set_node(pos, {name=nn})
	end,
})

minetest.register_abm({
	label = "Create gravel near water",
	nodenames = {"hades_core:mossycobble"},
	neighbors = {"hades_core:water_flowing"},
	interval = 500,
	chance = 75,
	action = function(pos, node)
		minetest.set_node(pos, {name="hades_core:gravel"})
	end,
})


--
-- Ash transformation
--

minetest.register_abm({
	label = "Create fertile sand",
	nodenames = {"hades_core:ash"},
	interval = 550,
	chance = 35,
	action = function(pos, node)
		if minetest.find_node_near(pos, 3, {"group:leaves"}) == nil then
			return
		else
		    pos.y = pos.y+1
			if minetest.get_node(pos).name == "hades_core:cactus" then
			  return
			else
			pos.y = pos.y-1
			minetest.set_node(pos, {name="hades_core:fertile_sand"})
			end
		end
	end,
})


--
-- Fertile sand transformation
--

minetest.register_abm({
	label = "Create dirt (direct neighboring water)",
	nodenames = {"hades_core:fertile_sand"},
	neighbors = {"group:water"},
	interval = 25,
	chance = 5,
	action = function(pos, node)
		   minetest.set_node(pos, {name="hades_core:dirt"})
	end,
})

minetest.register_abm({
	label = "Create dirt (extended water check)",
	nodenames = {"hades_core:fertile_sand"},
	neighbors = {"hades_core:dirt", "hades_core:dirt_with_grass"},
	interval = 50,
	chance = 5,
	action = function(pos, node)
			if minetest.find_node_near(pos, 10, {"group:water"}) == nil then
				return
			else
			    minetest.set_node(pos, {name="hades_core:dirt"})
			end
	end,
})

minetest.register_abm({
	label = "Create clay",
	nodenames = {"hades_core:ash"},
	neighbors = {"group:water"},
	interval = 700,
	chance = 75,
	action = function(pos, node)
              minetest.set_node(pos, {name="hades_core:clay"})				
	end,
})

--
-- Dirt transformation
--

minetest.register_abm({
	label = "Grow grass on dirt",
	nodenames = {"hades_core:dirt"},
	interval = 50,
	chance = 20,
	action = function(pos, node)
		local name = minetest.get_node(pos).name
			    pos.y = pos.y+1
				if minetest.get_node(pos).name == "air" then
				   if minetest.get_node_light(pos) < 8 then
				      return
				   else
				    pos.y = pos.y-1
					minetest.set_node(pos, {name="hades_core:dirt_with_grass"})
				   end
				end
	end,
})

--
-- Sugarcane growing
--

minetest.register_abm({
	label = "Grow sugarcane",
	nodenames = {"hades_core:sugarcane"},
	neighbors = {"hades_core:dirt", "hades_core:dirt_with_grass"},
	interval = 55,
	chance = 35,
	action = function(pos, node)
		pos.y = pos.y-1
		local name = minetest.get_node(pos).name
		if name == "hades_core:dirt" or name == "hades_core:dirt_with_grass" then
			pos.y = pos.y+1
			local height = 0
			while minetest.get_node(pos).name == "hades_core:sugarcane" and height < 3 do
				height = height+1
				pos.y = pos.y+1
			end
			if height < 3 then
				if minetest.get_node(pos).name == "air" then
					minetest.set_node(pos, {name="hades_core:sugarcane"})
				end
			end
		end
	end,
})

minetest.register_abm({
	label = "Spread sugarcane",
	nodenames = {"hades_core:dirt_with_grass"},
	neighbors = {"hades_core:papyrus"},
	interval = 500,
	chance = 25,
	action = function(pos, node)
              if minetest.find_node_near(pos, 10, {"hades_core:sugarcane"}) == nil then
			     pos.y = pos.y+1
				 if minetest.get_node(pos).name == "air" then
			        minetest.set_node(pos, {name="hades_core:sugarcane"})
				 end
			else
			    return
			end				
	end,
})

--
-- Papyrus and cactus growing
--

minetest.register_abm({
	label = "Grow cactus",
	nodenames = {"hades_core:cactus"},
	neighbors = {"group:sand", "group:ash"},
	interval = 50,
	chance = 20,
	action = function(pos, node)
		pos.y = pos.y-1
		local name = minetest.get_node(pos).name
		if minetest.get_item_group(name, "sand") ~= 0 or minetest.get_item_group(name, "ash" ~= 0) then
			pos.y = pos.y+1
			local height = 0
			while minetest.get_node(pos).name == "hades_core:cactus" and height < 4 do
				height = height+1
				pos.y = pos.y+1
			end
			if height < 3 then
				if minetest.get_node(pos).name == "air" then
					minetest.set_node(pos, {name="hades_core:cactus"})
				end
			end
		end
	end,
})

minetest.register_abm({
	label = "Grow papyrus",
	nodenames = {"hades_core:papyrus"},
	neighbors = {"hades_core:dirt", "hades_core:dirt_with_grass"},
	interval = 50,
	chance = 20,
	action = function(pos, node)
		pos.y = pos.y-1
		local name = minetest.get_node(pos).name
		if name == "hades_core:dirt" or name == "hades_core:dirt_with_grass" then
			if minetest.find_node_near(pos, 3, {"group:water"}) == nil then
				return
			end
			pos.y = pos.y+1
			local height = 0
			while minetest.get_node(pos).name == "hades_core:papyrus" and height < 4 do
				height = height+1
				pos.y = pos.y+1
			end
			if height < 4 then
				if minetest.get_node(pos).name == "air" then
					minetest.set_node(pos, {name="hades_core:papyrus"})
				end
			end
		end
	end,
})

