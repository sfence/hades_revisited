local S = minetest.get_translator("vines")

local mod_name = "vines"
local average_height = 12
local spawn_interval = 90
local vines_group = {attached_node=1,vines=1,snappy=3,flammable=2}
local vines_group_cave = {vines=1,snappy=3,flammable=2}
local tt_surv = S("Needs a tree trunk to survive")
-- globals

local walldir ={}

local function register_vine(id, def)
	local paramtype2, drawtype, buildable_to
	if def.vines_type == "center" then
		drawtype = "plantlike"
		buildable_to = false
	elseif def.vines_type == "side" then
		paramtype2 = "wallmounted"
		drawtype = "signlike"
		buildable_to = true
	end
	local selection_box = def.selection_box or {
		type = "wallmounted",
	}

	minetest.register_node("vines:"..id, {
		description = def.description_normal,
		_tt_help = tt_surv,
		walkable = false,
		climbable = true,
		drop = "",
		buildable_to = buildable_to,
		sunlight_propagates = true,
		paramtype = "light",
		paramtype2 = paramtype2,
		tiles = { "vines_"..id..".png" },
		drawtype = drawtype,
		inventory_image = "vines_"..id..".png",
		wield_image = "vines_"..id..".png",
		groups = def.groups,
		sounds = hades_sounds.node_sound_leaves_defaults(),
		selection_box = selection_box,
		after_dig_node = function(pos, oldnode, oldmetadata, user)
			local wielded
			if user:get_wielded_item() ~= nil then
				wielded = user:get_wielded_item()
			else
				return
			end
			if "vines:shears" == wielded:get_name() then
				local inv = user:get_inventory()
				if inv then
					inv:add_item("main", ItemStack(oldnode.name))
				end
			end
		end
	})

	if def.description_rotten then
		local groups_rotten = table.copy(def.groups)
		groups_rotten.vines = 2

		minetest.register_node("vines:"..id.."_rotten", {
			description = def.description_rotten,
			walkable = false,
			climbable = true,
			drop = "",
			buildable_to = buildable_to,
			sunlight_propagates = true,
			paramtype = "light",
			paramtype2 = paramtype2,
			tiles = { "vines_"..id.."_rotten.png" },
			drawtype = drawtype,
			inventory_image = "vines_"..id.."_rotten.png",
			wield_image = "vines_"..id.."_rotten.png",
			groups = groups_rotten,
			sounds = hades_sounds.node_sound_leaves_defaults(),
			selection_box = selection_box,
		})
	end
end

register_vine("side", {
	vines_type = "side",
	description_normal = S("Jungle Vine"),
	description_rotten = S("Rotten Jungle Vine"),
	groups = vines_group,
})

register_vine("willow", {
	vines_type = "side",
	description_normal = S("Willow Vine"),
	description_rotten = S("Rotten Willow Vine"),
	groups = vines_group,
})

register_vine("vine", {
	vines_type = "center",
	description_normal = S("Cave Vine"),
	description_rotten = S("Rotten Cave Vine"),
	groups = vines_group_cave,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -1/2, -0.3, 0.3, 1/2, 0.3},
	},
})

register_vine("root", {
	vines_type = "center",
	description_normal = S("Root Vine"),
	groups = vines_group_cave,
	selection_box = {
		type = "fixed",
		fixed = {-1/6, -1/2, -1/6, 1/6, 1/2, 1/6},
	},
})

--ABM

minetest.register_abm({
	label = "Vine rot",
	nodenames = {"vines:vine", "vines:side", "vines:willow"},
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
	nodenames = {"vines:vine", "vines:side", "vines:willow"},
	interval = 300,
	chance = 2,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local p = {x=pos.x, y=pos.y-1, z=pos.z}
		local n = minetest.get_node(p)
		if n.name == "air" then
			walldir = node.param2
			minetest.add_node(p, {name=node.name, param2 = walldir})
		end
	end
})


--Craft

minetest.register_craftitem("vines:vines", {
	description = S("Detached Vine"),
	inventory_image = "vines_item.png",
})


--spawning
plantslib:spawn_on_surfaces({
	avoid_nodes = {"vines:vine"},
	avoid_radius = 5,
	spawn_delay = spawn_interval,
	spawn_plants = {"vines:vine"},
	spawn_chance = 50,
	spawn_surfaces = {"hades_core:dirt_with_grass","hades_core:dirt"},
	spawn_on_bottom = true,
	plantlife_limit = -0.9,
})

plantslib:spawn_on_surfaces({
	avoid_nodes = {"vines:vine", "vines:side"},
	avoid_radius = 3,
	spawn_delay = spawn_interval,
	spawn_plants = {"vines:side"},
	spawn_chance = 50,
	spawn_surfaces = {"group:leafdecay"},
	spawn_on_side = true,
	near_nodes = {"hades_core:water_source", "hades_trees:jungle_tree"},
	near_nodes_size = 10,
	near_nodes_vertical = 5,
	near_nodes_count = 3,
	plantlife_limit = -0.9,
})

plantslib:spawn_on_surfaces({
	spawn_plants = {"vines:willow"},
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

minetest.register_tool("vines:shears", {
	description = S("Shears"),
	_tt_help = S("Cuts leaves, vines and plants"),
	inventory_image = "shears.png",
	wield_image = "shears.png",
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
	output = 'vines:shears',
	recipe = {
		{'', 'hades_core:steel_ingot', ''},
		{'group:stick', 'group:wood', 'hades_core:steel_ingot'},
		{'', 'group:stick', ''},
	}
})

minetest.register_node("vines:vines_block",{
	description = S("Vines Block"),
	sunlight_propagates = true,
	tiles = {"vines_block.png", "vines_block.png", "vines_block.png"},
	drawtype = "allfaces_optional",
	paramtype = "light",
	groups = {snappy=2,flammable=2 },
	sounds = hades_sounds.node_sound_leaves_defaults(),
})

minetest.register_craft({
	output = 'vines:vines_block',
	recipe = {
		{'farming:string', '', 'farming:string'},
		{'', 'group:vines', ''},
		{'farming:string', '', 'farming:string'},
	}
})

minetest.register_alias("vines:rope", "vines:root")
minetest.register_alias("vines:rope_end", "vines:root")

minetest.log("action", "[vines] Loaded!")
