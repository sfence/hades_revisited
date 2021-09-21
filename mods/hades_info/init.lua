local S = minetest.get_translator("hades_info")
local F = minetest.formspec_escape
local N = function(s) return s end

local region_classes = {
	["6"] = { N("The region class 6 designates regions with a highly irregular shape. Its main feature are the steep stone spires, only to be separated by large lava lakes and oceans. Its chaotic shape can be pretty challenging and dangerous to traverse, so watch your step! On the upside, the landmass is almost exclusively covered by volcanic ash, crucial to start any form of life here. Additionally, the patient explorer will occassionally find small streches of flat land, on which it is easier to build."), },
	["6F"] = { N("The region class 6F designates very flat regions. They might have occassional lava lakes and that's it.") },
	["Z"] = { N("The region class Z is designated to unknown and unclassified regions.") },
}

-- line types
local T_C0 = 0 -- caption level 0
local T_C1 = 1 -- caption level 1
local T_D = 10 -- data point
local T_N = 11 -- normal line (with bullet point)
local T_X = 12 -- empty line
local T_I = 13 -- item render
local T_P = 14 -- normal line (without bullet point)
local T_PG = 15 -- normal line with image

local mg_name = minetest.settings:get("mg_name")

local get_hypertext = function(lines)
	local hyper = {}
	for l=1, #lines do
		local line = lines[l]
		if line[1] == T_N then
			table.insert(hyper, "• "..line[2])
		elseif line[1] == T_P then
			table.insert(hyper, line[2])
		elseif line[1] == T_PG then
			table.insert(hyper, "<img name="..line[3].." width=64 height=64 float=left>")
			table.insert(hyper, line[2])
		elseif line[1] == T_D then
			table.insert(hyper, "• "..S("@1: @2", "<b>"..S(line[2]).."</b>", line[3]))
		elseif line[1] == T_C0 then
			if l==1 then
				table.insert(hyper, "")
			end
			table.insert(hyper, "<bigger>"..S(line[2]).."</bigger>")
		elseif line[1] == T_C1 then
			if l==1 then
				table.insert(hyper, "")
			end
			table.insert(hyper, "<big>"..S(line[2]).."</big>")
		elseif line[1] == T_X then
			table.insert(hyper, "")
		elseif line[1] == T_I then
			local itemstr = ""
			for i=1, #line[2] do
				local item = line[2][i]
				itemstr = itemstr .. "<item name="..item..">"
			end
			table.insert(hyper, itemstr)
		else
			minetest.log("error", "[hades_info] Invalid line type in hypertext!")
		end
	end
	return table.concat(hyper, "\n")
end

local get_form = function(hypert, menu_type)
	return "size[9,10]"..
		"hypertext[0.25,0.5;9,9;info_panel;"..F(hypert).."]"..
		"button[2.5,9;4,1;main_"..menu_type..";"..F(S("Main menu")).."]"

end

local get_info_planet = function(player_name)
	local region_class
	if mg_name == "v5" then
		region_class = S("5")
	elseif mg_name == "v6" then
		local mgv6_spflags = minetest.settings:get_flags("mgv6_spflags")
		if mgv6_spflags.flat then
			region_class = S("6F")
		else
			region_class = S("6")
		end
	elseif mg_name == "v7" then
		region_class = S("7")
	elseif mg_name == "carpathian" then
		region_class = S("C")
	elseif mg_name == "valleys" then
		region_class = S("V")
	elseif mg_name == "flat" then
		region_class = S("F")
	elseif mg_name == "fractal" then
		local fractal_type = tonumber(minetest.settings:get("mgfractal_fractal")) or 1
		region_class = S("Q@1", fractal_type)
	else
		region_class = S("X")
	end

	local mobs_spawn = minetest.settings:get_bool("mobs_spawn", true)
	local mobs
	if mobs_spawn then
		mobs = { T_N, N("Signs of intelligent mutated organisms on surface (increased activity at night)") }
	else
		mobs = { T_N, N("No signs of intelligent life forms") }
	end

	local mg_flags = minetest.settings:get_flags("mg_flags")
	local ores, rocks, ores_i, rocks_i
	if mg_flags.ores then
		ores = { T_D, N("Ores detected"), N("Coal, Iron, Copper, Tin, Emerald, Unknown") }
		ores_i = { T_I, {"hades_core:stone_with_coal", "hades_core:stone_with_iron", "hades_core:stone_with_tin", "hades_core:stone_with_emerald", "hades_info:unknown" } }
		rocks = { T_D, N("Rocks detected"), N("Stone, Tuff, Chondrite, Unknown") }
		rocks_i = { T_I, {"hades_core:stone", "hades_core:tuff", "hades_core:chondrite", "hades_info:unknown" }}
	else
		ores = { T_D, N("Ores detected"), N("None") }
		ores_i = { T_X }
		rocks = { T_D, N("Rocks detected"), N("Stone") }
		rocks_i = { T_I, {"hades_core:stone"}}
	end
	local caves
	if mg_flags.caves then
		caves = { T_D, N("Structure"), N("Deep, complex cave systems") }
	else
		caves = { T_D, N("Structure"), N("Very high underground solidity, no cavities detected" ) }
	end
	local day_length, year_length
	local time_speed = tonumber(minetest.settings:get("time_speed")) or 72
	if time_speed == 0 then
		day_length = { T_D, N("Day length (in minutes)"), N("N/A (time anomaly)") }
		year_length = { T_D, N("Year length (in Hades days)"), N("N/A (time anomaly)") }
	else
		day_length = { T_D, N("Day length (in minutes)"), 1440 / time_speed }
		year_length = { T_D, N("Year length (in Hades days)"), hades_seasons.YEAR_LENGTH }
	end

	local lines = {
		{ T_C0, N("Planetary Data") },
		{ T_D,  N("Name"), N("Hades") },
		{ T_D,  N("Star"), N("Apollo") },
		{ T_D,  N("Moons"), "0" },
		{ T_D,  N("Gravity (in m/s²)"), tonumber(minetest.settings:get("movement_gravity")) or 10 },
		{ T_C1, N("Planet Motion") },
		year_length,
		day_length,
		{ T_D,  N("Seasons"), N("3 (Spring, Summer, Fall)") },
		{ T_D,  N("Season length (in Hades days)"), tostring(hades_seasons.SEASON_LENGTH) },
		{ T_C1, N("Atmosphere") },
		{ T_N,  N("Sulphuric composition") },
		{ T_D,  N("Weather"), N("Permanently overcast by sulphuric clouds") },
		{ T_C0, N("Planetary Scan Reports") },
		{ T_P,  N("Note: This scan report was created before the first terraforming missions were started. It might be outdated.") },

		{ T_C1, N("Regional Topography Scan") },
		{ T_D,  N("Region class"), region_class },
		{ T_D,  N("Dominant blocks"), N("Volcanic Ash, Lava, Stone, Tuff") },
		{ T_I,  {"hades_core:ash", "hades_core:lava_source", "hades_core:stone", "hades_core:tuff"} },
		{ T_D,  N("Water prelavence"), N("Rare lakes and springs") },
		{ T_I,  {"hades_core:water_source"} },
		{ T_C1, N("Underground Scan") },
		caves,
		rocks,
		rocks_i,
		ores,
		ores_i,
		{ T_C1, N("Life Scan") },
		mobs,
	}
	local hypert = get_hypertext(lines)
	local form = get_form(hypert, "lore")
	minetest.show_formspec(player_name, "hades_info:info_lore", form)
end

get_info_region = function(player_name)
	local lines
	local class
	if mg_name == "v6" then
		local mgv6_spflags = minetest.settings:get_flags("mgv6_spflags")
		if mgv6_spflags.flat then
			class = "6F"
		else
			class = "6"
		end
	else
		class = "Z"
	end
	local msg
	if class == "6" then
		msg = N("This region has been assigned the region class 6.")
	elseif class == "6F" then
		msg = N("This region has been assigned the region class 6F.")
	elseif class == "Z" then
		msg = N("This region has been assigned the region class Z.")
	end
	lines = {
		{ T_C0, N("Region class") },
		{ T_P, msg },
		{ T_P, region_classes[class][1] },
	}
	local hypert = get_hypertext(lines)
	local form = get_form(hypert, "lore")
	minetest.show_formspec(player_name, "hades_info:info_lore", form)
end

local static_lines = {}
static_lines.mission = {
{ T_C0, N("Briefing") },
{ T_P, N("Thank you for volunteering for the Galactic Builders Terraforming Collective! It is our mission to create more habitable worlds to build a thriving society, one block at a time! You are at the forefront of intergalactic terraforming and about to embark on an exciting adventure.") },
{ T_P, N("You have arrived at the fiery world of Hades, a planet with sulphuric sky and high volcanic activity. It might not seem like the best place to terraform, but previous exploration missions discovered small amounts of water. With your help, evolution can be sped up.") },
{ T_P, N("But be warned: The landscape is tricky and dangerous. Watch your step and don't fall into the lava!") },
{ T_P, N("Your primary mission is turn this fiery and dangerous landscape into a nice habitable zone. How exactly you do this is completely up to you. Good luck!") },
}

static_lines.planet_description = {
{ T_C0, N("Planet Hades") },
{ T_P,  N("Hades is a very large volcanic planet that revolves around Apollo, its main star. It's surrounded by a thick sulphuric atmosphere and has a surface consisting of volcanic ash, stone and lava. At first, it seems to be hostile to life, but that impression is false. Small traces of water have been detected, which is, of course, where all life begins. It would only be a question of time until Hades develops complex life forms on its own, but we're here to speed up this process.") },

{ T_P,  N("Hades is in an elliptic orbit around Apollo, its star, with a low orbital eccentricity. When you follow Appolo in the sky throughout the year, you will see how Appollo will notably change in its apparent size. On Summer Solstice, Apoollo appears about twice at large in the sky than on New Year's Day.") },

{ T_C1, N("Seasons") },
{ T_P,  N("The Science Division has crunched the numbers and determined that seasonal variations can occur thanks to its orbit. They've classified the Hades year into three seasons: spring, summer and fall.") },
{ T_P,  N("The year begins on New Year's Day, which is the beginning of spring. On the first day, Hades is furthest from Apollo. In spring, Hades moves rapidly closer and closer to Apollo, until summer is reached. Summer is the hottest season, during which Hades remains rather close to Apollo. Summer Solstice occurs in the middle of summer. Summer is followed by fall, in which Hades rapidly moves further away from Apollo and returns to its starting point. The next year begins, and the cycle starts again.") },
{ T_P,  N("There's no winter, it's hot in the entire year and the time in which Hades is furthest away from Apollo is too short to justify a season in its own right.") },

{ T_C1, N("Why was Hades chosen?") },
{ T_P,  N("In one word, compromise.") },
{ T_P,  N("Many people have criticized the decision to terraform Hades and indeed, there were are many downsides, and many clearly superior candidates are known. However, due to material costs for transport and fuel, pretty much all of the more promising worlds are simply out of reach. There are many worlds that are even worse than Hades, and it's also a fact that early explorers discovered traces of water, something that's very critical for terraforming and landscaping.") },
{ T_P,  N("The people against visiting Hades were mainly coming from the Terraforming Collective, stating it would be an overly dangerous endeavor.") },
{ T_P,  N("Those in favor of it agreed that it will be a tough experiment, but one that might be worth it. Also, the dangerous conditions can be alleviated by the Science Division by strongly focusing on researching technologies specifically made for the Hades project, several people in the Science Division already announced they would be more than happy to assist the Hades project.") },
{ T_P,  N("After lots of hefty debating, discussion and arguing, Hades was eventually chosen. Although the opponents were not entirely convinced, they grudgingly agreed to support the ambitious project. Especially the 'water' argument was one too hard to argue against.") },
{ T_P,  N("And that's how Hades was chosen.") },
{ T_P,  N("A few people still argue that Hades was the wrong choice, but they are not being heard. It is too late to turn back now, and the alternatives currently don't look bright anyway. Everyone agrees, though, that Hades will be a high-risk high-reward project. And maybe, just maybe, even one toxic lava-filled wasteland such as Hades can actually be turned into a blooming wonderland.") },
}

static_lines.equipment = {
{ T_C0, N("Special Equipment") },
{ T_P,  N("To the first explorers, visiting planet Hades is quite dangerous. Thus, the Science Division has developed special technologies to aid with the unique challenges the explorers will face.") },
{ T_C1, N("Breathing Apparatus") },
{ T_P,  N("Since the atmosphere of Hades is highly sulphuric, every GBTC volunteer has been surgically enhanced with the implanted breathing apparatus. It filters out all toxins and allows you to breathe in safely. It is fully automatic and requires no maintenance.") },
{ T_C1, N("Heat-resistant Skin Spray") },
{ T_P,  N([[To deal with the extreme environment temperatures of Hades, the Heat-Resistant Skin Spray was developed. This spray is strong enough to protect you from the heat of the environment. However, direct contact with lava is still harmful, so be careful.]]) },
{ T_P,  N([[All GBTC candidates are required to undergo this skin treatment before being permitted to enter the GBTC.]]) },
{ T_P,  N([[Fun fact: UV radiation from Apollo (Hades' star) is of no concern, as little to no light in the UV spectrum is emitted from it.]]) },
{ T_C1, N("Safety Teleport") },
{ T_P,  N([[Since there is a lot of lava on the surface of Hades, there's a low chance you might end up in lava when you arrive. So the Science Division has developed the Safety Teleport mechanism. It detects when you arrive at a dangerous spot and tries to teleport you at a safe nearby place. This mechanism is fully automatic. However, it is not perfect, it might fail if no safe spot could be found.]]) },
}

static_lines.galactic_builders = {
{ T_C0, N("Galactic Builders") },
{ T_PG, N("The Galactic Builders is an interplanetary group of people who have banded together with one shared goal: To build and maintain habitable settlements all across the galaxy for the betterment of society."), "hades_info_galactic_builders.png" },
{ T_P,  N("The group as a whole is difficult to pin down, as there is no hierarchy, leadership or anything like that and people tend to disagree all the time with everything. That having said, that doesn't mean there isn't any form of organization.") },
{ T_P,  N("Although not \"official\", the Galactic Builders recognize several \"subdivisions\", smaller groups that aim at a specific task. The biggest known subdivisions are:") },
{ T_P,  N("Terraforming Collective (GBTC): They visit planets to transform them to habitable places via terraforming, building, etc.") },
{ T_P,  N("Science Division (GBTC): They research and develop technologies required for the goals of the Galactic Builders. Also includes the search for suitable planets.") },
{ T_P,  N("Piloting Division (GBPD): Responsible for transport of materials to support the planets. Also includes the construction of space outposts close to the planets.") },
}

static_lines.subdivisions = {
{ T_C0, N("Subdivisions") },
{ T_P,  N("These are the largest 3 subdivisions of the Galactic Builders:") },
{ T_C1, N("Terraforming Collective (GBTC)")},
{ T_PG, N("This is your subdivision. Members of the Terraforming Collective visit planets that have been chosen to be suitable and transform them into habitable places via terraforming, building and other means.", "hades_info_galactic_builders_terraforming_collective.png"), "hades_info_galactic_builders_terraforming_collective.png" } ,
{ T_P,  N("The terms \"suitable\" and \"habitable\" are applied very loosely here and every GBTC builder has their own idea of how to achieve these goals, and it\'s not unusual those ideas are contradicting each other. Many attempts have been made to formalize the goals of the GBTC, but they all have failed.") },
{ T_P,  N("Whether you build primitive huts, astonishing mansions, an excentric and undifinable mess of random blocks, strange underground bases, efficient food farms, or anything else, it's generally considered to be working towards the goal.") },
{ T_P,  N("If the GBTC has any principles at all, it is probably the idea that if at least one person (including the builder) believes the construction is useful, it is useful.") },
{ T_P,  N("Given the highly chaotic nature, the other subdivisions rarely dare to question the motives of the GBTC. They don't really have a choice anyway.") },

{ T_C1, N("Science Division (GBSD)"), },
{ T_PG, N("Scientists of various disciplines come together to research the technologies neccessary for the tasks needed. This division also includes the search for suitable planets."), "hades_info_galactic_builders_science_division.png" },
{ T_P,  N("The Science Division stricly focuses on research that benefits the Galactic Builders only, other research is not done. Yet it is one of the most renowned science groups in the galaxy because many of their findings turn out to be of great use outside of terraforming.") },
{ T_P,  N("It is standard practice to publish all scientific findings galaxy-wide, although this is not an official rule. If anyone is caught hiding something, that's almost universally very frowned upon; such people tend to not get invited into parties. This one of the few principles that pretty much everyone in the Galactic Builders agrees upon.") },
{ T_P,  N("Apart from scientists, there's also a small yet highly dedicated sub-group of mostly non-scientists who do nothing else than observe other scientific groups in the galaxy in order to transmit any useful results directly back to the Galactic Builders. Not all science groups in the galaxy are as transparent as the GBSD, so they are infiltrated in order to extract the knowledge that others rather keep hidden ...") },

{ T_C1, N("Piloting Division (GBPD)"), },
{ T_PG, N("This subdivision is responsible for the transport of materials to support the planets that are going to be terraformed. This division also includes engineers who construct outposts in space above the target planets."), "hades_info_galactic_builders_piloting_division.png" },
{ T_P,  N("Unlike the other subdivision, this one actually does have fairly strict rules due to flight safety regulations. Reckless flying maneuvers in the past often lead to disaster and people decided enough is enough. They say, every rule in the book was written with blood.") },
{ T_P,  N("While there are no formal punishments for violating any rules, reckless pilots will soon find themselves in deep trouble. They will learn soon enough that nobody wants to assign them any tasks anymore, which basically means they have to reconsider their life choices.") },
{ T_P,  N("Within the Piloting Division, there's an entire sub-group of people dedicated (some might say even obsessed) only to track every single action of the pilots and to let everyone in the whole Galactic Builders association know of reckless behavior.") },
{ T_P,  N("Despite these circumstances, work as a pilot remains popular, many pilots say it's very rewarding to know they contribute to something greater.") },
}

static_lines.first_tree = {
{ T_C0, N("The First Tree") },
{ T_P,  N("As you already know from your GBTC training program, growing your first tree is crucial for your success.") },
{ T_P,  N("As a quick reminder, here's a quick checklist of what you need to do:") },
{ T_N,  N("Bring a pickaxe and apples with you") },
{ T_N,  N("If you don't have those things, fight some mutants") },
{ T_N,  N("On the surface, find some water") },
{ T_N,  N("Craft volcanic ash, then fertile sand") },
{ T_N,  N("Place fertile sand next to water, eventually it will become dirt") },
{ T_N,  N("Combine an apple with dirt to craft a sapling") },
{ T_N,  N("Place the sapling on dirt in light and let it grow") },
{ T_X },
{ T_P,  N("And that's your first tree!") },
{ T_P,  N("Remember, in your inventory there is a crafting grid, use it to combine items. Use your crafting guide to see what you can craft and how.") },
}

static_lines.mutants = {
{ T_C0, N("Beware of Mutants!") },
{ T_P,  N("Our sensors have detected life signatures which have been classified as 'mutants'. We're afraid those mutants were previous explorers that couldn't make it and now walk the surface aimlessly. They tend to come out at night more often and might still carry some basic tools and food. If you've lost all your supplies, fighting those mutants might be your only chance to start over.") },
}

get_info_static = function(id, player_name, menu_type)
	local lines = static_lines[id]
	assert(type(lines) == "table")
	local hypert = get_hypertext(lines)
	local form = get_form(hypert, menu_type)
	minetest.show_formspec(player_name, "hades_info:info_"..menu_type, form)
end

local entries_mission = { "mission", "first_tree", "mutants", "equipment" }
local entries_lore = { "planet_description", "planet", "region", "galactic_builders", "subdivisions" }

get_main_menu = function(player_name, menu_type)
	local form = [[size[9,10]
		label[0,9.5;]]..F(S("Date: @1", hades_seasons.get_date_str())).."]"
	local entries

	if menu_type == "mission" then
		form = form .. [[label[1,0;]]..F(S("Welcome to the GBTC Mission Terminal! Select a topic:")).."]"
		entries = entries_mission

	elseif menu_type == "lore" then
		form = form .. [[label[1,0;]]..F(S("Welcome to the Hades Information Terminal! Select a topic:")).."]"
		entries = entries_lore
	end

	local y = 1
	local entry
	for e = 1, #entries do
		local id, name
		id = entries[e]
		if id == "planet" then
			entry = static_lines[id]
			name = S("Planetary data")
		elseif id == "region" then
			name = S("Region class")
		else
			name = static_lines[id][1][2]
		end
		form = form .. "button[2,"..y..";5,1;"..id..";"..F(name).."]"
		y = y + 1
	end

	minetest.show_formspec(player_name, "hades_info:info_"..menu_type, form)
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "hades_info:info_lore" and formname ~= "hades_info:info_mission" then
		return
	end
	local player_name = player:get_player_name()
	if fields.planet then
		get_info_planet(player_name)
		return
	elseif fields.region then
		get_info_region(player_name)
	elseif fields.main_mission then
		get_main_menu(player_name, "mission")
	elseif fields.main_lore then
		get_main_menu(player_name, "lore")
	end
	for id,_ in pairs(static_lines) do
		if fields[id] then
			local menu_type = string.sub(formname, 17)
			get_info_static(id, player_name, menu_type)
			break
		end
	end
end)

minetest.register_chatcommand("info_mission", {
	description = S("Display information about your mission"),
	func = function(player_name, param)
		get_main_menu(player_name, "mission")
	end
})
minetest.register_chatcommand("info_world", {
	description = S("Get information about this world"),
	func = function(player_name)
		get_main_menu(player_name, "lore")
	end
})

-- TODO: Add info terminal nodes



dofile(minetest.get_modpath("hades_info").."/fake_item.lua")
