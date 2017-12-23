-- Show simple greeting message for new players.
-- Currently only uses the chat.

-- TODO: Think of some better way to do this which doesn't use the chat

minetest.register_on_newplayer(function(player)
	local cb = function(player)
		if minetest.settings:get_bool("creative_mode") then
			minetest.chat_send_player(player:get_player_name(), "Welcome to planet Hades!")
			minetest.chat_send_player(player:get_player_name(), "Creative Mode is active. You have unlimited supplies.")
			minetest.chat_send_player(player:get_player_name(), "Create the buildings of your dreams and have fun! <END OF TRANSMISSION>")
		else
			minetest.chat_send_player(player:get_player_name(), "You have stranded on planet Hades.")
			minetest.chat_send_player(player:get_player_name(), "Search for some water. Lay down fertile sand next to the water and it will soon turn into dirt. Use the crafting guide to see what you can craft.")
			minetest.chat_send_player(player:get_player_name(), "Survive and build a nice habitable place!")
			minetest.chat_send_player(player:get_player_name(), "Good luck! <END OF TRANSMISSION>")
		end
	end
	minetest.after(2.0, cb, player)
end)
