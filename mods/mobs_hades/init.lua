-- Mob Api (10th Dec 2014)

-- Monsters

dofile(minetest.get_modpath("mobs_hades").."/cave_master.lua")
dofile(minetest.get_modpath("mobs_hades").."/oerkki.lua")
dofile(minetest.get_modpath("mobs_hades").."/mutant.lua")
dofile(minetest.get_modpath("mobs_hades").."/stone_monster.lua")
dofile(minetest.get_modpath("mobs_hades").."/mese_monster.lua")
dofile(minetest.get_modpath("mobs_hades").."/spider.lua")

if minetest.setting_get("log_mods") then
	minetest.log("action", "mobs_hades loaded")
end
