-- Hades Plantslib mod

hades_plantslib = {}

-- Set to true to spam console with debugging info (needs verbose debug level)
local DEBUG = false

local function dbg(msg)
	if DEBUG then
		minetest.log("verbose", "[hades_plantslib] "..msg)
	end
end

local time_scale = 1
local time_speed = tonumber(minetest.settings:get("time_speed"))

if time_speed and time_speed > 0 then
	time_scale = 72 / time_speed
end

-- Local functions

local function dump_pos(pos)
	return "{x="..pos.x..",y="..pos.y..",z="..pos.z.."}"
end

local function is_node_loaded (node_pos)
	local n = minetest.get_node_or_nil(node_pos)
	if (not n) or (n.name == "ignore") then
		return false
	end
	return true
end

local function set_defaults(biome)
	biome.seed_diff = biome.seed_diff or 0
	biome.near_nodes_vertical = biome.near_nodes_vertical or 1


-- specific to on-generate


	biome.neighbors = biome.neighbors or biome.surface
	biome.near_nodes_size = biome.near_nodes_size or 0
	biome.near_nodes_count = biome.near_nodes_count or 1
	biome.rarity = biome.rarity or 50
	biome.max_count = biome.max_count or 5
	if biome.check_air ~= false then biome.check_air = true end


-- specific to abm spawner
	biome.seed_diff = biome.seed_diff or 0
	biome.light_min = biome.light_min or 0
	biome.light_max = biome.light_max or minetest.LIGHT_MAX
	biome.depth_max = biome.depth_max or 1
	biome.facedir = biome.facedir or 0
end

-- function to decide if a node has a wall that's in verticals_list{}
-- returns wall direction of valid node, or nil if invalid.

local function find_adjacent_wall(pos, verticals)
	local verts = dump(verticals)
	if string.find(verts, minetest.get_node({ x=pos.x-1, y=pos.y, z=pos.z   }).name) then return 3 end
	if string.find(verts, minetest.get_node({ x=pos.x+1, y=pos.y, z=pos.z   }).name) then return 2 end
	if string.find(verts, minetest.get_node({ x=pos.x  , y=pos.y, z=pos.z-1 }).name) then return 5 end
	if string.find(verts, minetest.get_node({ x=pos.x  , y=pos.y, z=pos.z+1 }).name) then return 4 end
	return nil
end

local function find_open_side(pos)
	if minetest.get_node({ x=pos.x-1, y=pos.y, z=pos.z }).name == "air" then
		return {newpos = { x=pos.x-1, y=pos.y, z=pos.z }, facedir = 2}
	end
	if minetest.get_node({ x=pos.x+1, y=pos.y, z=pos.z }).name == "air" then
		return {newpos = { x=pos.x+1, y=pos.y, z=pos.z }, facedir = 3}
	end
	if minetest.get_node({ x=pos.x, y=pos.y, z=pos.z-1 }).name == "air" then
		return {newpos = { x=pos.x, y=pos.y, z=pos.z-1 }, facedir = 4}
	end
	if minetest.get_node({ x=pos.x, y=pos.y, z=pos.z+1 }).name == "air" then
		return {newpos = { x=pos.x, y=pos.y, z=pos.z+1 }, facedir = 5}
	end
	return nil
end

-- The spawning ABM

function hades_plantslib.spawn_on_surfaces(biome)

	if biome.spawn_delay*time_scale >= 1 then
		biome.interval = biome.spawn_delay*time_scale
	else
		biome.interval = 1
	end


	set_defaults(biome)
	biome.spawn_plants_count = table.getn(biome.spawn_plants)

	dbg("Registered spawning ABM:")
	dbg(dump(biome))
	dbg("Number of trigger nodes in this ABM: "..biome.spawn_plants_count )

	minetest.register_abm({
		label = biome.label,
		nodenames = biome.spawn_surfaces,
		interval = biome.interval,
		chance = biome.spawn_chance,
		neighbors = biome.neighbors,
		action = function(pos, node, active_object_count, active_object_count_wider)
			local p_top = { x = pos.x, y = pos.y + 1, z = pos.z }	
			local n_top = minetest.get_node(p_top)
			  if is_node_loaded(p_top) then
				local n_light = minetest.get_node_light(p_top, nil)
				if not (biome.avoid_nodes and biome.avoid_radius and minetest.find_node_near(p_top, biome.avoid_radius + math.random(-1.5,2), biome.avoid_nodes))
				  and n_light >= biome.light_min
				  and n_light <= biome.light_max
				  and (not(biome.neighbors and biome.ncount) or table.getn(minetest.find_nodes_in_area({x=pos.x-1, y=pos.y, z=pos.z-1}, {x=pos.x+1, y=pos.y, z=pos.z+1}, biome.neighbors)) > biome.ncount )
				  and (not(biome.near_nodes and biome.near_nodes_count and biome.near_nodes_size) or table.getn(minetest.find_nodes_in_area({x=pos.x-biome.near_nodes_size, y=pos.y-biome.near_nodes_vertical, z=pos.z-biome.near_nodes_size}, {x=pos.x+biome.near_nodes_size, y=pos.y+biome.near_nodes_vertical, z=pos.z+biome.near_nodes_size}, biome.near_nodes)) >= biome.near_nodes_count)
				  and (not(biome.air_count and biome.air_size) or table.getn(minetest.find_nodes_in_area({x=p_top.x-biome.air_size, y=p_top.y, z=p_top.z-biome.air_size}, {x=p_top.x+biome.air_size, y=p_top.y, z=p_top.z+biome.air_size}, "air")) >= biome.air_count)
				  then
					local walldir = find_adjacent_wall(p_top, biome.verticals_list)
					if biome.alt_wallnode and walldir then
						if n_top.name == "air" then
							dbg("Spawn: "..biome.alt_wallnode.." on top of ("..dump(pos)..") against wall "..walldir)
							minetest.add_node(p_top, { name = biome.alt_wallnode, param2 = walldir })
						end
					else
						local currentsurface = minetest.get_node(pos).name
						if currentsurface ~= "hades_core:water_source"
						  or (currentsurface == "hades_core:water_source" and table.getn(minetest.find_nodes_in_area({x=pos.x, y=pos.y-biome.depth_max-1, z=pos.z}, {x=pos.x, y=pos.y, z=pos.z}, {"hades_core:dirt", "hades_core:dirt_with_grass", "hades_core:ash"})) > 0 )
						  then
							local rnd = math.random(1, biome.spawn_plants_count)
							local plant_to_spawn = biome.spawn_plants[rnd]
							dbg("Chose entry number "..rnd.." of "..biome.spawn_plants_count)
							local fdir = biome.facedir
							if biome.random_facedir then
								fdir = math.random(biome.random_facedir[1],biome.random_facedir[2])
								dbg("Gave it a random facedir: "..fdir)
							end
							if not biome.spawn_on_side and not biome.spawn_on_bottom and not biome.spawn_replace_node then
								if n_top.name == "air" then
									dbg("Spawn: "..plant_to_spawn.." on top of ("..dump(pos).."); facedir="..fdir)
									minetest.add_node(p_top, { name = plant_to_spawn, param2 = fdir })
								end
							elseif biome.spawn_replace_node then


								dbg("Spawn: "..plant_to_spawn.." to replace "..minetest.get_node(pos).name.." at ("..dump(pos)..")")
								minetest.add_node(pos, { name = plant_to_spawn, param2 = fdir })


							elseif biome.spawn_on_side then
								local onside = find_open_side(pos)
								if onside then 
									dbg("Spawn: "..plant_to_spawn.." at side of ("..dump(pos).."), facedir "..onside.facedir.."")
									minetest.add_node(onside.newpos, { name = plant_to_spawn, param2 = onside.facedir })
								end
							elseif biome.spawn_on_bottom then
								if minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name == "air" then
									dbg("Spawn: "..plant_to_spawn.." on bottom of ("..dump(pos)..")")
									minetest.add_node({x=pos.x, y=pos.y-1, z=pos.z}, { name = plant_to_spawn, param2 = fdir} )
								end
							end
						end
					end
				end
			end
		end
	})
end

