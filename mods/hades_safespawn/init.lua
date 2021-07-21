local S = minetest.get_translator("hades_safespawn")

local function find_safe_nearby_pos(data)
	local player = data.player
	if not player or not player:is_player() then
		return false
	end
	local attempt = data.attempt or 0
	local pos = player:get_pos()
	local safe = false
	local node = minetest.get_node(pos)
	if node.name == "ignore" then
		attempt = attempt + 1
		if attempt >= 5 then
			-- Give up after too many attempts
			minetest.log("action", "Safe spawn check for "..player:get_player_name().." failed. Got 'ignore' nodes too many times in row")
			return false
		end
		-- Area is not loaded yet... Try again later
		minetest.log("info", "Safe spawn check for "..player:get_player_name().." not possible due to unloaded area (attempt #"..attempt.."). Trying again ...")
		minetest.after(1, find_safe_nearby_pos, {player=player, attempt=attempt+1})
		return false
	elseif attempt > 0 then
		minetest.log("info", "Safe spawn check for "..player:get_player_name().." is now possible (attempt #"..attempt.."). Starting check ...")
	end
	-- First check if we have solid land to walk on
	for b=1, 6 do
		local below = minetest.get_node({x=pos.x, y=pos.y-b, z=pos.z})
		if minetest.get_item_group(below.name, "lava") ~= 0 then
			break
		end
		local bdef = minetest.registered_nodes[below.name]
		if bdef.walkable then
			safe = true
			break
		end
	end
	if safe then
		-- Lava below, in or above player = unsafe (obviously)
		local p1 = {x=pos.x, y=pos.y-1, z=pos.z}
		local p2 = {x=pos.x, y=pos.y+2, z=pos.z}
		local lavas = minetest.find_nodes_in_area(p1, p2, {"group:lava"})
		if #lavas > 0 then
			safe = false
		end
	end
	-- It's not safe to spawn here ...
	if not safe then
		-- Activate safety teleport!
		local p1 = {x=pos.x-8, y=pos.y, z=pos.z-8}
		local p2 = {x=pos.x+8, y=pos.y+8, z=pos.z+8}

		-- TODO: Generalize to any "solid" node
		local nodes = minetest.find_nodes_in_area_under_air(p1, p2, {"group:ash", "group:sand", "group:stone", "group:dirt", "group:gravel"})
		-- TODO: Check nodes in random order
		local pname = player:get_player_name()
		for n=1, #nodes do
			local tpos = nodes[n]
			tpos.y = tpos.y + 1
			local tpos_above = {x=tpos.x, y=tpos.y+1, z=tpos.z}
			local n_above = minetest.get_node(tpos_above)
			if n_above.name == "air" then
				player:set_pos(tpos)
				minetest.log("action", pname.." got a spawn safety teleportion from "..minetest.pos_to_string(pos, 1).." to "..minetest.pos_to_string(tpos, 1))
				if attempt > 0 then
					--[[ Show player message on safety teleport, but only
					on first attempt, because those safety teleports are supposed
					to be invisible to the player, just like a regular spawn.
					Only if there were multiple attempts will there be a message
					because in this case, the player can actually briefly see
					the danger (i.e. falling right into a lava lake) before
					teleporting. ]]
					minetest.chat_send_player(pname, minetest.colorize("#00FFFF", S("Danger zone detected. Safety teleportation activated.")))
					minetest.sound_play({name="hades_player_respawn"}, {to_player=pname}, true)
				end
				return true
			end
		end
		if #nodes == 0 then
			minetest.log("action", pname.." had an unsafe spawn at "..minetest.pos_to_string(pos, 1).." but no safe alternative spawn spot could be found.")
			minetest.chat_send_player(pname, minetest.colorize("#FFFF00", S("Danger zone detected, and the safety teleportation failed. Good luck!")))
			return true
		end
	end
	minetest.log("verbose", "Safe spawn check for "..player:get_player_name().." thinks this spawn is safe. Nothing to do")
end

local on_spawn = function(player)
	minetest.after(0, find_safe_nearby_pos, {player=player})
end

minetest.register_on_newplayer(function(player)
	on_spawn(player)
end)
minetest.register_on_respawnplayer(function(player)
	on_spawn(player)
end)
