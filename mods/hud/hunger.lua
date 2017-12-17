-- Keep these for backwards compatibility
function hud.save_hunger(player)
	hud.set_hunger(player)
end
function hud.load_hunger(player)
	hud.get_hunger(player)
end

local org_eat = core.do_item_eat
core.do_item_eat = function(hp_change, replace_with_item, itemstack, user, pointed_thing)
	itemstack = hud.item_eat(hp_change, replace_with_item, itemstack, user, pointed_thing)
	for _, callback in pairs(core.registered_on_item_eats) do
		local result = callback(hp_change, replace_with_item, itemstack, user, pointed_thing, old_itemstack)
		if result then
			return result
		end
	end
	return itemstack
end

function hud.item_eat(hunger_change, replace_with_item, itemstack, user, pointed_thing)
	local old_itemstack = ItemStack(itemstack)
	if itemstack:take_item() ~= nil and user ~= nil then
		local name = user:get_player_name()
		local h = tonumber(hud.hunger[name])
		h = h + hunger_change
		if h > 30
			then h = 30
		end
		hud.hunger[name]=h
		hud.set_hunger(user)
		if replace_with_item then
			local inv = user:get_inventory()
			if itemstack:is_empty() then
				itemstack:add_item(replace_with_item)
			elseif inv:room_for_item("main", replace_with_item) then
				inv:add_item("main", replace_with_item)
			else
				minetest.add_item(user:get_pos(), replace_with_item)
			end
		end
		local sound = "hunger_eat"
		if old_itemstack:get_definition().groups.food == 3 then
			-- Drinking sound (TODO)
			sound = nil
		end
		minetest.sound_play(sound, {to_player = name, gain = 0.7})
	end
	return itemstack
end

