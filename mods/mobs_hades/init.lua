-- Mob Api (10th Dec 2014)

-- Monsters

dofile(minetest.get_modpath("mobs_hades").."/dungeonmaster.lua")
dofile(minetest.get_modpath("mobs_hades").."/dungeonmaster2.lua")
dofile(minetest.get_modpath("mobs_hades").."/oerkki.lua")
dofile(minetest.get_modpath("mobs_hades").."/sandmonster.lua")
dofile(minetest.get_modpath("mobs_hades").."/stonemonster.lua")
dofile(minetest.get_modpath("mobs_hades").."/stonemonster2.lua")

-- Zmobs_hades by Zeg9

-- dofile(minetest.get_modpath("mobs_hades").."/lava_flan.lua")
dofile(minetest.get_modpath("mobs_hades").."/mese_monster.lua")
dofile(minetest.get_modpath("mobs_hades").."/mese_monster2.lua")

-- Spider from Lord of the Test - https://forum.minetest.net/viewtopic.php?pid=127538
dofile(minetest.get_modpath("mobs_hades").."/spider.lua")
dofile(minetest.get_modpath("mobs_hades").."/spider2.lua")
dofile(minetest.get_modpath("mobs_hades").."/spider3.lua")
dofile(minetest.get_modpath("mobs_hades").."/spider4.lua")

if minetest.setting_get("log_mods") then
	minetest.log("action", "mobs_hades loaded")
end
