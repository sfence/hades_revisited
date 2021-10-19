local S = minetest.get_translator("orienteering")

local orienteering = {}
orienteering.playerhuds = {}
orienteering.settings = {}
orienteering.settings.speed_unit = S("m/s")
orienteering.settings.length_unit = S("m")
orienteering.settings.hud_pos = { x = 1, y = 0.4 }
orienteering.settings.hud_offset = { x = -15, y = 0 }
orienteering.settings.hud_alignment = { x = -1, y = -1 }

-- No user settings, HUD position is hardcoded

local o_lines = 3 -- Number of lines in HUD

-- Helper function to switch between 12h and 24 mode for the time
function orienteering.toggle_time_mode(itemstack, user, pointed_thing)
	--[[ Player attribute “orienteering:twelve”:
	* "true": Use 12h mode for time
	* "false" or unset: Use 24h mode for time ]]
	local meta = user:get_meta()
	if meta:get_string("orienteering:twelve") == "true" then
		meta:set_string("orienteering:twelve", "false")
	else
		meta:set_string("orienteering:twelve", "true")
	end
	orienteering.update_hud_displays(user)
end

local use = S("Put this tool in your hotbar to see the data it provides.")
local use_tt = S("Put in Equipment or hotbar slot to activate")
local use_time = S("Put this tool in your hotbar to make use of its functionality. Leftclick to toggle between 24-hour and 12-hour display for the time feature.")

-- Displays height (Y)
minetest.register_tool("orienteering:altimeter", {
	description = S("Altimeter"),
	_tt_help = S("Shows your elevation").."\n"..use_tt,
	_doc_items_longdesc = S("It shows you your current elevation (Y)."),
	_doc_items_usagehelp = use,
	wield_image = "orienteering_altimeter.png",
	inventory_image = "orienteering_altimeter.png",
	groups = { equipment = 1, disable_repair = 1 },
})

-- Displays X and Z coordinates
minetest.register_tool("orienteering:triangulator", {
	description = S("Triangulator"),
	_tt_help = S("Shows your horizontal coordinates").."\n"..use_tt,
	_doc_items_longdesc = S("It shows you the coordinates of your current position in the horizontal plane (X and Z)."),
	_doc_items_usagehelp = use,
	wield_image = "orienteering_triangulator.png",
	inventory_image = "orienteering_triangulator.png",
	groups = { equipment = 1, disable_repair = 1 },
})

-- Displays player yaw
-- TODO: calculate yaw difference between 2 points
minetest.register_tool("orienteering:compass", {
	description = S("Compass"),
	_tt_help = S("Shows the cardinal direction you're looking at").."\n"..use_tt,
	_doc_items_longdesc = S("It shows where you're looking: North, East, South or West."),
	_doc_items_usagehelp = use,
	wield_image = "orienteering_compass_wield.png",
	inventory_image = "orienteering_compass_inv.png",
	groups = { equipment = 1, disable_repair = 1 },
})

-- Ultimate orienteering tool: Displays X,Y,Z, yaw, pitch, time, speed and enables the minimap
minetest.register_tool("orienteering:quadcorder", {
	description = S("Quadcorder"),
	_tt_help = S("Shows your coordinates, cardinal direction, pitch, time, speed and enables minimap").."\n"..use_tt,
	_doc_items_longdesc = S("This is the ultimate orientieering tool. It shows you your coordinates (X, Y and Z), shows the cardinal direction, the current time, your current speed and it enables you to access the minimap."),
	wield_image = "orienteering_quadcorder.png",
	_doc_items_usagehelp = use_time,
	wield_scale = { x=1, y=1, z=3.5 },
	inventory_image = "orienteering_quadcorder.png",
	groups = { equipment = 1, disable_repair = 1 },
	on_use = orienteering.toggle_time_mode,
})

-- Displays game time
minetest.register_tool("orienteering:watch", {
	description = S("Watch"),
	_tt_help = S("Shows the time").."\n"..use_tt,
	_doc_items_longdesc = S("It shows you the current time."),
	_doc_items_usagehelp = S("Put the watch in your hotbar to see the time. Leftclick to toggle between the 24-hour and 12-hour display."),
	wield_image = "orienteering_watch.png",
	inventory_image = "orienteering_watch.png",
	groups = { equipment = 1, disable_repair = 1 },
	on_use = orienteering.toggle_time_mode,
})

-- Displays speed
minetest.register_tool("orienteering:speedometer", {
	description = S("Speedometer"),
	_tt_help = S("Shows your speed").."\n"..use_tt,
	_doc_items_longdesc = S("It shows you your current horizontal (“hor.”) and vertical (“ver.”) speed in meters per second, where one meter is the side length of a single cube."),
	_doc_items_usagehelp = use,
	wield_image = "orienteering_speedometer_wield.png",
	inventory_image = "orienteering_speedometer_inv.png",
	groups = { equipment = 1, disable_repair = 1 },
})

-- Enables minimap
minetest.register_tool("orienteering:automapper", {
	description = S("Automapper"),
	_tt_help = S("Allows using the minimap").."\n"..use_tt,
	_doc_items_longdesc = S("The automapper automatically creates a map of the area around you and enables you to view a minimap of your surroundings. It also has a built-in radar."),
	_doc_items_usagehelp = S("If you put an automapper in your hotbar, you will be able to access the minimap. By default the minimap can be opened with [F7]."),
	wield_image = "orienteering_automapper_wield.png",
	wield_scale = { x=1, y=1, z=2 },
	inventory_image = "orienteering_automapper_inv.png",
	groups = { equipment = 1, disable_repair = 1 },
})

-- Displays X,Y,Z coordinates, yaw and game time
minetest.register_tool("orienteering:gps", {
	description = S("GPS device"),
	_tt_help = S("Shows your coordinates, cardinal direction and the time").."\n"..use_tt,
	_doc_items_longdesc = S("The GPS device shows you your coordinates (X, Y and Z), your cardinal direction and the time."),
	_doc_items_usagehelp = use_time,
	wield_image = "orienteering_gps_wield.png",
	wield_scale = { x=1, y=1, z=2 },
	inventory_image = "orienteering_gps_inv.png",
	groups = { equipment = 1, disable_repair = 1 },
	on_use = orienteering.toggle_time_mode,
})

if minetest.get_modpath("hades_core") ~= nil then
	-- Register crafts
	minetest.register_craft({
		output = "orienteering:altimeter",
		recipe = {
			{"hades_core:glass"},
			{"hades_core:steel_ingot"},
			{"hades_core:steel_ingot"},
		}
	})
	minetest.register_craft({
		output = "orienteering:triangulator",
		recipe = {
			{"", "hades_core:bronze_ingot", ""},
			{"hades_core:bronze_ingot", "", "hades_core:bronze_ingot"},
		}
	})
	minetest.register_craft({
		output = "orienteering:compass",
		recipe = {
			{"", "hades_core:tin_ingot", ""},
			{"hades_core:tin_ingot", "group:stick", "hades_core:tin_ingot"},
			{"", "hades_core:tin_ingot", ""},
		}
	})
	minetest.register_craft({
		output = "orienteering:speedometer",
		recipe = {
			{"", "hades_core:gold_ingot", ""},
			{"hades_core:steel_ingot", "group:stick", "hades_core:steel_ingot"},
			{"", "hades_core:steel_ingot", ""},
		}
	})
	minetest.register_craft({
		output = "orienteering:automapper",
		recipe = {
			{"hades_core:gold_ingot", "hades_core:gold_ingot", "hades_core:gold_ingot"},
			{"hades_core:emerald", "hades_core:sapphire", "hades_core:emerald"},
			{"hades_core:gold_ingot", "hades_core:gold_ingot", "hades_core:gold_ingot"}
		}
	})
	minetest.register_craft({
		output = "orienteering:gps",
		recipe = {
			{ "hades_core:gold_ingot", "orienteering:triangulator", "hades_core:gold_ingot" },
			{ "orienteering:compass", "hades_core:bronze_ingot", "orienteering:watch" },
                        { "hades_core:tin_ingot", "orienteering:altimeter", "hades_core:tin_ingot" }
		}
	})
	minetest.register_craft({
		output = "orienteering:quadcorder",
		recipe = {
			{ "hades_core:gold_ingot", "hades_core:gold_ingot", "hades_core:gold_ingot" },
			{ "hades_core:bronze_ingot", "hades_core:prismatic_gem", "orienteering:automapper", },
                        { "orienteering:speedometer", "hades_core:diamond", "orienteering:gps" }
		}
	})
	minetest.register_craft({
		output = "orienteering:watch",
		recipe = {
			{ "hades_core:copper_ingot" },
			{ "hades_core:glass" },
			{ "hades_core:copper_ingot" }
		}
	})

end

-- Replace Minetest Game's mapping kit
if minetest.get_modpath("map") then
	minetest.unregister_item("map:mapping_kit")
	minetest.register_alias("map:mapping_kit", "orienteering:automapper")
end

function orienteering.update_automapper(player)
	if orienteering.tool_active(player, "orienteering:automapper") or orienteering.tool_active(player, "orienteering:quadcorder") or minetest.is_creative_enabled(player:get_player_name()) then
		player:hud_set_flags({minimap = true})
	else
		player:hud_set_flags({minimap = false})
	end
end

function orienteering.update_compass(player)
	if orienteering.tool_active(player, "orienteering:compass") or orienteering.tool_active(player, "orienteering:quadcorder") then
		hades_compass.enable(player)
	else
		hades_compass.disable(player)
	end
end

-- Checks whether a certain orienteering tool is “active” and ready for use
function orienteering.tool_active(player, item)
	return hades_equipment.has_equipped(player, item, true)
end

function orienteering.init_hud(player)
	orienteering.update_automapper(player)
	orienteering.update_compass(player)
	local name = player:get_player_name()
	orienteering.playerhuds[name] = {}
	for i=1, o_lines do
		orienteering.playerhuds[name]["o_line"..i] = player:hud_add({
			hud_elem_type = "text",
			text = "",
			position = orienteering.settings.hud_pos,
			offset = { x = orienteering.settings.hud_offset.x, y = orienteering.settings.hud_offset.y + 20*(i-1) },
			alignment = orienteering.settings.hud_alignment,
			number = 0xFFFFFF,
			scale= { x = 100, y = 20 },
		})
	end
end

function orienteering.update_hud_displays(player)
	local toDegrees=180/math.pi
	local name = player:get_player_name()
	if not orienteering.playerhuds[name] then
		return
	end
	local gps, altimeter, triangulator, compass, watch, speedometer, quadcorder

	if orienteering.tool_active(player, "orienteering:gps") then
		gps = true
	end
	if orienteering.tool_active(player, "orienteering:altimeter") then
		altimeter = true
	end
	if orienteering.tool_active(player, "orienteering:triangulator") then
		triangulator = true
	end
	if orienteering.tool_active(player, "orienteering:compass") then
		compass = true
	end
	if orienteering.tool_active(player, "orienteering:watch") then
		watch = true
	end
	if orienteering.tool_active(player, "orienteering:speedometer") then
		speedometer = true
	end
	if orienteering.tool_active(player, "orienteering:quadcorder") then
		quadcorder = true
	end

	local str_pos, str_time, str_speed
	local pos = vector.round(player:get_pos())
	if (altimeter and triangulator) or gps or quadcorder then
		str_pos = S("Coordinates: X=@1, Y=@2, Z=@3", pos.x, pos.y, pos.z)
	elseif altimeter then
		str_pos = S("Height: Y=@1", pos.y)
	elseif triangulator then
		str_pos = S("Coordinates: X=@1, Z=@2", pos.x, pos.z)
	else
		str_pos = ""
	end

	local time = minetest.get_timeofday()
	if watch or gps or quadcorder then
		local totalminutes = time * 1440
		local minutes = totalminutes % 60
		local hours = math.floor((totalminutes - minutes) / 60)
		minutes = math.floor(minutes)
		local twelve = player:get_meta():get_string("orienteering:twelve") == "true"
		if twelve then
			if hours == 12 and minutes == 0 then
				str_time = S("Time: noon")
			elseif hours == 0 and minutes == 0 then
				str_time = S("Time: midnight")
			else
				local hours12 = math.fmod(hours, 12)
				if hours12 == 0 then hours12 = 12 end
				if hours >= 12 then
					str_time = S("Time: @1:@2 p.m.", string.format("%i", hours12), string.format("%02i", minutes))
				else
					str_time = S("Time: @1:@2 a.m.", string.format("%i", hours12), string.format("%02i", minutes))
				end
			end
		else
			str_time = S("Time: @1:@2", string.format("%02i", hours), string.format("%02i", minutes))
		end
	else
		str_time = ""
	end

	if speedometer or quadcorder then
		local speed_hor, speed_ver
		local v
		local attach = player:get_attach()
		if attach == nil then
			v = player:get_velocity()
		else
			v = attach:get_velocity()
			if not v then
				v = player:get_velocity()
			end
		end
		speed_ver = v.y
		v.y = 0
		speed_hor = vector.length(v)

		local u = orienteering.settings.speed_unit
		str_speed = S("Speed: hor.: @1 @2, vert.: @3 @4", string.format("%.1f", speed_hor), u, string.format("%.1f", speed_ver), u)
	else
		str_speed = ""
	end

	local strs = { str_pos, str_time, str_speed }
	local line = 1
	for i=1, o_lines do
		if strs[i] ~= "" then
			player:hud_change(orienteering.playerhuds[name]["o_line"..line], "text", strs[i])
			line = line + 1
		end
	end
	for l=line, o_lines do
		player:hud_change(orienteering.playerhuds[name]["o_line"..l], "text", "")
	end
end

minetest.register_on_newplayer(orienteering.init_hud)
minetest.register_on_joinplayer(orienteering.init_hud)

minetest.register_on_leaveplayer(function(player)
	orienteering.playerhuds[player:get_player_name()] = nil
end)

local updatetimer = 0
minetest.register_globalstep(function(dtime)
	updatetimer = updatetimer + dtime
	if updatetimer > 0.1 then
		local players = minetest.get_connected_players()
		for i=1, #players do
			orienteering.update_automapper(players[i])
			orienteering.update_compass(players[i])
			orienteering.update_hud_displays(players[i])
		end
		updatetimer = 0
	end
end)

if minetest.get_modpath("awards") ~= nil and minetest.get_modpath("hades_core") ~= nil then
	awards.register_achievement("orienteering_quadcorder", {
		title = S("Master of Orienteering"),
		description = S("Craft a quadcorder."),
		icon = "orienteering_quadcorder.png",
		trigger = {
			type = "craft",
			item = "orienteering:quadcorder",
			target = 1
		}
	})
end
