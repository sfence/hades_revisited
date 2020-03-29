minetest.register_on_newplayer(function(player)
	if minetest.settings:get_bool("give_initial_stuff") then
		minetest.log("action", "Giving initial stuff to player "..player:get_player_name())
		player:get_inventory():add_item('main', 'default:pick_steel')
		player:get_inventory():add_item('main', 'default:stick')
        	player:get_inventory():add_item('main', 'hades_lamps:lamp_wall')
        	player:get_inventory():add_item('main', 'hades_trees:apple 12')
	end
end)

