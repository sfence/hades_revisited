local S = minetest.get_translator("hades_commands")

minetest.register_chatcommand("hp", {
	privs = {server=true},
	params = S("[<player>] <value>"),
	description = S("Set health points of player or yourself"),
	func = function(name, param)
		if minetest.settings:get_bool("enable_damage") == false then
			return false, S("Not possible, damage is disabled.")
		end
		local targetname, hp = string.match(param, "(%S+) (%S+)")
		if not targetname then
			hp = param
		end
		hp = tonumber(hp)
		if not hp then
			return false, S("Invalid health!")
		end
		if not targetname then
			targetname = name
		end
		local target = minetest.get_player_by_name(targetname)
		if target == nil or not target:is_player() then
			return false, S("Player @1 does not exist.", targetname)
		end
		if name == targetname then
			hades_death_messages.player_damage(target, S("A death wish"))
		else
			-- You took damage from "a higher power" ;-)
			hades_death_messages.player_damage(target, S("A higher power"))
		end
		target:set_hp(hp)
		return true
	end,
})

