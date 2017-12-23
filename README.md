# Hades Revisited
A Minetest subgame

To play this game in Minetest, insert this directory into

    /games/hades_revisited

in the Minetest data folder.

Minetest can be found online at <https://github.com/minetest/minetest/>.

All my work is licenced under the MIT License.
The extern mods have different licenses. look at the modfolders for details.

## Important notices and short game guide

* It's a subgame, so you must install it in the `games` directory.
* Be sure that the `minetest.conf` file in the main directory of Minetest doesn't have any parameters who are in conflict with the `minetest.conf` file from the `hades_revisited` directory. Especiall mapgen parameters or stuff like `give_initial_stuff = false` - because the parameter of the main conf file overwrites the Hades conf file parameter, and this can have some unwelcome effects
* Hades Revisited is developed for mapgen v6.
* There only 1 biome, with the focus on terraforming. Not everyone will like this game. But maybe there are some freaks out there ;-)
* Take another map seed if you spawn on lava.
* External mods can make some trouble, there are many chances on default

## Background story

Your colony ship crashed on the planet Hades. Hades is a very young planet and characterized by highly volcanic activities and a lot of fertile ash. Asteroids have brought some water on Hades.
So there are the basics for life, you just need to help them to get the nature going, make the planet habitable and survive.
Not every colonist has duly arrived. Most of them have been mutated and strayed around the planet. But for some unknown reason they don't suffer water.
Hades wasn't unpeopled. There are creatures and most of them live in the underground and darkness.

## How to start:
You crashed on Hades with the following items: 1 steel pickaxe, 12 apples, 1 wall lamp and a stick.
At first you should look up to be sure that no lava is flowing down on you.

Next you should dig some stone to craft a stone sword with the stick.
Now explore the area and search for some water.

Dig some stone and ash to craft fertile sand and place it in neighbor to water to become dirt.
Take a dirt and a apple to craft a sapling. Plant the sapling on dirt to become wood and leaves from the tree.
Make more dirt and place it above the water.
((Sometimes the soil dry out, when you leave the area, when is placed on water level - so is better to place the dirt one node above the water level. Then should it not happen))

Take 2 mossy stone (near water) and a dirt to craft grass.

Grass + dirt = junglegrass

Dig the grass and the junglegrass to get some seeds.

Plant the seeds on the soil that you have placed over the water source.

And now survive with the crafting guide.

## Things you should know

* There is no fire
* Flowing water turns lava source into water source and flowing lava into volcanic gravel
* Volcanic gravel can only be dug by a shovel.
* Mobs spawn on stone, ash and tuff
* Ash turns into clay if it has contact to water.
* Ash also turns into fertile sand if leaves are nearly.
* Cobblestone turns into mossy cobblestone if it have contact to water. And mossy cobble turns into gravel if it have contact to flowing water.
* Tuff is too breakable for tools so it can't be used to craft stone tools
* There are no buckets, you need a waterpump to spread water.
* Below Y = -500 you can build a marble factory. Chondrit turns into marble if it is below -500 and it must be in near 4 nodes to lava and it also must have direct contact to water.
* Volcanic gravel turns into obsidian below Y=-1000. It must have direct contact to lava and water must be nearly.
* Weak torches can be upgraded with a string to brigtht torches
* Plants grow with light level of 8 or higher. Underground farming is thus possible
* 2 emeralds = 1 sapphire. 2 sapphires = 1 ruby. 2 rubies = 1 diamond.
* Sugarcane spawns near of papyrus. It dosnt need water to grow, just dirt
* Fertile sand turns into dirt in the near of 10 nodes to water and direct contact of a dirt.
* With the Staff of Gaia you can turn following blocks into dirt: ash, fertile sand, burned stone, stone, cobble, mossy stone, tuff, burned tuff, mossytuff, mossycobble
* Pale tree saplings can be plant on ash
* Cactus grows on ash
* Prismatic furnance is faster than the original furnance

## Ores

Ores generate at and below the following Y levels:

* Coal: +60
* Iron:  0
* Copper: -115
* Tin: -115
* Mese: -200
* Gold: -333
* Emerald: +20
* Sapphire: - 300
* Ruby: -900
* Diamond: -1200
* Max. ore generation at -10000

## Hints
### A save mining experience:

    w = water
    l = ladder
    o = light
    s = stone
    - = air
    X = lava

    ***********
    ssswlsss
    ssswlsss
    ssswloss
    ssswlsss
    ssswlsss
    ssswssss
    ss-w--ss
    ss-w--ss
    XXXXXXXX
    ssssssss
    ***********

## List of external mods

3d forniture
https://forum.minetest.net/viewtopic.php?id=2207

bags
https://forum.minetest.net/viewtopic.php?id=3081

bedrock
http://www.moontest.org/viewtopic.php?f=11&t=9231

boost_cart
https://forum.minetest.net/viewtopic.php?f=11&t=10172

farming_plus
https://forum.minetest.net/viewtopic.php?id=2787

glowcrystals
https://forum.minetest.net/viewtopic.php?id=9047

home gui
https://forum.minetest.net/viewtopic.php?id=3101

highlandpools
https://forum.minetest.net/viewtopic.php?id=8400

hud
https://forum.minetest.net/viewtopic.php?id=6342

inventory plus
https://forum.minetest.net/viewtopic.php?id=3100

item tweaks
https://github.com/minetest-technic/item_tweaks

item frames
https://forum.minetest.net/viewtopic.php?id=5600

kerova
https://forum.minetest.net/viewtopic.php?id=8054

mesecons
https://forum.minetest.net/viewtopic.php?t=628

mobs redo (an old version with elements from adventuretestgame)
https://forum.minetest.net/viewtopic.php?t=9917
https://forum.minetest.net/viewtopic.php?f=15&t=9184

pipeworks
https://forum.minetest.net/viewtopic.php?t=2155

plantlife (old destroyed code)
https://forum.minetest.net/viewtopic.php?id=3898

signs lib
https://forum.minetest.net/viewtopic.php?id=2041

trash can
https://forum.minetest.net/viewtopic.php?id=6315

travel net
https://forum.minetest.net/viewtopic.php?id=4877

vines
https://forum.minetest.net/viewtopic.php?id=2344

zcg
https://forum.minetest.net/viewtopic.php?id=5564


