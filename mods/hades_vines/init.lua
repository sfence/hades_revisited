local S = minetest.get_translator("vines")

local mod_name = "hades_vines"
local average_height = 12
local spawn_interval = 90


--- VINES GROUPS
-- Sideways vines are at the "side" of the node. They attach to the side of nodes
local vines_group_side = {vines=1,snappy=3,flammable=2}
-- Center vines are in the center of the node. They attach/"hang" from a solid node above
local vines_group_center = {vines=2,snappy=3,flammable=2}
local tt_surv = S("Needs a tree trunk to survive")


local walldir ={}

-- Returns true if the node supports vines
local supports_vines = function(nodename)
	local def = minetest.registered_nodes[nodename]
	if not def then
		return true
	end
	-- Rules: 1) walkable 2) full cube OR it's a tree node
	return minetest.get_item_group(nodename, "tree") ~= 0 or (def.walkable and
			(def.node_box == nil or def.node_box.type == "regular") and
			(def.collision_box == nil or def.collision_box.type == "regular"))
end

--[[ Call this for vines nodes only.
Given the pos and node of a vines node, this returns true if the vines are
supported and false if the vines are currently floating.
Vines are considered “supported” if they face a walkable+solid block or
“hang” from a vines node above. ]]
local check_vines_supported = function(pos, node)
	local supported = false
	local dir = minetest.wallmounted_to_dir(node.param2)
	local pos1 = vector.add(pos, dir)
	local node_neighbor = minetest.get_node(pos1)
	local pos2 = vector.add(pos, {x=0, y=1, z=0})
	local node2 = minetest.get_node(pos2)
	local vg = minetest.get_item_group(node.name, "vines")
	local vg2 = minetest.get_item_group(node2.name, "vines")
	-- Check if vines are attached to a solid block.
	-- If ignore, we assume its solid.
	if (vg == 1) and (node_neighbor.name == "ignore" or supports_vines(node_neighbor.name)) then
		supported = true
	elseif (vg == 1) and (dir.y == 0) then
		-- Vines are not attached, now we check if the vines are “hanging” below another vines block
		-- of equal orientation.
		-- Again, ignore means we assume its supported
		if node2.name == "ignore" or (vg2 == vg and node2.param2 == node.param2) then
			supported = true
		end
	elseif (vg == 2 and (supports_vines(node2.name) or vg2 == 2)) then
		supported = true
	end
	return supported
end

local function get_on_place(centered)
	-- Restrict placement of vines
	return function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			-- no interaction possible with entities
			return itemstack
		end

		local under = pointed_thing.under
		local above = pointed_thing.above
		local node = minetest.get_node(under)
		local def = minetest.registered_nodes[node.name]
		if not def then
			return itemstack
		end
		local groups = def.groups

		-- Check special rightclick action of pointed node
		if def and def.on_rightclick then
			if not placer:get_player_control().sneak then
				return def.on_rightclick(under, node, placer, itemstack,
					pointed_thing) or itemstack, false
			end
		end

		local cnode
		if centered then
			cnode = minetest.get_node({x=above.x, y=above.y+1, z=above.z})
		else
			-- Sideways vines may not be placed on top or below another block
			if under.y ~= above.y then
				return itemstack
			end
			cnode = node
		end
		-- Only place on full cubes
		if not supports_vines(cnode.name) then
			-- But centered vines can be placed below centered vines
			if not (centered and minetest.get_item_group(cnode.name, "vines") == 2) then
				return itemstack
			end
		end

		local idef = itemstack:get_definition()
		local itemstack, success = minetest.item_place_node(itemstack, placer, pointed_thing)

		if success then
			if idef.sounds and idef.sounds.place then
				minetest.sound_play(idef.sounds.place, {pos=above, gain=1}, true)
			end
		end
		return itemstack
	end
end

-- Get vines when using shears
local after_dig_node = function(pos, oldnode, oldmetadata, user)
	local wielded
	if not user or not user:is_player() then
		return
	end
	if user:get_wielded_item() ~= nil then
		wielded = user:get_wielded_item()
	else
		return
	end
	if minetest.get_item_group(wielded:get_name(), "shears") ~= 0 then
		local add = true
		local inv = user:get_inventory()
		local newstack = ItemStack(oldnode.name)
		if not inv then
			add = false
		elseif minetest.is_creative_enabled(user:get_player_name()) then
			if inv:contains_item("main", newstack) then
				add = false
			end
		end
		if add == true then
			inv:add_item("main", newstack)
		end
	end
end

-- If vine dug, also dig a “dependant” vine below it.
-- A vine is dependant if it hangs from this node and has no supporting block.
local on_dig = function(pos, node, digger)
	local below = {x=pos.x, y=pos.y-1, z=pos.z}
	local belownode = minetest.get_node(below)
	minetest.node_dig(pos, node, digger)
	local vg = minetest.get_item_group(node.name, "vines")
	local vg2 = minetest.get_item_group(belownode.name, "vines")
	if vg ~= 0 and vg == vg2 and (not check_vines_supported(below, belownode)) then
		return minetest.registered_nodes[node.name].on_dig(below, node, digger)
	end
end

local function register_vine(id, def)
	local paramtype2, drawtype, buildable_to, on_rotate
	if def.vines_type == "center" then
		drawtype = "plantlike"
		buildable_to = false
	elseif def.vines_type == "side" then
		paramtype2 = "wallmounted"
		drawtype = "signlike"
		buildable_to = true
		on_rotate = false
	end
	local selection_box = def.selection_box or {
		type = "wallmounted",
	}

	local is_centered = def.groups.vines == 2

	minetest.register_node("hades_vines:"..id, {
		description = def.description_normal,
		_tt_help = tt_surv,
		walkable = false,
		climbable = true,
		drop = "",
		buildable_to = buildable_to,
		floodable = true,
		sunlight_propagates = true,
		paramtype = "light",
		paramtype2 = paramtype2,
		tiles = { "hades_vines_"..id..".png", "hades_vines_"..id..".png", "blank.png" },
		drawtype = drawtype,
		inventory_image = "hades_vines_"..id..".png",
		wield_image = "hades_vines_"..id..".png",
		groups = def.groups,
		sounds = hades_sounds.node_sound_leaves_defaults(),
		selection_box = selection_box,
		node_placement_prediction = "",

		on_place = get_on_place(is_centered),
		on_dig = on_dig,
		on_rotate = on_rotate,
		after_dig_node = after_dig_node,
		})

	if def.description_rotten then
		local groups_rotten = table.copy(def.groups)
		groups_rotten.vines_rotten = 1

		minetest.register_node("hades_vines:"..id.."_rotten", {
			description = def.description_rotten,
			walkable = false,
			climbable = true,
			drop = "",
			buildable_to = buildable_to,
			floodable = true,
			sunlight_propagates = true,
			paramtype = "light",
			paramtype2 = paramtype2,
			tiles = { "hades_vines_"..id.."_rotten.png", "hades_vines_"..id.."_rotten.png", "blank.png" },
			drawtype = drawtype,
			inventory_image = "hades_vines_"..id.."_rotten.png",
			wield_image = "hades_vines_"..id.."_rotten.png",
			groups = groups_rotten,
			sounds = hades_sounds.node_sound_leaves_defaults(),
			selection_box = selection_box,
			node_placement_prediction = "",
			on_place = get_on_place(is_centered),
			on_dig = on_dig,
			after_dig_node = after_dig_node,
		})
	end
end

register_vine("jungle", {
	vines_type = "side",
	description_normal = S("Tropical Vine"),
	description_rotten = S("Rotten Tropical Vine"),
	groups = vines_group_side,
})

register_vine("willow", {
	vines_type = "side",
	description_normal = S("Willow Vine"),
	description_rotten = S("Rotten Willow Vine"),
	groups = vines_group_side,
})

register_vine("cave", {
	vines_type = "center",
	description_normal = S("Cave Vine"),
	description_rotten = S("Rotten Cave Vine"),
	groups = vines_group_center,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -1/2, -0.3, 0.3, 1/2, 0.3},
	},
})

register_vine("root", {
	vines_type = "center",
	description_normal = S("Root Vine"),
	groups = vines_group_center,
	selection_box = {
		type = "fixed",
		fixed = {-1/6, -1/2, -1/6, 1/6, 1/2, 1/6},
	},
})

--ABM

minetest.register_abm({
	label = "Vine rot",
	nodenames = {"hades_vines:cave", "hades_vines:jungle", "hades_vines:willow"},
	interval = 300,
	chance = 8,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if minetest.find_node_near(pos, 5, "group:tree") == nil then
			walldir = node.param2
			minetest.add_node(pos, {name=node.name.."_rotten", param2 = walldir})
		end
	end
})

minetest.register_abm({
	label = "Grow vines",
	nodenames = {"hades_vines:cave", "hades_vines:jungle", "hades_vines:willow"},
	interval = 300,
	chance = 2,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local p = {x=pos.x, y=pos.y-1, z=pos.z}
		local n = minetest.get_node(p)
		if n.name == "air" then
			minetest.add_node(p, {name=node.name, param2=node.param2})
		end
	end
})

local function vinedecay_particles(pos, node)
	local g = minetest.get_item_group(node.name, "vines")
	local relpos1, relpos2
	if g == 1 then
		local dir = minetest.wallmounted_to_dir(node.param2)
		if dir.x < 0 then
			relpos1 = { x = -0.45, y = -0.4, z = -0.5 }
			relpos2 = { x = -0.4, y = 0.4, z = 0.5 }
		elseif dir.x > 0 then
			relpos1 = { x = 0.4, y = -0.4, z = -0.5 }
			relpos2 = { x = 0.45, y = 0.4, z = 0.5 }
		elseif dir.z < 0 then
			relpos1 = { x = -0.5, y = -0.4, z = -0.45 }
			relpos2 = { x = 0.5, y = 0.4, z = -0.4 }
		elseif dir.z > 0 then
			relpos1 = { x = -0.5, y = -0.4, z = 0.4 }
			relpos2 = { x = 0.5, y = 0.4, z = 0.45 }
		else
			return
		end
	elseif g == 2 then
		relpos1 = { x = -0.25, y = -0.5, z = -0.25 }
		relpos2 = { x = 0.25, y = 0.5, z = 0.25 }
	else
		return
	end

	minetest.add_particlespawner({
		amount = math.random(8, 16),
		time = 0.1,
		minpos = vector.add(pos, relpos1),
		maxpos = vector.add(pos, relpos2),
		minvel = {x=-0.2, y=-0.2, z=-0.2},
		maxvel = {x=0.2, y=0.1, z=0.2},
		minacc = {x=0, y=-9.81, z=0},
		maxacc = {x=0, y=-9.81, z=0},
		minexptime = 0.1,
		maxexptime = 0.5,
		minsize = 0.5,
		maxsize = 1.0,
		collisiondetection = true,
		vertical = false,
		node = node,
	})
end


minetest.register_abm({
	label = "Vines decay",
	nodenames = {"group:vines"},
	-- A low interval and a high inverse chance spreads the load
	interval = 2,
	chance = 5,

	action = function(pos, node)
		if not check_vines_supported(pos, node) then
			on_dig(pos, node)
			vinedecay_particles(pos, node)
			minetest.remove_node(pos)
			minetest.check_for_falling(pos)
		end
	end,
})


--spawning
plantslib:spawn_on_surfaces({
	avoid_nodes = {"hades_vines:cave"},
	avoid_radius = 5,
	spawn_delay = spawn_interval,
	spawn_plants = {"hades_vines:cave"},
	spawn_chance = 50,
	spawn_surfaces = {"hades_core:dirt_with_grass","hades_core:dirt_with_grass_l1","hades_core:dirt_with_grass_l2","hades_core:dirt_with_grass_l3","hades_core:dirt"},
	spawn_on_bottom = true,
	plantlife_limit = -0.9,
})

plantslib:spawn_on_surfaces({
	avoid_nodes = {"hades_vines:cave", "hades_vines:jungle"},
	avoid_radius = 3,
	spawn_delay = spawn_interval,
	spawn_plants = {"hades_vines:jungle"},
	spawn_chance = 50,
	spawn_surfaces = {"group:leaves"},
	spawn_on_side = true,
	near_nodes = {"hades_core:water_source", "hades_trees:jungle_tree"},
	near_nodes_size = 10,
	near_nodes_vertical = 5,
	near_nodes_count = 3,
	plantlife_limit = -0.9,
})

plantslib:spawn_on_surfaces({
	spawn_plants = {"hades_vines:willow"},
	avoid_radius = 3,
	spawn_delay = spawn_interval,
	spawn_chance = 50,
	spawn_surfaces = {"group:leaves"},
	spawn_on_side = true,
	near_nodes = {"hades_core:water_source"},
	near_nodes_size = 7,
	near_nodes_vertical = 4,
	near_nodes_count = 3,
	plantlife_limit = -0.9,
})

-- Shears: jojoa1997's shears

minetest.register_tool("hades_vines:shears", {
	description = S("Shears"),
	_tt_help = S("Cuts leaves, vines and plants"),
	inventory_image = "hades_vines_shears.png",
	wield_image = "hades_vines_shears.png",
	stack_max = 1,
	max_drop_level=3,
	groups = { shears = 1 },
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps={
		snappy={times={[3]=0.2, [2]=0.5, [1]=1.5}, uses=20, maxlevel=3},
		}
	},
})

minetest.register_craft({
	output = 'hades_vines:shears',
	recipe = {
		{'', 'hades_core:steel_ingot', ''},
		{'group:stick', 'group:wood', 'hades_core:steel_ingot'},
		{'', 'group:stick', ''},
	}
})

minetest.register_node("hades_vines:vines_block",{
	description = S("Vines Block"),
	sunlight_propagates = true,
	tiles = {"hades_vines_block.png"},
	drawtype = "allfaces_optional",
	paramtype = "light",
	groups = {snappy=2,flammable=2 },
	sounds = hades_sounds.node_sound_leaves_defaults(),
})

minetest.register_craft({
	output = 'hades_vines:vines_block',
	recipe = {
		{'hades_farming:string', '', 'hades_farming:string'},
		{'', 'group:vines', ''},
		{'hades_farming:string', '', 'hades_farming:string'},
	}
})

minetest.log("action", "[hades_vines] loaded!")
