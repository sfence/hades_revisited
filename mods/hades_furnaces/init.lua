local S = minetest.get_translator("hades_furnaces")

--
-- Formspecs
--

local formspec_info = {
	["hades_furnaces:furnace"] = {
		bg = "gui_furnace_bg.png", bg9middle = "36,36,-34,-34", flame_bg = "default_furnace_fire_bg.png", flame_fg = "default_furnace_fire_fg.png",
		output_slots = "4.75,1.5;1,1"
	},
	["hades_furnaces:prism_furnace"] = {
		bg = "gui_prism_furnace_bg.png", bg9middle = "39,36,-36,-37", flame_bg = "hades_furnaces_prism_furnace_fire_bg.png", flame_fg = "hades_furnaces_prism_furnace_fire_fg.png",
		output_slots = "4.75,0.96;2,2"
	},
}

local function active_formspec(ftype, fuel_percent, item_percent)
	return
	"size[8,8.5]"..
	"background9[30,30;8,8.5;"..formspec_info[ftype].bg..";true;"..formspec_info[ftype].bg9middle.."]"..
	"list[current_name;src;2.75,0.5;1,1;]"..
	"list[current_name;fuel;2.75,2.5;1,1;]"..
	"image[2.75,1.5;1,1;"..formspec_info[ftype].flame_bg.."^[lowpart:"..
	(100-fuel_percent)..":"..formspec_info[ftype].flame_fg.."]"..
	"image[3.75,1.5;1,1;gui_furnace_arrow_bg.png^[lowpart:"..
	(item_percent)..":gui_furnace_arrow_fg.png^[transformR270]"..
	"list[current_name;dst;"..formspec_info[ftype].output_slots..";]"..
	"list[current_player;main;0,4.25;8,1;]"..
	"list[current_player;main;0,5.5;8,3;8]"..
	"listring[current_name;dst]"..
	"listring[current_player;main]"..
	"listring[current_name;src]"..
	"listring[current_player;main]"..
	"listring[current_name;fuel]"..
	"listring[current_player;main]"
end

local function inactive_formspec(ftype)
	return
	"size[8,8.5]"..
	"background9[30,30;8,8.5;"..formspec_info[ftype].bg..";true;"..formspec_info[ftype].bg9middle.."]"..
	"list[current_name;src;2.75,0.5;1,1;]"..
	"list[current_name;fuel;2.75,2.5;1,1;]"..
	"image[2.75,1.5;1,1;"..formspec_info[ftype].flame_bg.."]"..
	"image[3.75,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]"..
	"list[current_name;dst;"..formspec_info[ftype].output_slots..";]"..
	"list[current_player;main;0,4.25;8,1;]"..
	"list[current_player;main;0,5.5;8,3;8]"..
	"listring[current_name;dst]"..
	"listring[current_player;main]"..
	"listring[current_name;src]"..
	"listring[current_player;main]"..
	"listring[current_name;fuel]"..
	"listring[current_player;main]"
end

--
-- Node callback functions that are the same for active and inactive furnace
--

local function can_dig(pos, player)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	return inv:is_empty("fuel") and inv:is_empty("dst") and inv:is_empty("src")
end

local function allow_metadata_inventory_put(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	if listname == "fuel" then
		if minetest.get_craft_result({method="fuel", width=1, items={stack}}).time ~= 0 then
			if inv:is_empty("src") then
				meta:set_string("infotext", "Furnace is empty")
			end
			return stack:get_count()
		else
			return 0
		end
	elseif listname == "src" then
		return stack:get_count()
	elseif listname == "dst" then
		return 0
	end
end

local function allow_metadata_inventory_move(pos, from_list, from_index, to_list, to_index, count, player)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local stack = inv:get_stack(from_list, from_index)
	return allow_metadata_inventory_put(pos, to_list, to_index, stack, player)
end

local function allow_metadata_inventory_take(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	return stack:get_count()
end

--
-- Node definitions
--


local function swap_node(pos, name)
	local node = minetest.get_node(pos)
	if node.name == name then
		return
	end
	node.name = name
	minetest.swap_node(pos, node)
end

local furnace_types = {
	-- [id] = { description, texture, fuel time addition, initial burn time, output slots }
	["hades_furnaces:furnace"] = { S("Furnace"), S("Smelts and cooks items by using fuel"), "default_furnace", 1.0, 0.75, 1 },
	["hades_furnaces:prism_furnace"] = { S("Prism Furnace"), S("Smelts and cooks items by using fuel").."\n"..S("More efficient than the normal furnace"),  "hades_furnaces_prism_furnace", 1.0, 4.25, 4 },
}

local function furnace_node_timer(pos, elapsed)
	local node = minetest.get_node(pos)
	local id_normal = minetest.registered_nodes[node.name]._furnace_normal
	local id_active = minetest.registered_nodes[node.name]._furnace_active
	--
	-- Inizialize metadata
	--
	local meta = minetest.get_meta(pos)
	local fuel_time = meta:get_float("fuel_time")+furnace_types[id_normal][4]  or 0
	local src_time = meta:get_float("src_time")+furnace_types[id_normal][5] or 0

	local fuel_totaltime = meta:get_float("fuel_totaltime") or 0

	local inv = meta:get_inventory()
	local srclist, fuellist

	local cookable, cooked
	local fuel

	local update = true
	while update do
		update = false

		srclist = inv:get_list("src")
		fuellist = inv:get_list("fuel")

		--
		-- Cooking
		--

		-- Check if we have cookable content
		local aftercooked
		cooked, aftercooked = minetest.get_craft_result({method = "cooking", width = 1, items = srclist})
		cookable = cooked.time ~= 0

		-- Check if we have enough fuel to burn
		if fuel_time < fuel_totaltime then
			-- The furnace is currently active and has enough fuel
			fuel_time = fuel_time + elapsed
			-- If there is a cookable item then check if it is ready yet
			if cookable then
				src_time = src_time + elapsed
				if src_time >= cooked.time then
					-- Place result in dst list if possible
					if inv:room_for_item("dst", cooked.item) then
						inv:add_item("dst", cooked.item)
						inv:set_stack("src", 1, aftercooked.items[1])
						src_time = src_time - cooked.time
						update = true
					end
				end
			end
		else
			-- Furnace ran out of fuel
			if cookable then
				-- We need to get new fuel
				local afterfuel
				fuel, afterfuel = minetest.get_craft_result({method = "fuel", width = 1, items = fuellist})

				if fuel.time == 0 then
					-- No valid fuel in fuel list
					fuel_totaltime = 0
					src_time = 0
				else
					-- Take fuel from fuel list
					inv:set_stack("fuel", 1, afterfuel.items[1])
					update = true
					fuel_totaltime = fuel.time + (fuel_time - fuel_totaltime)
					src_time = src_time + elapsed
				end
			else
				-- We don't need to get new fuel since there is no cookable item
				fuel_totaltime = 0
				src_time = 0
			end
			fuel_time = 0
		end

		elapsed = 0
	end

	if fuel and fuel_totaltime > fuel.time then
		fuel_totaltime = fuel.time
	end
	if srclist[1]:is_empty() then
		src_time = 0
	end

	--
	-- Update formspec, infotext and node
	--
	local formspec
	local item_state
	local item_percent = 0
	if cookable then
		item_percent = math.floor(src_time / cooked.time * 100)
		if item_percent > 100 then
			item_state = S("100% (output full)")
		else
			item_state = S("@1%", item_percent)
		end
	else
		if srclist[1]:is_empty() then
			item_state = S("Empty")
		else
			item_state = S("Not cookable")
		end
	end

	local fuel_state = S("Empty")
	local active = S("inactive")
	local result = false
	if fuel_totaltime ~= 0 then
		active = S("active")
		local fuel_percent = math.floor(fuel_time / fuel_totaltime * 100)
		fuel_state = S("@1%", fuel_percent)
		formspec = active_formspec(id_normal, fuel_percent, item_percent)
		swap_node(pos, id_active)
		-- Furnace burn sound
		if meta:get_int("sound_played") == nil or ( os.time() - meta:get_int("sound_played") ) >= 4 then
			minetest.sound_play("hades_furnaces_burning",{pos=pos},true)
			meta:set_string("sound_played",os.time())
		end
		-- make sure timer restarts automatically
		result = true
	else
		if not fuellist[1]:is_empty() then
			fuel_state = S("@1%", 0)
		end
		formspec = inactive_formspec(id_normal)
		swap_node(pos, id_normal)
		-- stop timer on the inactive furnace
		minetest.get_node_timer(pos):stop()
	end

	local infotext = S("@1 @2",
		minetest.registered_nodes[node.name].description,
		active) .. "\n" ..
		S("(Item: @1; Fuel: @2)",
		item_state,
		fuel_state)

	--
	-- Set meta values
	--
	meta:set_float("fuel_totaltime", fuel_totaltime)
	meta:set_float("fuel_time", fuel_time)
	meta:set_float("src_time", src_time)
	meta:set_string("formspec", formspec)
	meta:set_string("infotext", infotext)

	return result
end

local furnace_ids = {}
for id, finfo in pairs(furnace_types) do
	local desc = finfo[1]
	local tt = finfo[2]
	local tex = finfo[3]
	minetest.register_node(id, {
		description = desc,
		_tt_help = tt,
		tiles = {
			tex.."_top.png", tex.."_bottom.png",
			tex.."_side.png", tex.."_side.png",
			tex.."_side.png", tex.."_front.png"
		},
		paramtype2 = "facedir",
		groups = {cracky=2, furnace=1},
		legacy_facedir_simple = true,
		is_ground_content = false,

		sounds = hades_sounds.node_sound_stone_defaults(),

		on_timer = furnace_node_timer,
		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("formspec", inactive_formspec(id))
			local inv = meta:get_inventory()
			inv:set_size('src', 1)
			inv:set_size('fuel', 1)
			inv:set_size('dst', finfo[6])
		end,
		can_dig = can_dig,

		on_metadata_inventory_move = function(pos)
			minetest.get_node_timer(pos):start(1.0)
		end,
		on_metadata_inventory_put = function(pos)
			minetest.get_node_timer(pos):start(1.0)
		end,

		allow_metadata_inventory_put = allow_metadata_inventory_put,
		allow_metadata_inventory_move = allow_metadata_inventory_move,
		allow_metadata_inventory_take = allow_metadata_inventory_take,

		_furnace_normal = id,
		_furnace_active = id.."_active",
	})

	minetest.register_node(id.."_active", {
		description = desc,
		tiles = {
			tex.."_top.png", tex.."_bottom.png",
			tex.."_side.png", tex.."_side.png",
			tex.."_side.png",
			{
				image = tex.."_front_active.png",
				backface_culling = false,
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 1.5
				},
			}
		},
		paramtype2 = "facedir",
		light_source = 8,
		drop = id,
		groups = {cracky=2, furnace=1, not_in_creative_inventory=1},
		legacy_facedir_simple = true,
		is_ground_content = false,
		sounds = hades_sounds.node_sound_stone_defaults(),

		on_timer = furnace_node_timer,
		can_dig = can_dig,

		allow_metadata_inventory_put = allow_metadata_inventory_put,
		allow_metadata_inventory_move = allow_metadata_inventory_move,
		allow_metadata_inventory_take = allow_metadata_inventory_take,

		_furnace_normal = id,
		_furnace_active = id.."_active",
	})

	--
	-- ABM
	--

	table.insert(furnace_ids, id)
	table.insert(furnace_ids, id.."_active")
end

minetest.register_craft({
	output = 'hades_furnaces:furnace',
	recipe = {
		{'group:stone', 'group:stone', 'group:stone'},
		{'group:stone', '', 'group:stone'},
		{'group:stone', 'group:stone', 'group:stone'},
	}
})

minetest.register_craft({
	output = 'hades_furnaces:prism_furnace',
	recipe = {
		{'hades_core:obsidian', 'hades_core:obsidian', 'hades_core:obsidian'},
		{'hades_core:steel_ingot', 'hades_core:prismatic_gem', 'hades_core:obsidian'},
		{'hades_core:obsidian', 'hades_core:obsidian', 'hades_core:obsidian'},
	}
})

if minetest.get_modpath("mesecons_mvps") then
	mesecon:register_mvps_stopper("hades_furnaces:furnace")
	mesecon:register_mvps_stopper("hades_furnaces:furnace_active")
	mesecon:register_mvps_stopper("hades_furnaces:prism_furnace")
	mesecon:register_mvps_stopper("hades_furnaces:prism_furnace_active")
end
