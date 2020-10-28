local S = minetest.get_translator("hades_tt")

local function get_min_digtime(caps)
	local mintime
	local unique = true
	local maxlevel = caps.maxlevel
	if not maxlevel then
		maxlevel = 1
	end
	if maxlevel > 1 then
		unique = false
	end
	if caps.times then
		for r=1,3 do
			local time = caps.times[r]
			if time and maxlevel > 1 then
				time = time / maxlevel
			end
			if time and ((not mintime) or (time < mintime)) then
				if mintime and (time < mintime) then
					unique = false
				end
				mintime = time
			end
		end
	end
	return mintime, unique
end

local function newline(str)
	if str ~= "" then
		str = str .. "\n"
	end
	return str
end

-- Tool information (digging times, weapon stats)
tt.register_snippet(function(itemstring)
	local def = minetest.registered_items[itemstring]
	local desc = ""
	if def.tool_capabilities then
		-- Weapon stats
		if def.tool_capabilities.damage_groups then
			for group, damage in pairs(def.tool_capabilities.damage_groups) do
				local msg
				if group == "fleshy" then
					if damage >= 0 then
						msg = S("Damage: @1", damage)
					else
						msg = S("Healing: @1", math.abs(damage))
					end
				else
					if damage >= 0 then
						msg = S("Damage (@1): @2", group, damage)
					else
						msg = S("Healing (@1): @2", group, math.abs(damage))
					end
				end
				desc = newline(desc)
				desc = desc .. msg
			end
			local full_punch_interval = def.tool_capabilities.full_punch_interval
			if not full_punch_interval then
				full_punch_interval = 1
			end
			desc = newline(desc)
			desc = desc .. S("Full punch interval: @1s", string.format("%.2f", full_punch_interval))
		end
	end
	if desc == "" then
		desc = nil
	end
	return desc
end)

-- Node info
tt.register_snippet(function(itemstring)
	local def = minetest.registered_items[itemstring]
	local desc = ""

	-- Health-related node facts
	if def.damage_per_second then
		if def.damage_per_second > 0 then
			desc = newline(desc)
			desc = desc .. minetest.colorize(tt.COLOR_DANGER, S("Contact damage: @1 per second", def.damage_per_second))
		elseif def.damage_per_second < 0 then
			desc = newline(desc)
			desc = desc .. minetest.colorize(tt.COLOR_GOOD, S("Contact healing: @1 per second", math.abs(def.damage_per_second)))
		end
	end
	if def.drowning and def.drowning ~= 0 then
		desc = newline(desc)
		desc = desc .. minetest.colorize(tt.COLOR_DANGER, S("Drowning damage: @1", def.drowning))
	end
	local tmp = minetest.get_item_group(itemstring, "fall_damage_add_percent")
	if tmp > 0 then
		desc = newline(desc)
		desc = desc .. minetest.colorize(tt.COLOR_DANGER, S("Fall damage: +@1%", tmp))
	elseif tmp == -100 then
		desc = newline(desc)
		desc = desc .. minetest.colorize(tt.COLOR_GOOD, S("No fall damage"))
	elseif tmp < 0 then
		desc = newline(desc)
		desc = desc .. minetest.colorize(tt.COLOR_DEFAULT, S("Fall damage: @1%", tmp))
	end

	-- Movement-related node facts
	if minetest.get_item_group(itemstring, "disable_jump") == 1 and not def.climbable then
		if def.liquidtype == "none" then
			desc = newline(desc)
			desc = desc .. minetest.colorize(tt.COLOR_DEFAULT, S("No jumping"))
		elseif minetest.get_item_group(itemstring, "fake_liquid") == 0 then
			desc = newline(desc)
			desc = desc .. minetest.colorize(tt.COLOR_DEFAULT, S("No swimming upwards"))
		else
			desc = newline(desc)
			desc = desc .. minetest.colorize(tt.COLOR_DEFAULT, S("No rising"))
		end
	end
	if def.climbable then
		if minetest.get_item_group(itemstring, "disable_jump") == 1 then
			desc = newline(desc)
			desc = desc .. minetest.colorize(tt.COLOR_DEFAULT, S("Climbable (only downwards)"))
		else
			desc = newline(desc)
			desc = desc .. minetest.colorize(tt.COLOR_DEFAULT, S("Climbable"))
		end
	end
	if minetest.get_item_group(itemstring, "slippery") >= 1 then
		desc = newline(desc)
		desc = desc .. minetest.colorize(tt.COLOR_DEFAULT, S("Slippery"))
	end
	local tmp = minetest.get_item_group(itemstring, "bouncy")
	if tmp >= 1 then
		desc = newline(desc)
		desc = desc .. minetest.colorize(tt.COLOR_DEFAULT, S("Bouncy (@1%)", tmp))
	end

	-- Node appearance
	tmp = def.light_source
	if tmp and tmp >= 1 then
		desc = newline(desc)
		desc = desc .. minetest.colorize(tt.COLOR_DEFAULT, S("Luminance: @1", tmp))
	end


	if desc == "" then
		desc = nil
	end
	return desc, false
end)

-- Food stats
tt.register_snippet(function(itemstring)
	local is_food = minetest.get_item_group(itemstring, "food") ~= 0
	local sate = minetest.get_item_group(itemstring, "eatable")
	if is_food and sate >= 0 then
		return S("Food points: +@1", sate)
	end
end)

-- Other groups
tt.register_snippet(function(itemstring)
	local flora = minetest.get_item_group(itemstring, "flora")
	if flora ~= 0 then
		return S("Spreads on Dirt with Grass")
	end
end)
