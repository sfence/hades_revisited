local NUM_ITEMS = 40
local ROW_LENGTH = 10

local S = minetest.get_translator("hades_craftguide")
local esc = minetest.formspec_escape

local player_data = {}
local init_items = {}
local recipes_cache = {}
local usages_cache = {}

local group_stereotypes = {
	cloth	     = "hades_cloth:white",
	dye	     = "hades_dye:white",
	vessel	     = "hades_vessels:glass_bottle",
	coal	     = "hades_core:coal_lump",
	flower	     = "hades_flowers:yellow",
	window_wood  = "hades_windows:windows_wood",
	window_colwood  = "hades_windows:windows_wood_white",
	chest        = "hades_chests:chest",
	unlocked_chest = "hades_chests:chest",
	locked_chest = "hades_chests:chest_locked",
	sand         = "hades_core:fertile_sand",
	stone        = "hades_core:cobble",
	fence_wood   = "hades_fences:fence_wood",
	fence_colwood  = "hades_fences:fence_wood_white",
	steel_door   = "hades_doors:door_steel",
	claybricks   = "hades_core:brick",
	table        = "hades_furniture:table_uncolored",
	chair        = "hades_furniture:chair_uncolored",
	armchair     = "hades_furniture:armchair_brown",
	vines        = "hades_vines:jungle",
	tree         = "hades_trees:tree",
	leaves       = "hades_trees:leaves",
	sapling      = "hades_trees:sapling",
	wood         = "hades_trees:wood",
	colwood      = "hades_trees:colwood_white",
	stick        = "hades_core:stick",
	mesecon_conductor_craftable = "mesecons:wire_00000000_off",
}

local group_names = {
	cloth        = S("Any cloth"),
	dye	     = S("Any dye"),
	vessel	     = S("Any vessel"),
	coal	     = S("Any coal lump"),
	flower	     = S("Any flower"),
	window_wood  = S("Any wooden window"),
	window_colwood = S("Any canvas wood window"),
	vines        = S("Any vines"),
	chest        = S("Any chest"),
	unlocked_chest = S("Any unlocked chest"),
	locked_chest = S("Any locked chest"),
	stone        = S("Any stone"),
	sand         = S("Any sand"),
	fence_wood   = S("Any wooden fence"),
	fence_colwood   = S("Any canvas wood fence"),
	steel_door   = S("Any steel door"),
	claybricks   = S("Any clay bricks"),
	table        = S("Any table"),
	chair        = S("Any chair"),
	armchair     = S("Any armchair"),
	tree         = S("Any tree"),
	leaves       = S("Any leaves"),
	sapling      = S("Any sapling"),
	wood         = S("Any wooden planks"),
	colwood      = S("Any canvas wood planks"),
	stick        = S("Any stick"),
	mesecon_conductor_craftable = S("Any mesecon conductor"),

	["color_red,flower"] = S("Any red flower"),
	["color_blue,flower"] = S("Any blue flower"),
	["color_black,flower"] = S("Any black flower"),
	["color_green,flower"] = S("Any green flower"),
	["color_white,flower"] = S("Any white flower"),
	["color_orange,flower"] = S("Any orange flower"),
	["color_violet,flower"] = S("Any violet flower"),
	["color_yellow,flower"] = S("Any yellow flower"),

	["color_red,dye"] = S("Any red dye"),
	["color_blue,dye"] = S("Any blue dye"),
	["color_cyan,dye"] = S("Any cyan dye"),
	["color_grey,dye"] = S("Any grey dye"),
	["color_pink,dye"] = S("Any pink dye"),
	["color_black,dye"] = S("Any black dye"),
	["color_brown,dye"] = S("Any brown dye"),
	["color_green,dye"] = S("Any green dye"),
	["color_white,dye"] = S("Any white dye"),
	["color_orange,dye"] = S("Any orange dye"),
	["color_violet,dye"] = S("Any violet dye"),
	["color_yellow,dye"] = S("Any yellow dye"),
	["color_magenta,dye"] = S("Any magenta dye"),
	["color_dark_grey,dye"] = S("Any dark grey dye"),
	["color_dark_green,dye"] = S("Any dark green dye")
}

local function table_replace(t, val, new)
	for k, v in pairs(t) do
		if v == val then
			t[k] = new
		end
	end
end

local function extract_groups(str)
	if str:sub(1, 6) == "group:" then
		return str:sub(7):split()
	end
	return nil
end

local function item_has_groups(item_groups, groups)
	for _, group in ipairs(groups) do
		if not item_groups[group] then
			return false
		end
	end
	return true
end

local function groups_to_item(groups)
	if #groups == 1 then
		local group = groups[1]
		if group_stereotypes[group] then
			return group_stereotypes[group]
		elseif minetest.registered_items["hades_core:"..group] then
			return "hades_core:"..group
		end
	end

	for name, def in pairs(minetest.registered_items) do
		if item_has_groups(def.groups, groups) then
			return name
		end
	end

	return ":unknown"
end

local function get_craftable_recipes(output)
	local recipes = minetest.get_all_craft_recipes(output)
	if not recipes then
		return nil
	end

	for i = #recipes, 1, -1 do
		for _, item in pairs(recipes[i].items) do
			local groups = extract_groups(item)
			if groups then
				item = groups_to_item(groups)
			end
			if not minetest.registered_items[item] then
				table.remove(recipes, i)
				break
			end
		end
	end

	if #recipes > 0 then
		return recipes
	end
end

local function show_item(def)
	return def.groups.not_in_craft_guide ~= 1 and def.description ~= ""
end

local function cache_usages(recipe)
	local added = {}
	for _, item in pairs(recipe.items) do
		if not added[item] then
			local groups = extract_groups(item)
			if groups then
				for name, def in pairs(minetest.registered_items) do
					if not added[name] and show_item(def)
							and item_has_groups(def.groups, groups) then
						local usage = table.copy(recipe)
						table_replace(usage.items, item, name)
						usages_cache[name] = usages_cache[name] or {}
						table.insert(usages_cache[name], usage)
						added[name] = true
					end
				end
			elseif show_item(minetest.registered_items[item]) then
				usages_cache[item] = usages_cache[item] or {}
				table.insert(usages_cache[item], recipe)
			end
			added[item] = true
		end
	end
end

minetest.register_on_mods_loaded(function()
	for name, def in pairs(minetest.registered_items) do
		if show_item(def) then
			local recipes = get_craftable_recipes(name)
			if recipes then
				recipes_cache[name] = recipes
				for _, recipe in ipairs(recipes) do
					cache_usages(recipe)
				end
			end
		end
	end
	for name, def in pairs(minetest.registered_items) do
		if recipes_cache[name] or usages_cache[name] then
			table.insert(init_items, name)
		end
	end
	table.sort(init_items)
end)

local function coords(i, cols)
	return i % cols, math.floor(i / cols)
end

local function is_fuel(item)
	return minetest.get_craft_result({method="fuel", items={item}}).time > 0
end

local function item_button_fs(fs, x, y, item, element_name, groups)
	table.insert(fs, ("item_image_button[%s,%s;1.05,1.05;%s;%s;%s]")
		:format(x, y, item, element_name, groups and "\n"..esc(S("G")) or ""))

	local tooltip
	if groups then
		table.sort(groups)
		tooltip = group_names[table.concat(groups, ",")]
		if not tooltip then
			local groupstr = {}
			for _, group in ipairs(groups) do
				table.insert(groupstr, minetest.colorize("yellow", group))
			end
			groupstr = table.concat(groupstr, ", ")
			tooltip = S("Any item belonging to the group(s): @1", groupstr)
		else
			tooltip = minetest.colorize("yellow", tooltip)
		end
	elseif is_fuel(item) then
		local itemdef = minetest.registered_items[item:match("%S*")]
		local desc = itemdef and itemdef.description or S("Unknown Item")
		tooltip = desc.."\n"..minetest.colorize("yellow", S("Fuel"))
	end
	if tooltip then
		table.insert(fs, ("tooltip[%s;%s]"):format(element_name, esc(tooltip)))
	end
end

local function recipe_fs(fs, data)
	local recipe = data.recipes[data.rnum]
	local width = recipe.width
	local cooktime, shapeless

	if recipe.method == "cooking" then
		cooktime, width = width, 1
	elseif width == 0 then
		shapeless = true
		if #recipe.items == 1 then
			width = 1
		elseif #recipe.items <= 4 then
			width = 2
		else
			width = 3
		end
	end

	table.insert(fs, ("label[5.5,1;%s]"):format(esc(data.show_usages
		and S("Usage @1 of @2", data.rnum, #data.recipes)
		or S("Recipe @1 of @2", data.rnum, #data.recipes))))

	if #data.recipes > 1 then
		table.insert(fs,
			"image_button[5.5,1.6;0.8,0.8;craftguide_prev_icon.png;recipe_prev;]"..
			"image_button[6.2,1.6;0.8,0.8;craftguide_next_icon.png;recipe_next;]"..
			"tooltip[recipe_prev;"..esc(S("Previous recipe")).."]"..
			"tooltip[recipe_next;"..esc(S("Next recipe")).."]")
	end

	local rows = math.ceil(table.maxn(recipe.items) / width)
	if width > 3 or rows > 3 then
		table.insert(fs, ("label[0,1;%s]")
			:format(esc(S("Recipe is too big to be displayed."))))
		return
	end

	local base_x = 3 - width
	local base_y = rows == 1 and 1 or 0

	for i, item in pairs(recipe.items) do
		local x, y = coords(i - 1, width)

		local elem_name = item
		local groups = extract_groups(item)
		if groups then
			item = groups_to_item(groups)
			elem_name = esc(item.."."..table.concat(groups, "+"))
		end
		item_button_fs(fs, base_x + x, base_y + y, item, elem_name, groups)
	end

	if shapeless or recipe.method == "cooking" then
		table.insert(fs, ("image[3.2,0.5;0.5,0.5;craftguide_%s.png]")
			:format(shapeless and "shapeless" or "furnace"))
		local tooltip = shapeless and S("Shapeless") or
			S("Cooking time: @1", minetest.colorize("yellow", cooktime))
		table.insert(fs, "tooltip[3.2,0.5;0.5,0.5;"..esc(tooltip).."]")
	end
	table.insert(fs, "image[3,1;1,1;sfinv_crafting_arrow.png]")

	item_button_fs(fs, 4, 1, recipe.output, recipe.output:match("%S*"))
end

local function get_formspec(player)
	local name = player:get_player_name()
	local data = player_data[name]
	data.pagemax = math.max(1, math.ceil(#data.items / NUM_ITEMS))

	local fs = {}

	table.insert(fs,
		"style_type[item_image_button;padding=2]"..
		hades_gui.gui_inventory_bg_img..
		"field[0.3,4.2;4.8,1.2;filter;;"..esc(data.filter).."]"..
		"label[7.8,4.15;"..S("@1 / @2", minetest.colorize("yellow", data.pagenum),
			data.pagemax).."]"..
		"image_button[4.63,4.05;0.8,0.8;craftguide_search_icon.png;search;]"..
		"image_button[5.25,4.05;0.8,0.8;craftguide_clear_icon.png;clear;]"..
		"image_button[7,4.05;0.8,0.8;craftguide_prev_icon.png;prev;]"..
		"image_button[9.25,4.05;0.8,0.8;craftguide_next_icon.png;next;]"..
		"tooltip[search;"..esc(S("Search")).."]"..
		"tooltip[clear;"..esc(S("Reset")).."]"..
		"tooltip[prev;"..esc(S("Previous page")).."]"..
		"tooltip[next;"..esc(S("Next page")).."]"..
		"field_close_on_enter[filter;false]")

	if data.prev_item then
		local modestr
		if data.show_usages then
			modestr = S("Show recipes")
		else
			modestr = S("Show usages")
		end
		table.insert(fs, "button[6,8.5;4,1;toggle_mode;"..esc(modestr).."]")
	end

	if #data.items == 0 then
		table.insert(fs, "label[3,2;"..esc(S("No items to show.")).."]")
	else
		local first_item = (data.pagenum - 1) * NUM_ITEMS
		for i = first_item, first_item + (NUM_ITEMS-1) do
			local item = data.items[i + 1]
			if not item then
				break
			end
			local x, y = coords(i % NUM_ITEMS, ROW_LENGTH)
			item_button_fs(fs, x, y, item, item)
		end
	end

	table.insert(fs, "container[0,5.6]")
	if data.recipes then
		recipe_fs(fs, data)
	elseif data.prev_item then
		table.insert(fs, ("label[2,1;%s]"):format(esc(data.show_usages
			and S("No usages.")
			or S("No recipes."))))
	end
	table.insert(fs, "container_end[]")

	return table.concat(fs)
end

local function imatch(str, filter)
	return str:lower():find(filter, 1, true) ~= nil
end

local function execute_search(data)
	local filter = data.filter
	if filter == "" then
		data.items = init_items
		return
	end
	data.items = {}

	for _, item in ipairs(init_items) do
		local def = minetest.registered_items[item]
		local desc = def and minetest.get_translated_string(data.lang_code, def.description)

		if imatch(item, filter) or desc and imatch(desc, filter) then
			table.insert(data.items, item)
		end
	end
end

local function on_receive_fields(player, fields)
	local name = player:get_player_name()
	local data = player_data[name]

	if fields.clear then
		data.filter = ""
		data.pagenum = 1
		data.prev_item = nil
		data.recipes = nil
		data.items = init_items
		return true

	elseif fields.key_enter_field == "filter" or fields.search then
		local new = fields.filter:lower()
		if data.filter == new then
			return
		end
		data.filter = new
		data.pagenum = 1
		execute_search(data)
		return true

	elseif fields.prev or fields.next then
		if data.pagemax == 1 then
			return
		end
		data.pagenum = data.pagenum + (fields.next and 1 or -1)
		if data.pagenum > data.pagemax then
			data.pagenum = 1
		elseif data.pagenum == 0 then
			data.pagenum = data.pagemax
		end
		return true

	elseif fields.recipe_next or fields.recipe_prev then
		data.rnum = data.rnum + (fields.recipe_next and 1 or -1)
		if data.rnum > #data.recipes then
			data.rnum = 1
		elseif data.rnum == 0 then
			data.rnum = #data.recipes
		end
		return true

	elseif fields.toggle_mode then
		local item = data.prev_item
		if not item then
			return
		end
		data.show_usages = not data.show_usages
		if data.show_usages then
			data.recipes = usages_cache[item]
		else
			data.recipes = recipes_cache[item]
		end
		data.rnum = 1
		return true
	else
		local item
		for field in pairs(fields) do
			if field:find(":") then
				item = field:match("[%w_:]+")
				break
			end
		end
		if not item then
			return
		end

		if item == data.prev_item then
			data.show_usages = not data.show_usages
		end
		if data.show_usages then
			data.recipes = usages_cache[item]
		else
			data.recipes = recipes_cache[item]
		end
		data.prev_item = item
		data.rnum = 1
		return true
	end
end

minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	local info = minetest.get_player_information(name)

	player_data[name] = {
		filter = "",
		pagenum = 1,
		items = init_items,
		lang_code = info.lang_code
	}
end)

minetest.register_on_leaveplayer(function(player)
	local name = player:get_player_name()
	player_data[name] = nil
end)

sfinv.register_page("hades_craftguide:craftguide", {
	title = esc(S("Recipes")),
	get = function(self, player, context)
		return sfinv.make_formspec(player, context, get_formspec(player))
	end,
	on_player_receive_fields = function(self, player, context, fields)
		if on_receive_fields(player, fields) then
			sfinv.set_player_inventory_formspec(player)
		end
	end
})
