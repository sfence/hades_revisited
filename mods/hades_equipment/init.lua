local S = minetest.get_translator("hades_equipment")
local F = minetest.formspec_escape

hades_equipment = {}

local EQUIPMENT_COUNT = 4

local get_formspec = function(player, page)
	if page=="equipment" then
		local name = player:get_player_name()
		return "list[detached:"..name.."_equipment;equipment;3,2;4,1;0]"..
			"listring[]"
	end
end

function hades_equipment.has_equipped(player, itemname, also_check_hotbar)
	local inv = player:get_inventory()
	if inv:contains_item("equipment", ItemStack(itemname)) then
		return true
	end
	if also_check_hotbar then
		-- Check if player carries the item in the hotbar
		local hotbar = player:hud_get_hotbar_itemcount()
		for i=1, hotbar do
			if inv:get_stack("main", i):get_name() == itemname then
				return true
			end
		end
	end
	return false
end

sfinv.register_page("hades_equipment:equipment", {
	title = S("Equipment"),
	is_in_nav = function(self, player, context)
		return true
	end,
	get = function(self, player, context)
		local player_name = player:get_player_name()
		local inv = player:get_inventory()
		local page
		page = "equipment"
		return sfinv.make_formspec(player, context, get_formspec(player, page), true)
	end,
})

-- register_on_joinplayer
minetest.register_on_joinplayer(function(player)
	local player_inv = player:get_inventory()
	local equipment_inv = minetest.create_detached_inventory(player:get_player_name().."_equipment",{
		on_put = function(inv, listname, index, stack, player)
			player:get_inventory():set_stack(listname, index, stack)
		end,
		on_take = function(inv, listname, index, stack, player)
			player:get_inventory():set_stack(listname, index, nil)
		end,
		allow_put = function(inv, listname, index, stack, player)
			if stack:get_definition().groups.equipment and inv:get_stack(listname, index):is_empty() then
				return 1
			else
				return 0
			end
		end,
		allow_take = function(inv, listname, index, stack, player)
			local equipmentname = "equipment"..index
			if equipmentname and player:get_inventory():is_empty(equipmentname.."contents")==true then
				return stack:get_count()
			else
				return 0
			end
		end,
	}, player:get_player_name())
	player_inv:set_size("equipment", EQUIPMENT_COUNT)
	equipment_inv:set_size("equipment", EQUIPMENT_COUNT)
	equipment_inv:set_list("equipment", player_inv:get_list("equipment"))
end)
