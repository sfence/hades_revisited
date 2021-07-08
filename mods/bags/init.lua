--[[

Bags for Minetest

Copyright (c) 2012 cornernote, Brett O'Donnell <cornernote@gmail.com>
Source Code: https://github.com/cornernote/minetest-particles
License: GPLv3

]]--

local S = minetest.get_translator("bags")
local F = minetest.formspec_escape

local BAGS_COUNT = 4

local bags_page = {}

local get_formspec = function(player, page)
	if page=="bags" then
		local name = player:get_player_name()
		return "button[1,2.2;2,0.5;bag1;"..F(S("Bag 1")).."]"
			.."button[3,2.2;2,0.5;bag2;"..F(S("Bag 2")).."]"
			.."button[5,2.2;2,0.5;bag3;"..F(S("Bag 3")).."]"
			.."button[7,2.2;2,0.5;bag4;"..F(S("Bag 4")).."]"
			.."list[detached:"..name.."_bags;bags;1.5,1;1,1;0]"
			.."list[detached:"..name.."_bags;bags;3.5,1;1,1;1]"
			.."list[detached:"..name.."_bags;bags;5.5,1;1,1;2]"
			.."list[detached:"..name.."_bags;bags;7.5,1;1,1;3]"
			.."listring[current_player;main]"
			.."listring[detached:"..name.."_bags;bags]"
	end
	for b=1,4 do
		if page=="bag"..b then
			local image = player:get_inventory():get_stack("bags", b):get_definition().inventory_image
			return "button[0,0;2,0.5;main;"..F(S("Main")).."]"
				.."label[3,0;"..F(S("Bag @1", b)).."]"
				.."image[7,0;1,1;"..image.."]"
				.."list[current_player;bag"..b.."contents;0,1;10,3;]"
				.."listring[]"
		end
	end
end

sfinv.register_page("bags:bags", {
	title = S("Bags"),
	is_in_nav = function(self, player, context)
		return true
	end,
	get = function(self, player, context)
		local player_name = player:get_player_name()
		local inv = player:get_inventory()
		local page
		if not bags_page[player_name] then
			page = "bags"
		else
			page = bags_page[player_name]
		end
		return sfinv.make_formspec(player, context, get_formspec(player, page), true)
	end,
	on_player_receive_fields = function(self, player, context, fields)
		local player_name = player:get_player_name()
		local inv = player:get_inventory()
		assert(inv)

		if fields.main then
			bags_page[player_name] = "bags"
		else
			for b=1, BAGS_COUNT do
				if fields["bag"..b] and not inv:get_stack("bags", b):is_empty() then
					bags_page[player_name] = "bag"..b
					break
				end
			end
		end
		sfinv.set_player_inventory_formspec(player, context)
	end,
})

-- register_on_joinplayer
minetest.register_on_joinplayer(function(player)
	local player_inv = player:get_inventory()
	local bags_inv = minetest.create_detached_inventory(player:get_player_name().."_bags",{
		on_put = function(inv, listname, index, stack, player)
			player:get_inventory():set_stack(listname, index, stack)

			local bagname = "bag"..index
			player:get_inventory():set_size(bagname.."contents", stack:get_definition().groups.bagslots)
		end,
		on_take = function(inv, listname, index, stack, player)
			player:get_inventory():set_stack(listname, index, nil)
		end,
		allow_put = function(inv, listname, index, stack, player)
			if stack:get_definition().groups.bagslots and inv:get_stack(listname, index):is_empty() then
				return 1
			else
				return 0
			end
		end,
		allow_take = function(inv, listname, index, stack, player)
			local bagname = "bag"..index
			if bagname and player:get_inventory():is_empty(bagname.."contents")==true then
				return stack:get_count()
			else
				return 0
			end
		end,
		allow_move = function(inv, from_list, from_index, to_list, to_index, count, player)
			return 0
		end,
	}, player:get_player_name())
	player_inv:set_size("bags", BAGS_COUNT)
	bags_inv:set_size("bags", BAGS_COUNT)
	bags_inv:set_list("bags", player_inv:get_list("bags"))
end)

minetest.register_on_leaveplayer(function(player)
	bags_page[player:get_player_name()] = nil
end)

-- register bag tools
minetest.register_tool("bags:small", {
	description = S("Small Bag"),
	_tt_help = S("+10 inventory slots"),
	inventory_image = "bags_small.png",
	groups = {bagslots=10, disable_repair=1},
})
minetest.register_tool("bags:medium", {
	description = S("Medium Bag"),
	_tt_help = S("+20 inventory slots"),
	inventory_image = "bags_medium.png",
	groups = {bagslots=20, disable_repair=1},
})
minetest.register_tool("bags:large", {
	description = S("Large Bag"),
	_tt_help = S("+30 inventory slots"),
	inventory_image = "bags_large.png",
	groups = {bagslots=30, disable_repair=1},
})

-- register bag crafts
minetest.register_craft({
	output = "bags:small",
	recipe = {
        {"", "hades_farming:string", ""},
        {"group:wool", "group:wool", "group:wool"},
        {"group:wool", "group:wool", "group:wool"},
    },
})
minetest.register_craft({
	output = "bags:medium",
	recipe = {
        {"", "group:stick", ""},
        {"bags:small", "hades_farming:string", "bags:small"},
        {"bags:small", "hades_farming:string", "bags:small"},
    },
})
minetest.register_craft({
	output = "bags:large",
	recipe = {
        {"", "group:stick", ""},
        {"bags:medium", "hades_farming:string", "bags:medium"},
        {"bags:medium", "hades_farming:string", "bags:medium"},
    },
})

-- log that we started
minetest.log("action", "[MOD]"..minetest.get_current_modname().." -- loaded from "..minetest.get_modpath(minetest.get_current_modname()))
