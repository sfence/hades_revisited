
local path = minetest.get_modpath("mobs")

-- for sinki update
if 1 then
  minetest.register_privilege("peaceful_player", { description = "prevents mobs drived by mobs_redo from attacking player", give_to_singleplayer = false});
end

-- Mob API
dofile(path .. "/api.lua")

-- Rideable Mobs
dofile(path .. "/mount.lua")

-- Mob Spawner
dofile(path .. "/spawner.lua")

-- Lucky Blocks
dofile(path .. "/lucky_block.lua")

minetest.log("action", "[MOD] Mobs Redo loaded")
