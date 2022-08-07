local S = minetest.get_translator("hades_death_messages")
local N = function(s) return s end

hades_death_messages = {}

-- Death messages
local msgs = {
	["drown"] = {
		N("Drowning"),
	},
	["drown_water"] = {
		N("Drowning in water"),
	},
	["drown_lava"] = {
		N("Drowning in lava"),
	},
	["node"] = {
		N("Damage from a block"),
	},
	["projectile_mese_arrow"] = {
		N("Shot by a mese monster crystal shard"),
	},
	["projectile_fireball"] = {
		N("Shot by a fireball"),
	},
	["murder"] = {
		N("Melee attack from an unknown source"),
	},
	["murder_any"] = {
		N("Melee attack from an unknown source"),
	},
	["mob_kill"] = {
		N("Hit from a hostile creature"),
	},
	["fall"] = {
		N("Falling"),
	},
	["other"] = {
		N("Unknown"),
	}
}

local mobkills = {
	["mobs_hades:mutant"] = N("Punch from a mutant"),
	["mobs_hades:cave_master"] = N("Hit from a cave master"),
	["mobs_hades:cave_elder"] = N("Hit from a cave elder"),
	["mobs_hades:mese_monster"] = N("Headbutt from a mese monster"),
	["mobs_hades:deep_mese_monster"] = N("Headbutt from a deep mese monster"),
	["mobs_hades:oerkki"] = N("Hit from an oerkki"),
	["mobs_hades:stone_monster"] = N("Hit from a stone monster"),
	["mobs_hades:deep_stone_monster"] = N("Hit from a deep stone monster"),
	["mobs_hades:spider_gold"] = N("Bite from a gold spider"),
	["mobs_hades:spider_sapphire"] = N("Bite from a sapphire spider"),
	["mobs_hades:spider_ruby"] = N("Bite from a ruby spider"),
	["mobs_hades:spider_mese"] = N("Bite from a mese spider"),
}

-- Select death message
local smsg = function(msg)
	return S("Cause of death: @1.", msg)
end

local dmsg = function(mtype, ...)
	local r = math.random(1, #msgs[mtype])
	return S("Cause of death: @1.", S(msgs[mtype][r], ...))
end

-- Select death message for death by mob
local mmsg = function(mtype, ...)
	if mobkills[mtype] then
		return S("Cause of death: @1.", S(mobkills[mtype], ...))
	else
		return dmsg("mob_kill", ...)
	end
end

local last_damages = { }

minetest.register_on_dieplayer(function(player, reason)
	-- Death message
	local message = minetest.settings:get_bool("hades_show_death_messages", true)
	if message == nil then
		message = true
	end
	if message then
		local name = player:get_player_name()
		if not name then
			return
		end
		local msg
		if last_damages[name] then
			-- custom message
			msg = smsg(last_damages[name].message)
		elseif reason.type == "node_damage" then
			local pos = player:get_pos()
			local node = reason.node
			local node_def = minetest.registered_nodes[node]
			if node_def and node_def._hades_node_death_message then
				local field = node_def._hades_node_death_message
				local field_msg
				if type(field) == "table" then
					field_msg = field[math.random(1, #field)]
				else
					field_msg = field
				end
				local textdomain
				if node_def.mod_origin then
					textdomain = node_def.mod_origin
				else
					textdomain = "hades_death_messages"
				end
				-- We assume the textdomain of the death message in the node definition
				-- equals the modname.
				msg = smsg(minetest.translate(textdomain, field_msg))
			else
				msg = dmsg("node")
			end
		elseif reason.type == "drown" then
			local pos = player:get_pos()
			-- check "head position" to estimate in which node the player drowned
			local cpos = {x=pos.x,y=pos.y+1,z=pos.z}
			local dnode = minetest.get_node(cpos)
			if minetest.get_item_group(dnode.name, "water") then
				msg = dmsg("drown_water")
			elseif minetest.get_item_group(dnode.name, "lava") then
				msg = dmsg("drown_lava")
			else
				msg = dmsg("drown")
			end
		elseif reason.type == "punch" then
		-- Punches
			local hitter = reason.object
			local hittername, hittertype, hittersubtype, shooter
			-- Custom message
			if last_damages[name] then
				msg = smsg(last_damages[name].message)
			-- Unknown hitter
			elseif hitter == nil then
				msg = dmsg("murder_any")
			-- Player
			elseif hitter:is_player() then
				hittername = hitter:get_player_name()
				if hittername ~= nil then
					msg = dmsg("murder", hittername)
				else
					msg = dmsg("murder_any")
				end
			-- Mob (according to Common Mob Interface)
			elseif hitter:get_luaentity()._cmi_is_mob then
				if hitter:get_luaentity().nametag and hitter:get_luaentity().nametag ~= "" then
					hittername = hitter:get_luaentity().nametag
				end
				hittersubtype = hitter:get_luaentity().name
				if hittername then
					msg = dmsg("murder", hittername)
				elseif hittersubtype ~= nil and hittersubtype ~= "" then
					msg = mmsg(hittersubtype)
				else
					msg = dmsg("murder_any")
				end
			elseif hitter:get_luaentity().name == "mobs_hades:mese_arrow" then
				msg = dmsg("projectile_mese_arrow")
			elseif hitter:get_luaentity().name == "mobs_hades:fireball" then
				msg = dmsg("projectile_fireball")
			end
		-- Falling
		elseif reason.type == "fall" then
			msg = dmsg("fall")
		-- Other
		elseif reason.type == "set_hp" then
			if last_damages[name] then
				msg = smsg(last_damages[name].message)
			end
		end
		if not msg then
			msg = dmsg("other")
		end
		-- Send message after short delay so it appears after "You died.".
		minetest.after(0.25, function(data)
			minetest.chat_send_player(data.name, minetest.colorize("#FF8080", data.msg))
		end, {name=name, msg=msg})
		last_damages[name] = nil
	end
end)

-- dmg_sequence_number is used to discard old damage events
local dmg_sequence_number = 0
local start_damage_reset_countdown = function (player, sequence_number)
	minetest.after(1, function(playername, sequence_number)
		if last_damages[playername] and last_damages[playername].sequence_number == sequence_number then
			last_damages[playername] = nil
		end
	end, player:get_player_name(), sequence_number)
end

-- Send a custom death mesage when damaging a player via set_hp or punch.
-- To be called directly BEFORE damaging a player via set_hp or punch.
-- The next time the player dies due to a set_hp, the message will be shown.
-- The player must die via set_hp within 0.1 seconds, otherwise the message will be discarded.
function hades_death_messages.player_damage(player, message)
	last_damages[player:get_player_name()] = { message = message, sequence_number = dmg_sequence_number }
	start_damage_reset_countdown(player, dmg_sequence_number)
	dmg_sequence_number = dmg_sequence_number + 1
	if dmg_sequence_number >= 65535 then
		dmg_sequence_number = 0
	end
end

