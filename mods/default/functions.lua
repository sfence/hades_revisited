-- mods/default/functions.lua


--
-- Sounds
--

local mhd = 32

function default.node_sound_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name="", gain=1.0}
	table.dug = table.dug or
			{name="default_dug_node", gain=0.25, max_hear_distance = mhd}
	table.place = table.place or
			{name="default_place_node_hard", gain=1.0, max_hear_distance = mhd}
	return table
end


function default.node_sound_stone_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name="default_hard_footstep", gain=0.5, max_hear_distance = mhd}
	table.dug = table.dug or
			{name="default_hard_footstep", gain=1.0, max_hear_distance = mhd}
	default.node_sound_defaults(table)
	return table
end

function default.node_sound_metal_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_metal_footstep", gain = 0.4, max_hear_distance = mhd}
	table.dig = table.dig or
			{name = "default_dig_metal", gain = 0.5, max_hear_distance = mhd}
	table.dug = table.dug or
			{name = "default_dug_metal", gain = 0.5, max_hear_distance = mhd}
	table.place = table.place or
			{name = "default_place_node_metal", gain = 0.5, max_hear_distance = mhd}
	default.node_sound_defaults(table)
	return table
end
-- TODO: Add more metal sounds

default.node_sound_heavy_metal_defaults = default.node_sound_metal_defaults

function default.node_sound_dirt_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name="default_dirt_footstep", gain=1.0, max_hear_distance = mhd}
	table.dug = table.dug or
			{name="default_dirt_footstep", gain=1.5, max_hear_distance = mhd}
	table.place = table.place or
			{name="default_place_node", gain=1.0, max_hear_distance = mhd}
	default.node_sound_defaults(table)
	return table
end


function default.node_sound_sand_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name="default_sand_footstep", gain=0.5, max_hear_distance = mhd}
	table.dug = table.dug or
			{name="default_sand_footstep", gain=1.0, max_hear_distance = mhd}
	table.place = table.place or
			{name="default_place_node", gain=1.0, max_hear_distance = mhd}
	default.node_sound_defaults(table)
	return table
end


function default.node_sound_wood_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name="default_wood_footstep", gain=0.5, max_hear_distance = mhd}
	table.dug = table.dug or
			{name="default_wood_footstep", gain=1.0, max_hear_distance = mhd}
	default.node_sound_defaults(table)
	return table
end


function default.node_sound_leaves_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name="default_grass_footstep", gain=0.35, max_hear_distance = mhd}
	table.dug = table.dug or
			{name="default_grass_footstep", gain=0.85, max_hear_distance = mhd}
	table.dig = table.dig or
			{name="default_dig_crumbly", gain=0.4, max_hear_distance = mhd}
	table.place = table.place or
			{name="default_place_node", gain=1.0, max_hear_distance = mhd}
	default.node_sound_defaults(table)
	return table
end


function default.node_sound_glass_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name="default_glass_footstep", gain=0.5, max_hear_distance = mhd}
	table.dug = table.dug or
			{name="default_break_glass", gain=1.0, max_hear_distance = mhd}
	default.node_sound_defaults(table)
	return table
end

function default.node_sound_water_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_water_footstep", gain = 0.2, max_hear_distance = mhd}
	table.place = table.place or
			{name = "default_place_node_water", gain = 0.8, max_hear_distance = mhd}
	default.node_sound_defaults(table)
	return table
end

function default.node_sound_lava_defaults(table)
	table = table or {}
	table.place = table.place or
			{name = "default_place_node_lava", gain = 1.0, max_hear_distance = mhd}
	default.node_sound_defaults(table)
	return table
end


function default.register_fence(name, def)
	if def.material then
		minetest.register_craft({
			output = name .. " 4",
			recipe = {
				{ def.material, 'group:stick', def.material },
				{ def.material, 'group:stick', def.material },
			}
		})
	end

	local fence_texture = "default_fence_overlay.png^" .. def.texture ..
			"^default_fence_overlay.png^[makealpha:255,126,126"
	-- Allow almost everything to be overridden
	local default_fields = {
		paramtype = "light",
		drawtype = "nodebox",
		node_box = {
			type = "connected",
			fixed = {{-1/8, -1/2, -1/8, 1/8, 1/2, 1/8}},
			-- connect_top =
			-- connect_bottom =
			connect_front = {{-1/16,3/16,-1/2,1/16,5/16,-1/8},
				{-1/16,-5/16,-1/2,1/16,-3/16,-1/8}},
			connect_left = {{-1/2,3/16,-1/16,-1/8,5/16,1/16},
				{-1/2,-5/16,-1/16,-1/8,-3/16,1/16}},
			connect_back = {{-1/16,3/16,1/8,1/16,5/16,1/2},
				{-1/16,-5/16,1/8,1/16,-3/16,1/2}},
			connect_right = {{1/8,3/16,-1/16,1/2,5/16,1/16},
				{1/8,-5/16,-1/16,1/2,-3/16,1/16}},
		},
		collision_box = {
			type = "connected",
			fixed = {{-1/8, -1/2, -1/8, 1/8, 1/2, 1/8}},
			connect_front = {{-1/8,-1/2,-1/2,1/8,1/2,-1/8}},
			connect_left = {{-1/2,-1/2,-1/8,-1/8,1/2,1/8}},
			connect_back = {{-1/8,-1/2,1/8,1/8,1/2,1/2}},
			connect_right = {{1/8,-1/2,-1/8,1/2,1/2,1/8}},
		},
		connects_to = {"group:fence_wood", "group:wood", "group:tree"},
		inventory_image = fence_texture,
		wield_image = fence_texture,
		tiles = {def.texture},
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {},
	}
	for k, v in pairs(default_fields) do
		if def[k] == nil then
			def[k] = v
		end
	end

	-- Always add to the fence group, even if no group provided
	def.groups.fence = 1
	-- Always connect to fence gates regardless of type
	table.insert(def.connects_to, "group:fence_gate")

	def.texture = nil
	def.material = nil

	minetest.register_node(name, def)
end

default.register_ladder = function(id, def)
	local odef = {
		description = def.description,
		_doc_items_longdesc = "A piece of ladder which allows you to climb vertically.",
		drawtype = "signlike",
		is_ground_content = false,
		tiles = { def.texture },
		inventory_image = def.texture,
		wield_image = def.texture,
		paramtype = "light",
		sunlight_propagates = true,
		paramtype2 = "wallmounted",
		walkable = false,
		climbable = true,
		node_box = {
			type = "wallmounted",
			wall_side = { -0.5, -0.5, -0.5, -7/16, 0.5, 0.5 },
		},
		selection_box = {
			type = "wallmounted",
			wall_side = { -0.5, -0.5, -0.5, -7/16, 0.5, 0.5 },
		},
		sounds = default.node_sound_wood_defaults(),
		node_placement_prediction = "",
		-- Restrict placement of ladders
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				-- no interaction possible with entities
				return itemstack
			end

			local under = pointed_thing.under
			local node = minetest.get_node(under)
			local def = minetest.registered_nodes[node.name]
			if not def then
				return itemstack
			end
			local groups = def.groups

			-- Don't allow to place the ladder at particular nodes
			if groups and (groups.ladder or groups.slab or groups.attached_node) then
				return itemstack
			end

			-- Check special rightclick action of pointed node
			if def and def.on_rightclick then
				if not placer:get_player_control().sneak then
					return def.on_rightclick(under, node, placer, itemstack,
						pointed_thing) or itemstack, false
				end
			end
			local above = pointed_thing.above
			local adef = minetest.registered_nodes[minetest.get_node(above).name]
			if not adef.buildable_to then
				return itemstack
			end

			-- Ladders may not be placed on ceiling or floor
			if under.y ~= above.y then
				return itemstack
			end
			local idef = itemstack:get_definition()
			local success = minetest.item_place_node(itemstack, placer, pointed_thing)

			if success then
				if idef.sounds and idef.sounds.place then
					minetest.sound_play(idef.sounds.place, {pos=above, gain=1})
				end
			end
			return itemstack
		end,

		on_rotate = function() return false end,
	}

	for k, v in pairs(def) do
		odef[k] = v
	end

	if not odef.groups then
		odef.groups = {}
	end
	odef.groups.ladder = 1
	odef.groups.attached_node = 1


	minetest.register_node(id, odef)
end


--
-- Legacy
--


function default.spawn_falling_node(p, nodename)
	spawn_falling_node(p, nodename)
end


-- Horrible crap to support old code
-- Don't use this and never do what this does, it's completely wrong!
-- (More specifically, the client and the C++ code doesn't get the group)
function default.register_falling_node(nodename, texture)
	minetest.log("error", debug.traceback())
	minetest.log('error', "WARNING: default.register_falling_node is deprecated")
	if minetest.registered_nodes[nodename] then
		minetest.registered_nodes[nodename].groups.falling_node = 1
	end
end


--
-- Global callbacks
--


-- Global environment step function
function on_step(dtime)
	-- print("on_step")
end
minetest.register_globalstep(on_step)


function on_placenode(p, node)
	--print("on_placenode")
end
minetest.register_on_placenode(on_placenode)


function on_dignode(p, node)
	--print("on_dignode")
end
minetest.register_on_dignode(on_dignode)


function on_punchnode(p, node)
end
minetest.register_on_punchnode(on_punchnode)




--
-- Grow trees
--


minetest.register_abm({
	nodenames = {"default:sapling"},
	interval = 20,
	chance = 50,
	action = function(pos, node)
		local nu =  minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
		local is_soil = minetest.get_item_group(nu, "soil")
		if is_soil == 0 then
			return
		end


		minetest.log("action", "A sapling grows into a tree at "..minetest.pos_to_string(pos))
		local vm = minetest.get_voxel_manip()
		local minp, maxp = vm:read_from_map({x=pos.x-16, y=pos.y, z=pos.z-16}, {x=pos.x+16, y=pos.y+16, z=pos.z+16})
		local a = VoxelArea:new{MinEdge=minp, MaxEdge=maxp}
		local data = vm:get_data()
		default.grow_tree(data, a, pos, math.random(1, 4) == 1, math.random(1,100000))
		vm:set_data(data)
		vm:write_to_map(data)
		vm:update_map()
	end
})


minetest.register_abm({
	nodenames = {"default:junglesapling"},
	interval = 20,
	chance = 50,
	action = function(pos, node)
		local nu =  minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
		local is_soil = minetest.get_item_group(nu, "soil")
		if is_soil == 0 then
			return
		end


		minetest.log("action", "A jungle sapling grows into a tree at "..minetest.pos_to_string(pos))
		local vm = minetest.get_voxel_manip()
		local minp, maxp = vm:read_from_map({x=pos.x-16, y=pos.y-1, z=pos.z-16}, {x=pos.x+16, y=pos.y+16, z=pos.z+16})
		local a = VoxelArea:new{MinEdge=minp, MaxEdge=maxp}
		local data = vm:get_data()
		default.grow_jungletree(data, a, pos, math.random(1,100000))
		vm:set_data(data)
		vm:write_to_map(data)
		vm:update_map()
	end
})


--
-- Lavacooling
--

default.cool_lava_source = function(pos)
	if minetest.find_node_near(pos, 5, {"default:water_flowing"}) == nil then
		minetest.sound_play({name="fire_extinguish_flame", gain = 0.2}, {pos=pos, max_hear_distance = 16})
		minetest.set_node(pos, {name="default:tuff"})
	else
		if minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "air" then
			minetest.sound_play({name="fire_extinguish_flame", gain = 0.05}, {pos=pos, max_hear_distance = 6})
		end
		minetest.set_node(pos, {name="default:water_source"})
	end
end

default.cool_lava_flowing = function(pos)
	minetest.sound_play({name="fire_extinguish_flame", gain = 0.2}, {pos=pos, max_hear_distance = 16})
	minetest.set_node(pos, {name="default:gravel_volcanic"})
end


minetest.register_abm({
	nodenames = {"default:lava_flowing"},
	neighbors = {"group:water"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		default.cool_lava_flowing(pos, node, active_object_count, active_object_count_wider)
	end,
})


minetest.register_abm({
	nodenames = {"default:lava_source"},
	neighbors = {"group:water"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		default.cool_lava_source(pos, node, active_object_count, active_object_count_wider)
	end,
})

--
-- Stonetransformation
--

minetest.register_abm({
	nodenames = {"default:stone", "default:mossystone"},
	neighbors = {"group:lava"},
	interval = 25,
	chance = 15,
	action = function(pos, node)
		local nn
		if node.name == "default:mossystone" then
			nn = "default:stone"
		else
			nn = "default:stone_baked"
		end
		minetest.set_node(pos, {name=nn})
	end,
})

minetest.register_abm({
	nodenames = {"default:stone"},
	interval = 600,
	chance = 65,
	action = function(pos, node)
		if minetest.find_node_near(pos, 2, {"group:water"}) == nil then
			return
		else
			minetest.set_node(pos, {name="default:mossystone"})
		end
	end,
})

--
-- Tufftransformation
--

minetest.register_abm({
	nodenames = {"default:tuff", "default:mossytuff"},
	neighbors = {"group:lava"},
	interval = 25,
	chance = 15,
	action = function(pos, node)
		local nn = "default:tuff_baked"
		if node.name == "default:mossytuff" then
			minetest.set_node(pos, {name="default:tuff"})
		else
			minetest.set_node(pos, {name="default:tuff_baked"})
		end
	end,
})

minetest.register_abm({
	nodenames = {"default:tuff"},
	interval = 600,
	chance = 65,
	action = function(pos, node)
		if minetest.find_node_near(pos, 2, {"group:water"}) == nil then
			return
		else
			minetest.set_node(pos, {name="default:mossytuff"})
		end
	end,
})

--
-- Marble
--

minetest.register_abm({
	nodenames = {"default:chondrit"},
	neighbors = {"group:water"},
	interval = 200,
	chance = 55,
	action = function(pos, node)
		if minetest.find_node_near(pos, 4, {"group:lava"}) == nil or pos.y > -500 then
			return
		else
			minetest.set_node(pos, {name="default:marble"})
		end
	end,
})


--
-- Obsidian
--

minetest.register_abm({
	nodenames = {"default:gravel_volcanic"},
	neighbors = {"group:lava"},
	interval = 1111,
	chance = 65,
	action = function(pos, node)
		if minetest.find_node_near(pos, 4, {"group:water"}) == nil or pos.y > -1000 then
			return
		else
			minetest.set_node(pos, {name="default:obsidian"})
		end
	end,
})

--
-- Cobbletransformation
--
minetest.register_abm({
	nodenames = {"default:cobble"},
	neighbors = {"group:water"},
	interval = 500,
	chance = 35,
	action = function(pos, node)
		minetest.set_node(pos, {name="default:mossycobble"})
	end,
})

minetest.register_abm({
	nodenames = {"default:cobble"},
	interval = 500,
	chance = 55,
	action = function(pos, node)
		if minetest.find_node_near(pos, 2, {"group:water"}) == nil then
			return
		else
			minetest.set_node(pos, {name="default:mossycobble"})
		end
	end,
})

minetest.register_abm({
	nodenames = {"walls:cobble"},
	neighbors = {"group:water"},
	interval = 500,
	chance = 35,
	action = function(pos, node)
		minetest.set_node(pos, {name="walls:mossycobble"})
	end,
})

minetest.register_abm({
	nodenames = {"default:cobble", "default:mossycobble"},
	neighbors = {"group:lava"},
	interval = 45,
	chance = 15,
	action = function(pos, node)
		local nn
		if node.name == "default:mossycobble" then
			nn = "default:cobble"
		else
			nn = "default:cobble_baked"
		end
		minetest.set_node(pos, {name=nn})
	end,
})

minetest.register_abm({
	nodenames = {"default:mossycobble"},
	neighbors = {"default:water_flowing"},
	interval = 500,
	chance = 75,
	action = function(pos, node)
		minetest.set_node(pos, {name="default:gravel"})
	end,
})


--
-- Ash_leavetransformation
--

minetest.register_abm({
	nodenames = {"default:ash"},
	interval = 550,
	chance = 35,
	action = function(pos, node)
		if minetest.find_node_near(pos, 3, {"group:leaves"}) == nil then
			return
		else
		    pos.y = pos.y+1
			if minetest.get_node(pos).name == "default:cactus" then
			  return
			else
			pos.y = pos.y-1
			minetest.set_node(pos, {name="default:fertile_sand"})
			end
		end
	end,
})


--
-- Sandtransformation
--

minetest.register_abm({
	nodenames = {"default:fertile_sand"},
    neighbors = {"group:water"},
	interval = 25,
	chance = 5,
	action = function(pos, node)
		   minetest.set_node(pos, {name="default:dirt"})
	end,
})

minetest.register_abm({
	nodenames = {"default:fertile_sand"},
    neighbors = {"default:dirt", "default:dirt_with_grass"},
	interval = 50,
	chance = 5,
	action = function(pos, node)
			if minetest.find_node_near(pos, 10, {"group:water"}) == nil then
				return
			else
			    minetest.set_node(pos, {name="default:dirt"})
			end
	end,
})

minetest.register_abm({
	nodenames = {"default:ash"},
    neighbors = {"group:water"},
	interval = 700,
	chance = 75,
	action = function(pos, node)
              minetest.set_node(pos, {name="default:clay"})				
	end,
})


-- Dirttransformation
--

minetest.register_abm({
	nodenames = {"default:dirt"},
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
					minetest.set_node(pos, {name="default:dirt_with_grass"})
				   end
				end
	end,
})

-- minetest.register_abm({
	-- nodenames = {"default:dirt"},
	-- interval = 50,
	-- chance = 20,
	-- action = function(pos, node)
			-- if minetest.find_node_near(pos, 10, {"group:water"}) == nil then
               -- minetest.set_node(pos, {name="default:fertile_sand"})
            -- else
               -- return 
			-- end
	-- end,
-- })

-- minetest.register_abm({
	-- nodenames = {"default:dirt_with_grass"},
	-- interval = 50,
	-- chance = 20,
	-- action = function(pos, node)
			-- if minetest.find_node_near(pos, 10, {"group:water"}) == nil then
               -- minetest.set_node(pos, {name="default:dirt"})				
            -- else
               -- return 
			-- end
	-- end,
-- })
-- sugarcane
minetest.register_abm({
	nodenames = {"default:sugarcane"},
	neighbors = {"default:dirt", "default:dirt_with_grass"},
	interval = 55,
	chance = 35,
	action = function(pos, node)
		pos.y = pos.y-1
		local name = minetest.get_node(pos).name
		if name == "default:dirt" or name == "default:dirt_with_grass" then
			pos.y = pos.y+1
			local height = 0
			while minetest.get_node(pos).name == "default:sugarcane" and height < 3 do
				height = height+1
				pos.y = pos.y+1
			end
			if height < 3 then
				if minetest.get_node(pos).name == "air" then
					minetest.set_node(pos, {name="default:sugarcane"})
				end
			end
		end
	end,
})

minetest.register_abm({
	nodenames = {"default:dirt_with_grass"},
    neighbors = {"default:papyrus"},
	interval = 500,
	chance = 25,
	action = function(pos, node)
              if minetest.find_node_near(pos, 10, {"default:sugarcane"}) == nil then
			     pos.y = pos.y+1
				 if minetest.get_node(pos).name == "air" then
			        minetest.set_node(pos, {name="default:sugarcane"})
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
	nodenames = {"default:cactus"},
	neighbors = {"group:sand"},
	interval = 50,
	chance = 20,
	action = function(pos, node)
		pos.y = pos.y-1
		local name = minetest.get_node(pos).name
		if minetest.get_item_group(name, "sand") ~= 0 then
			pos.y = pos.y+1
			local height = 0
			while minetest.get_node(pos).name == "default:cactus" and height < 4 do
				height = height+1
				pos.y = pos.y+1
			end
			if height < 3 then
				if minetest.get_node(pos).name == "air" then
					minetest.set_node(pos, {name="default:cactus"})
				end
			end
		end
	end,
})


minetest.register_abm({
	nodenames = {"default:papyrus"},
	neighbors = {"default:dirt", "default:dirt_with_grass"},
	interval = 50,
	chance = 20,
	action = function(pos, node)
		pos.y = pos.y-1
		local name = minetest.get_node(pos).name
		if name == "default:dirt" or name == "default:dirt_with_grass" then
			if minetest.find_node_near(pos, 3, {"group:water"}) == nil then
				return
			end
			pos.y = pos.y+1
			local height = 0
			while minetest.get_node(pos).name == "default:papyrus" and height < 4 do
				height = height+1
				pos.y = pos.y+1
			end
			if height < 4 then
				if minetest.get_node(pos).name == "air" then
					minetest.set_node(pos, {name="default:papyrus"})
				end
			end
		end
	end,
})


--
-- dig upwards
--

function default.dig_up(pos, node, digger)
	if digger == nil then return end
	local np = {x = pos.x, y = pos.y + 1, z = pos.z}
	local nn = minetest.get_node(np)
	if nn.name == node.name then
		minetest.node_dig(np, nn, digger)
	end
end


--
-- Leafdecay
--


-- To enable leaf decay for a node, add it to the "leafdecay" group.
--
-- The rating of the group determines how far from a node in the group "tree"
-- the node can be without decaying.
--
-- If param2 of the node is ~= 0, the node will always be preserved. Thus, if
-- the player places a node of that kind, you will want to set param2=1 or so.
--
-- If the node is in the leafdecay_drop group then the it will always be dropped
-- as an item


default.leafdecay_trunk_cache = {}
default.leafdecay_enable_cache = true
-- Spread the load of finding trunks
default.leafdecay_trunk_find_allow_accumulator = 0


minetest.register_globalstep(function(dtime)
	local finds_per_second = 5000
	default.leafdecay_trunk_find_allow_accumulator =
			math.floor(dtime * finds_per_second)
end)


minetest.register_abm({
	nodenames = {"group:leafdecay"},
	neighbors = {"air", "group:liquid"},
	-- A low interval and a high inverse chance spreads the load
	interval = 2,
	chance = 5,


	action = function(p0, node, _, _)
		minetest.log("verbose", "[default] leafdecay ABM at "..p0.x..", "..p0.y..", "..p0.z..")")
		local do_preserve = false
		local d = minetest.registered_nodes[node.name].groups.leafdecay
		if not d or d == 0 then
			minetest.log("verbose", "[default] not groups.leafdecay")
			return
		end
		local n0 = minetest.get_node(p0)
		if n0.param2 ~= 0 then
			-- Prevent decay
			return
		end
		local p0_hash = nil
		if default.leafdecay_enable_cache then
			p0_hash = minetest.hash_node_position(p0)
			local trunkp = default.leafdecay_trunk_cache[p0_hash]
			if trunkp then
				local n = minetest.get_node(trunkp)
				local reg = minetest.registered_nodes[n.name]
				-- Assume ignore is a trunk, to make the thing work at the border of the active area
				if n.name == "ignore" or (reg and reg.groups.tree and reg.groups.tree ~= 0) then
					minetest.log("verbose", "[default] leafdecay: cached trunk still exists")
					return
				end
				minetest.log("verbose", "[default] leafdecay: cached trunk is invalid")
				-- Cache is invalid
				table.remove(default.leafdecay_trunk_cache, p0_hash)
			end
		end
		if default.leafdecay_trunk_find_allow_accumulator <= 0 then
			return
		end
		default.leafdecay_trunk_find_allow_accumulator =
				default.leafdecay_trunk_find_allow_accumulator - 1
		-- Assume ignore is a trunk, to make the thing work at the border of the active area
		local p1 = minetest.find_node_near(p0, d, {"ignore", "group:tree"})
		if p1 then
			do_preserve = true
			if default.leafdecay_enable_cache then
				minetest.log("verbose", "[default] leafdecay: caching trunk")
				-- Cache the trunk
				default.leafdecay_trunk_cache[p0_hash] = p1
			end
		end
		if not do_preserve then
			-- Drop stuff other than the node itself
			itemstacks = minetest.get_node_drops(n0.name)
			for _, itemname in ipairs(itemstacks) do
				if minetest.get_item_group(n0.name, "leafdecay_drop") ~= 0 or
						itemname ~= n0.name then
					local p_drop = {
						x = p0.x - 0.5 + math.random(),
						y = p0.y - 0.5 + math.random(),
						z = p0.z - 0.5 + math.random(),
					}
					minetest.add_item(p_drop, itemname)
				end
			end
			-- Remove node
			minetest.remove_node(p0)
			minetest.check_for_falling(p0)
		end
	end
})
