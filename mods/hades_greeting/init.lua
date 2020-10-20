local S = minetest.get_translator("hades_greeting")

-- Show simple greeting message for new players.
-- Currently only uses the chat.

-- TODO: Think of some better way to do this which doesn't use the chat

local COLOR = "#00FF00"

local msg = function(pname, message)
	minetest.chat_send_player(pname, minetest.colorize(COLOR, message))
end

minetest.register_on_newplayer(function(player)
	local cb = function(player)
		if (not player) or (not player:is_player()) then
			return
		end
		local pname = player:get_player_name()
		minetest.sound_play({name="hades_greeting_message"}, {to_player=pname, gain=1.0})
		if minetest.settings:get_bool("creative_mode") then
			msg(pname, S("Welcome to planet Hades!"))
			msg(pname, S("Creative Mode is active. You have unlimited supplies."))
			msg(pname, S("Create the buildings of your dreams and have fun! <END OF TRANSMISSION>"))
		else
			msg(pname, S("You have stranded on planet Hades."))
			msg(pname, S("Search for some water. Lay down fertile sand next to the water and it will soon turn into dirt. Use the crafting guide to see what you can craft."))
			msg(pname, S("Survive and build a nice habitable place!"))
			msg(pname, S("Good luck! <END OF TRANSMISSION>"))
		end
	end
	minetest.after(3.0, cb, player)
end)
