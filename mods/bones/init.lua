-- Minetest 0.4 mod: bones
-- See README.txt for licensing and other information. 

local S = minetest.get_translator("bones")

local function is_owner(pos, name)
	local owner = minetest.get_meta(pos):get_string("owner")
	if owner == "" or owner == name then
		return true
	end
	return false
end

minetest.register_node("bones:bones", {
	description = S("Bones"),
	tiles = {
		"bones_top.png",
		"bones_bottom.png",
		"bones_side.png",
		"bones_side.png",
		"bones_rear.png",
		"bones_front.png"
	},
	paramtype2 = "facedir",
	groups = {dig_immediate=2},
	sounds = hades_sounds.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5, pitch=0.6},
		dug = {name="hades_sounds_gravel_dug", gain=1.0, pitch=0.6},
		place = {name="hades_sounds_gravel_dug", gain=1.0, pitch=1.25},
		dig = {name="hades_sounds_ash_dig", gain=0.2, pitch=1.75},
	}),
	
	can_dig = function(pos, player)
		local inv = minetest.get_meta(pos):get_inventory()
		return is_owner(pos, player:get_player_name()) and inv:is_empty("main")
	end,
	
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		if is_owner(pos, player:get_player_name()) then
			return count
		end
		return 0
	end,
	
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		return 0
	end,
	
	allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		if is_owner(pos, player:get_player_name()) then
			return stack:get_count()
		end
		return 0
	end,
	
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if meta:get_string("owner") ~= "" and meta:get_inventory():is_empty("main") then
			meta:set_string("infotext", S("@1's old bones", meta:get_string("owner")))
			meta:set_string("formspec", "")
			meta:set_string("owner", "")
		end
	end,
	
	on_timer = function(pos, elapsed)
		local meta = minetest.get_meta(pos)
		local time = meta:get_int("time")+elapsed
		local publish = 1200
		if tonumber(minetest.settings:get("share_bones_time")) then
			publish = tonumber(minetest.settings:get("share_bones_time"))
		end
		if publish == 0 then
			return
		end
		if time >= publish then
			meta:set_string("infotext", S("@1's old bones", meta:get_string("owner")))
			meta:set_string("owner", "")
		else
			return true
		end
	end,
})

minetest.register_on_dieplayer(function(player)
	local name = player:get_player_name()
	if minetest.is_creative_enabled(name) then
		return
	end
	
	local pos = player:get_pos()
	pos.x = math.floor(pos.x+0.5)
	pos.y = math.floor(pos.y+0.5)
	pos.z = math.floor(pos.z+0.5)
	local param2 = minetest.dir_to_facedir(player:get_look_dir())
	
	local nn = minetest.get_node(pos).name
	if minetest.registered_nodes[nn].can_dig and
		not minetest.registered_nodes[nn].can_dig(pos, player) then
		local player_inv = player:get_inventory()

		player_inv:set_list("main", {})
		player_inv:set_list("craft", {})
		player_inv:set_list("equipment", {})
		local equipment_inv = minetest.get_inventory({type="detached", name=name.."_equipment"})
		equipment_inv:set_list("equipment", {})
		return
	end
	
	minetest.dig_node(pos)
	minetest.add_node(pos, {name="bones:bones", param2=param2})
	
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local player_inv = player:get_inventory()
	inv:set_size("main", 10*4)
	
	inv:set_list("main", player_inv:get_list("main"))
	
	for i=1,player_inv:get_size("craft") do
		inv:add_item("main", player_inv:get_stack("craft", i))
	end

	for i=1,player_inv:get_size("equipment") do
		inv:add_item("main", player_inv:get_stack("equipment", i))
	end
	player_inv:set_list("main", {})
	player_inv:set_list("craft", {})
	player_inv:set_list("equipment", {})
	local equipment_inv = minetest.get_inventory({type="detached", name=name.."_equipment"})
	equipment_inv:set_list("equipment", {})
	
	meta:set_string("formspec", "size[10,9]"..
	"list[current_name;main;0,0;10,4;]"..
	"list[current_player;main;0,5;10,4;]"..
	"listring[]"..
	"background9[25,22;10,9;bones_inventory.png;true;25,22,-20,-23]")
	meta:set_string("infotext", S("@1's fresh bones", name))
	meta:set_string("owner", name)
	meta:set_int("time", 0)
	
	local timer  = minetest.get_node_timer(pos)
	timer:start(10)
end)
