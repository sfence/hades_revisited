-- sfinv/init.lua

dofile(minetest.get_modpath("sfinv") .. "/api.lua")

local S = minetest.get_translator("sfinv")

local F = minetest.formspec_escape

sfinv.register_page("sfinv:crafting", {
	title = S("Crafting"),
	get = function(self, player, context)
		return sfinv.make_formspec(player, context, [[
				list[current_player;craft;1.75,0.5;3,3;]
				list[current_player;craftpreview;5.75,1.5;1,1;]
				image[4.75,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]
				listring[current_player;main]
				listring[current_player;craft]
				image_button[6.75,1.5;1,1;craftguide_book.png;__craftguide;]
				tooltip[__craftguide;]]..F(S("Crafting guide"))..[[]
			]], true)
	end
})
