
--
-- Formspecs
--

local formspec_imgs = {
	["default:furnace"] = { bg = "gui_furnace_bg.png", flame_bg = "default_furnace_fire_bg.png", flame_fg = "default_furnace_fire_fg.png" },
	["default:pfurnace"] = { bg = "gui_pfurnace_bg.png", flame_bg = "default_pfurnace_fire_bg.png", flame_fg = "default_pfurnace_fire_fg.png" },
}

local function active_formspec(ftype, fuel_percent, item_percent)
	return
	"size[8,8.5]"..
	default.gui_bg..
	"background[-0.5,-0.65;9,10.35;"..formspec_imgs[ftype].bg.."]"..
	default.gui_slots..
	"list[current_name;src;2.75,0.5;1,1;]"..
	"list[current_name;fuel;2.75,2.5;1,1;]"..
	"image[2.75,1.5;1,1;"..formspec_imgs[ftype].flame_bg.."^[lowpart:"..
	(100-fuel_percent)..":"..formspec_imgs[ftype].flame_fg.."]"..
	"image[3.75,1.5;1,1;gui_furnace_arrow_bg.png^[lowpart:"..
	(item_percent)..":gui_furnace_arrow_fg.png^[transformR270]"..
	"list[current_name;dst;4.75,0.96;2,2;]"..
	"list[current_player;main;0,4.25;8,1;]"..
	"list[current_player;main;0,5.5;8,3;8]"..
	"listring[current_name;dst]"..
	"listring[current_player;main]"..
	"listring[current_name;src]"..
	"listring[current_player;main]"..
	"listring[current_name;fuel]"..
	"listring[current_player;main]"..
	default.get_hotbar_bg(0, 4.25)
end

local function inactive_formspec(ftype)
	return
	"size[8,8.5]"..
	default.gui_bg..
	"background[-0.5,-0.65;9,10.35;"..formspec_imgs[ftype].bg.."]"..
	default.gui_slots..
	"list[current_name;src;2.75,0.5;1,1;]"..
	"list[current_name;fuel;2.75,2.5;1,1;]"..
	"image[2.75,1.5;1,1;"..formspec_imgs[ftype].flame_bg.."]"..
	"image[3.75,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]"..
	"list[current_name;dst;4.75,0.96;2,2;]"..
	"list[current_player;main;0,4.25;8,1;]"..
	"list[current_player;main;0,5.5;8,3;8]"..
	"listring[current_name;dst]"..
	"listring[current_player;main]"..
	"listring[current_name;src]"..
	"listring[current_player;main]"..
	"listring[current_name;fuel]"..
	"listring[current_player;main]"..
	default.get_hotbar_bg(0, 4.25)
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
	["default:furnace"] = { "Furnace", "furnace", 1.0, 0.75 },
	["default:pfurnace"] = { "Prism Furnace", "pfurnace", 1.0, 4.25 },
}
local furnace_ids = {}
for id, finfo in pairs(furnace_types) do
	local desc = finfo[1]
	local tex = finfo[2]
	minetest.register_node(id, {
		description = desc,
		tiles = {
			"default_"..tex.."_top.png", "default_"..tex.."_bottom.png",
			"default_"..tex.."_side.png", "default_"..tex.."_side.png",
			"default_"..tex.."_side.png", "default_"..tex.."_front.png"
		},
		paramtype2 = "facedir",
		groups = {cracky=2},
		legacy_facedir_simple = true,
		is_ground_content = false,
		sounds = default.node_sound_stone_defaults(),

		can_dig = can_dig,

		allow_metadata_inventory_put = allow_metadata_inventory_put,
		allow_metadata_inventory_move = allow_metadata_inventory_move,
		allow_metadata_inventory_take = allow_metadata_inventory_take,

		_furnace_normal = id,
		_furnace_active = id.."_active",
	})

	minetest.register_node(id.."_active", {
		description = desc,
		tiles = {
			"default_"..tex.."_top.png", "default_"..tex.."_bottom.png",
			"default_"..tex.."_side.png", "default_"..tex.."_side.png",
			"default_"..tex.."_side.png",
			{
				image = "default_"..tex.."_front_active.png",
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
		groups = {cracky=2, not_in_creative_inventory=1},
		legacy_facedir_simple = true,
		is_ground_content = false,
		sounds = default.node_sound_stone_defaults(),

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

minetest.register_abm({
	nodenames = furnace_ids,
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		--
		-- Inizialize metadata
		--
		local id_normal = minetest.registered_nodes[node.name]._furnace_normal
		local id_active = minetest.registered_nodes[node.name]._furnace_active

		local meta = minetest.get_meta(pos)
		local fuel_time = meta:get_float("fuel_time")+furnace_types[id_normal][3]  or 0
		local src_time = meta:get_float("src_time")+furnace_types[id_normal][4] or 0
		local fuel_totaltime = meta:get_float("fuel_totaltime") or 0

		--
		-- Inizialize inventory
		--
		local inv = meta:get_inventory()
		for listname, size in pairs({
				src = 1,
				fuel = 1,
				dst = 4,
		}) do
			if inv:get_size(listname) ~= size then
				inv:set_size(listname, size)
			end
		end
		local srclist = inv:get_list("src")
		local fuellist = inv:get_list("fuel")
		local dstlist = inv:get_list("dst")

		--
		-- Cooking
		--

		-- Check if we have cookable content
		local cooked, aftercooked = minetest.get_craft_result({method = "cooking", width = 1, items = srclist})
		local cookable = true

		if cooked.time == 0 then
			cookable = false
		end

		-- Check if we have enough fuel to burn
		if fuel_time < fuel_totaltime then
			-- The furnace is currently active and has enough fuel
			fuel_time = fuel_time + 1

			-- If there is a cookable item then check if it is ready yet
			if cookable then
				src_time = src_time + 1
				if src_time >= cooked.time then
					-- Place result in dst list if possible
					if inv:room_for_item("dst", cooked.item) then
						inv:add_item("dst", cooked.item)
						inv:set_stack("src", 1, aftercooked.items[1])
						src_time = 0
					end
				end
			end
		else
			-- Furnace ran out of fuel
			if cookable then
				-- We need to get new fuel
				local fuel, afterfuel = minetest.get_craft_result({method = "fuel", width = 1, items = fuellist})

				if fuel.time == 0 then
					-- No valid fuel in fuel list
					fuel_totaltime = 0
					fuel_time = 0
					src_time = 0
				else
					-- Take fuel from fuel list
					inv:set_stack("fuel", 1, afterfuel.items[1])

					fuel_totaltime = fuel.time
					fuel_time = 0

				end
			else
				-- We don't need to get new fuel since there is no cookable item
				fuel_totaltime = 0
				fuel_time = 0
				src_time = 0
			end
		end

		--
		-- Update formspec, infotext and node
		--
		local formspec = inactive_formspec(id_normal)
		local item_state = ""
		local item_percent = 0
		if cookable then
			item_percent =  math.floor(src_time / cooked.time * 100)
			item_state = item_percent .. "%"
		else
			if srclist[1]:is_empty() then
				item_state = "Empty"
			else
				item_state = "Not cookable"
			end
		end

		local fuel_state = "Empty"
		local active = "inactive"
		if fuel_time <= fuel_totaltime and fuel_totaltime ~= 0 then
			active = "active"
			local fuel_percent = math.floor(fuel_time / fuel_totaltime * 100)
			fuel_state = fuel_percent .. "%"
			formspec = active_formspec(id_normal, fuel_percent, item_percent)
			swap_node(pos, id_active)
			--sound (brandon reese (adventuretest))
			if meta:get_int("sound_played") == nil or ( os.time() - meta:get_int("sound_played") ) >= 4 then
				minetest.sound_play("default_furnace",{pos=pos})
				meta:set_string("sound_played",os.time())
			end
		else
			if not fuellist[1]:is_empty() then
				fuel_state = "0%"
			end
			swap_node(pos, id_normal)
		end

		local desc = minetest.registered_nodes[node.name].description
		local infotext = string.format("%s %s (Item: %s; Fuel: %s)", desc, active, item_state, fuel_state)

		--
		-- Set meta values
		--
		meta:set_float("fuel_totaltime", fuel_totaltime)
		meta:set_float("fuel_time", fuel_time)
		meta:set_float("src_time", src_time)
		meta:set_string("formspec", formspec)
		meta:set_string("infotext", infotext)
	end,
})
