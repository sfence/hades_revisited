-- sfinv/init.lua

dofile(minetest.get_modpath("sfinv") .. "/api.lua")

local S = minetest.get_translator("sfinv")

local F = minetest.formspec_escape

sfinv.register_page("sfinv:crafting", {
	title = S("Crafting"),
	get = function(self, player, context)
		return sfinv.make_formspec(player, context, 
			hades_gui.gui_survival_form_crafting, true)
	end
})
