local S = minetest.get_translator("hades_beds")

-- helper functions

function hades_beds.on_rightclick(pos, player)
	hades_beds.set_spawn(player, pos)
end

-- Returns true if players can spawn into the given node safely.
local function node_is_spawnable_in(node, is_upper)
	-- All non-walkable, non-damaging, non-drowning nodes are safe.
	-- Also the bed as a special case for the lower check.
	if not node then
		return false
	end
	if not is_upper and minetest.get_item_group(node.name, "bed") ~= 0 then
		return true
	end
	local def = minetest.registered_nodes[node.name]
	if not def.walkable and def.drowning <= 0 and def.damage_per_second <= 0 then
		return true
	end
	return false
end

-- Returns true if players can spawn on given node safely (without falling).
local function node_is_spawnable_on(node)
	-- All walkable full cube nodes that don't disable jump are accepted
	if not node then
		return false
	end
	local def = minetest.registered_nodes[node.name]
	if def.walkable and
			((def.collision_box == nil and def.node_box == nil) or
			(not def.collision_box and def.node_box and def.node_box.type == "regular") or
			(not def.node_box and def.collision_box and def.collision_box.type == "regular")) and
			(minetest.get_item_group(node.name, "disable_jump") == 0) then
		return true
	end
	return false
end

-- callbacks

local attempt_bed_respawn = function(player)
	-- Place player on respawn position if set
	local name = player:get_player_name()
	local pos = hades_beds.get_spawn(player)
	if pos then
		local check_posses = {
			{ x=0, y=0, z=0 },
			{ x=0, y=0, z=-1 },
			{ x=0, y=0, z=1 },
			{ x=-1, y=0, z=0 },
			{ x=1, y=0, z=0 },
			{ x=-1, y=0, z=-1 },
			{ x=-1, y=0, z=1 },
			{ x=1, y=0, z=-1 },
			{ x=1, y=0, z=1 },
		}
		-- Check if position is safe, if not, try to spawn to one of the
		-- neighbor blocks
		for n=1, #check_posses do
			local cpos = vector.add(pos, check_posses[n])
			local node = minetest.get_node(cpos)
			if node_is_spawnable_in(node, false) then
				local is_bed = minetest.get_item_group(node.name, "bed") ~= 0
				-- Check posses above (must be free)
				-- and below (must be walkable)
				local acpos = { x=cpos.x, y=cpos.y+1, z=cpos.z }
				local abpos = { x=cpos.x, y=cpos.y-1, z=cpos.z }
				local anode = minetest.get_node(acpos)
				local bnode = minetest.get_node(abpos)
				if node_is_spawnable_in(anode, true) and ((n == 1 and is_bed) or node_is_spawnable_on(bnode)) then
					local spos = cpos
					if not is_bed then
						spos.y = spos.y - 0.5
					end
					player:set_pos(spos)
					return true
				end
			end
		end
		hades_beds.unset_spawn(player)
		minetest.chat_send_player(name, minetest.colorize("#FFFF00", S("Your respawn position was blocked or dangerous. You've lost your old respawn position.")))
		return false
	end
	return false
end

minetest.register_on_respawnplayer(attempt_bed_respawn)

minetest.register_on_leaveplayer(function(player)
	local name = player:get_player_name()
	hades_beds.player[name] = nil
end)

