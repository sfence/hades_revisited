hades_sounds = {}

--
-- Sounds
--

local mhd = 32

function hades_sounds.node_sound_defaults(table)
	table = table or {}
	local pitch = table.pitch or 1
	table.pitch = nil
	table.footstep = table.footstep or
			{name="", gain=1.0}
	table.dug = table.dug or
			{name="default_dug_node", gain=0.25, max_hear_distance = mhd, pitch=pitch}
	table.place = table.place or
			{name="default_place_node_hard", gain=1.0, max_hear_distance = mhd, pitch=pitch}
	return table
end


function hades_sounds.node_sound_stone_defaults(table)
	table = table or {}
	local pitch = table.pitch or 1
	table.pitch = nil
	table.footstep = table.footstep or
			{name="default_hard_footstep", gain=0.5, max_hear_distance = mhd, pitch=pitch}
	table.dug = table.dug or
			{name="default_hard_footstep", gain=1.0, max_hear_distance = mhd, pitch=pitch}
	hades_sounds.node_sound_defaults(table)
	return table
end

function hades_sounds.node_sound_metal_defaults(table)
	table = table or {}
	local pitch = table.pitch or 1
	table.pitch = nil
	table.footstep = table.footstep or
			{name = "default_metal_footstep", gain = 0.4, max_hear_distance = mhd, pitch=pitch}
	table.dig = table.dig or
			{name = "default_dig_metal", gain = 0.5, max_hear_distance = mhd, pitch=pitch}
	table.dug = table.dug or
			{name = "default_dug_metal", gain = 0.5, max_hear_distance = mhd, pitch=pitch}
	table.place = table.place or
			{name = "default_place_node_metal", gain = 0.5, max_hear_distance = mhd, pitch=pitch}
	hades_sounds.node_sound_defaults(table)
	return table
end
-- TODO: Add more metal sounds

hades_sounds.node_sound_heavy_metal_defaults = hades_sounds.node_sound_metal_defaults

function hades_sounds.node_sound_dirt_defaults(table)
	table = table or {}
	local pitch = table.pitch or 1
	table.pitch = nil
	table.footstep = table.footstep or
			{name="default_dirt_footstep", gain=0.5, max_hear_distance = mhd, pitch=pitch}
	table.dug = table.dug or
			{name="default_dirt_footstep", gain=1.0, max_hear_distance = mhd, pitch=pitch}
	table.place = table.place or
			{name="default_place_node", gain=1.0, max_hear_distance = mhd, pitch=pitch}
	hades_sounds.node_sound_defaults(table)
	return table
end


function hades_sounds.node_sound_sand_defaults(table)
	table = table or {}
	local pitch = table.pitch or 1
	table.pitch = nil
	table.footstep = table.footstep or
			{name="hades_sounds_ash_footstep", gain=0.17, max_hear_distance = mhd, pitch=0.9*pitch}
	table.dig = table.dug or
			{name="hades_sounds_ash_dig", gain=0.2, max_hear_distance = mhd, pitch=1*pitch}
	table.dug = table.dug or
			{name="hades_sounds_ash_footstep", gain=0.7, max_hear_distance = mhd, pitch=0.9*pitch}
	table.place = table.place or
			{name="default_place_node", gain=1.0, max_hear_distance = mhd}
	hades_sounds.node_sound_defaults(table)
	return table
end

function hades_sounds.node_sound_ash_defaults(table)
	table = table or {}
	local pitch = table.pitch or 1
	table.pitch = nil
	table.footstep = table.footstep or
			{name="hades_sounds_ash_footstep", gain=0.17, max_hear_distance = mhd, pitch = pitch}
	table.dig = table.dug or
			{name="hades_sounds_ash_dig", gain=0.2, max_hear_distance = mhd, pitch = pitch}
	table.dug = table.dug or
			{name="hades_sounds_ash_footstep", gain=0.7, max_hear_distance = mhd, pitch = pitch}
	table.place = table.place or
			{name="default_place_node", gain=1.0, max_hear_distance = mhd}
	hades_sounds.node_sound_defaults(table)
	return table
end

function hades_sounds.node_sound_gravel_defaults(table)
	table = table or {}
	local pitch = table.pitch or 1
	table.pitch = nil
	table.footstep = table.footstep or
			{name="default_gravel_footstep", gain=0.5, max_hear_distance = mhd, pitch=pitch}
	table.dig = table.dig or
			{name = "default_dig_crumbly", gain = 0.5, max_hear_distance = mhd}
	table.dug = table.dug or
			{name="hades_sounds_gravel_dug", gain=1.0, max_hear_distance = mhd, pitch=pitch}
	table.place = table.place or
			{name="hades_sounds_gravel_dug", gain=1.0, max_hear_distance = mhd, pitch = 1.5*pitch}
	hades_sounds.node_sound_defaults(table)
	return table
end

function hades_sounds.node_sound_wood_defaults(table)
	table = table or {}
	local pitch = table.pitch or 1
	table.pitch = nil
	table.footstep = table.footstep or
			{name="default_wood_footstep", gain=0.5, max_hear_distance = mhd, pitch=pitch}
	table.dug = table.dug or
			{name="default_wood_footstep", gain=1.0, max_hear_distance = mhd, pitch=pitch}
	hades_sounds.node_sound_defaults(table)
	return table
end


function hades_sounds.node_sound_leaves_defaults(table)
	table = table or {}
	local pitch = table.pitch or 1
	table.pitch = nil
	table.footstep = table.footstep or
			{name="default_grass_footstep", gain=0.45, max_hear_distance = mhd, pitch=0.9*pitch}
	table.dug = table.dug or
			{name="default_grass_footstep", gain=1.0, max_hear_distance = mhd, pitch=0.8*pitch}
	table.dig = table.dig or
			{name="hades_sounds_grass_dig", gain=0.5, max_hear_distance = mhd, pitch=0.9*pitch}
	table.place = table.place or
			{name="hades_sounds_grass_place", gain=0.4, max_hear_distance = mhd, pitch=0.6*pitch}
	hades_sounds.node_sound_defaults(table)
	return table
end

function hades_sounds.node_sound_bush_defaults(table)
	table = table or {}
	local pitch = table.pitch or 1
	table.pitch = nil
	table.footstep = table.footstep or
			{name="default_grass_footstep", gain=0.45, max_hear_distance = mhd, pitch=pitch}
	table.dug = table.dug or
			{name="hades_sounds_bush_dug", gain=1.0, max_hear_distance = mhd, pitch=pitch}
	table.dig = table.dig or
			{name="hades_sounds_grass_dig", gain=0.5, max_hear_distance = mhd, pitch=pitch}
	table.place = table.place or
			{name="hades_sounds_grass_place", gain=0.4, max_hear_distance = mhd, pitch=0.7*pitch}
	hades_sounds.node_sound_defaults(table)
	return table
end

function hades_sounds.node_sound_grass_defaults(table)
	table = table or {}
	local pitch = table.pitch or 1
	table.pitch = nil
	table.footstep = table.footstep or
			{name="default_grass_footstep", gain=0.40, max_hear_distance = mhd, pitch=pitch}
	table.dug = table.dug or
			{name="hades_sounds_grass_dug", gain=1.0, max_hear_distance = mhd, pitch=pitch}
	table.dig = table.dig or
			{name="hades_sounds_grass_dig", gain=0.4, max_hear_distance = mhd, pitch=pitch}
	table.place = table.place or
			{name="hades_sounds_grass_place", gain=0.4, max_hear_distance = mhd, pitch=pitch}
	hades_sounds.node_sound_defaults(table)
	return table
end

function hades_sounds.node_sound_straw_defaults(table)
	table = table or {}
	local pitch = table.pitch or 1
	table.pitch = nil
	table.footstep = table.footstep or
			{name="hades_sounds_straw_footstep", gain=0.25, max_hear_distance = mhd, pitch=pitch}
	table.dug = table.dug or
			{name="hades_sounds_straw_dug", gain=1.0, max_hear_distance = mhd, pitch=pitch}
	table.dig = table.dig or
			{name="hades_sounds_straw_dig", gain=1.0, max_hear_distance = mhd, pitch=pitch}
	table.place = table.place or
			{name="hades_sounds_straw_place", gain=1.0, max_hear_distance = mhd, pitch=pitch}
	hades_sounds.node_sound_defaults(table)
	return table
end

function hades_sounds.node_sound_glass_defaults(table)
	table = table or {}
	local pitch = table.pitch or 1
	table.pitch = nil
	table.place = table.place or
			{name="default_glass_place", gain=0.7, max_hear_distance = mhd, pitch=pitch}
	table.footstep = table.footstep or
			{name="default_glass_footstep", gain=0.5, max_hear_distance = mhd, pitch=pitch}
	table.dug = table.dug or
			{name="default_break_glass", gain=1.0, max_hear_distance = mhd, pitch=pitch}
	hades_sounds.node_sound_defaults(table)
	return table
end

function hades_sounds.node_sound_cloth_defaults(table)
	table = table or {}
	local pitch = table.pitch or 1
	table.pitch = nil
	table.footstep = table.footstep or
			{name="hades_sounds_cloth_footstep", gain=0.1, max_hear_distance = mhd, pitch=pitch}
	table.dig = table.dig or
			{name="hades_sounds_cloth_footstep", gain=0.4, max_hear_distance = mhd, pitch=0.8*pitch}
	hades_sounds.node_sound_defaults(table)
	return table
end

function hades_sounds.node_sound_water_defaults(table)
	table = table or {}
	local pitch = table.pitch or 1
	table.pitch = nil
	table.footstep = table.footstep or
			{name = "default_water_footstep", gain = 0.2, max_hear_distance = mhd, pitch=pitch}
	table.place = table.place or
			{name = "default_place_node_water", gain = 0.8, max_hear_distance = mhd, pitch=pitch}
	hades_sounds.node_sound_defaults(table)
	return table
end

function hades_sounds.node_sound_lava_defaults(table)
	table = table or {}
	local pitch = table.pitch or 1
	table.pitch = nil
	table.place = table.place or
			{name = "default_place_node_lava", gain = 1.0, max_hear_distance = mhd, pitch=pitch}
	hades_sounds.node_sound_defaults(table)
	return table
end

