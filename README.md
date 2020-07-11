# Hades Revisited
Version 0.4.5

A game for Minetest, focused on terraforming.
Based on *Minetest Hades* by Glünngi.

Requires Minetest 5.3.0.

## Installation
To play this game in Minetest, insert this directory into

    /games/hades_revisited

in the Minetest data folder.

Minetest can be found online at <https://github.com/minetest/minetest/>.

## Important notices and short game guide

* Be sure the `minetest.conf` file in the main Minetest directory doesn't have any parameters who are in conflict with the `minetest.conf` file from the `hades_revisited` directory. Especially mapgen parameters or stuff like `give_initial_stuff = false`
* Hades Revisited only works in mapgen v6.
* There only 1 biome, with the focus on terraforming.
* Not everyone will like this game. But maybe there are some freaks out there ;-)
* Take another map seed if you spawn on lava.
* External mods can make some trouble, there are many changes in default

## Background story

An attempt to colonize planet Hades went horribly wrong: Your colony ship crashed and you survived with very limited supplies.
Hades is a very young planet and characterized by highly volcanic activities and a lot of fertile ash. Asteroids have brought some water on Hades.
So there are the basics for life, you just need to help it to get the nature going, make the planet habitable and survive.
Not every colonist has duly arrived. Most of them have been mutated and strayed around the planet. But for some unknown reason they don't suffer water.
There are creatures and most of them live in the underground and darkness.

## How to start:
You start with the following items: 1 steel pickaxe, 12 apples, 1 wall lamp and a stick.
Watch out for flowing lava above you at first!

Next you should dig some stone to craft a stone sword with the stick.
Now explore the area and search for some water.

Dig some stone and ash to craft fertile sand and place it in neighbor to water to become dirt.
Take a dirt and a apple to craft a sapling. Plant the sapling on dirt to become wood and leaves from the tree.
If you ran out of apples or lost your pickaxe, kill some mutants. They sometimes drop apples, pickaxes and other things.
Make more dirt and place it above the water.

Take 2 mossy stone (near water) and a dirt to craft grass.

Grass + dirt = jungle grass.

Dig the grass and the junglegrass to get some seeds.

Plant the seeds on the soil that you have placed over the water source.

And now survive with the crafting guide.


## Things you should know

### Block transformations
* Fertile sand (which must be crafted) turns into dirt in the near of 10 nodes to water and direct contact of a dirt.
* Volcanic ash turns into fertile sand if leaves are nearly.
* Volcanic ash slowly turns into clay when next to water.
* Flowing water turns lava source into water source and flowing lava into volcanic gravel.
* Stone, tuff and cobblestone become burned when next to lava.
* Stone, tuff and cobblestone become mossy when next to water.
* Mossy cobblestone turns into gravel when next to flowing water.
* Chondrite turns into marble if it is below -500 and it must be in near 4 nodes to lava and it also must have direct contact to water.
* Volcanic gravel turns into obsidian below Y=-1000. It must have direct contact to lava and water must be nearly.
* Sugarcane spawns near of papyrus. It dosnt need water to grow, just dirt

### Other gameplay stuff
* There is no fire
* Beds do *not* allow you to skip the night, they only set the spawn point
* Volcanic gravel can only be dug by a shovel.
* Mobs spawn on stone, ash and tuff
* Tuff is too breakable for tools so it can't be used to craft stone tools
* There are no buckets, you need a water pump to spread water.
* Weak torches can be upgraded with a string to bright torches
* Plants grow with light level of 8 or higher. Underground farming is thus possible
* 2 emeralds = 1 sapphire. 2 sapphires = 1 ruby. 2 rubies = 1 diamond.
* With the Staff of Gaia you can turn following blocks into dirt: ash, fertile sand, burned stone, stone, cobble, mossy stone, tuff, burned tuff, mossytuff, mossy cobble
* Pale tree saplings can be plant on ash
* Cacti grow on ash
* Prismatic furnance is faster than the original furnance and has more slots

### Ores

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

## List of external mods (incomplete)
**Important**: A lot of the mods used in this game have been heavily changed
from their original.

`3dforniture`
<https://forum.minetest.net/viewtopic.php?id=2207>

`bags`
<https://forum.minetest.net/viewtopic.php?id=3081>

`bedrock`
<http://www.moontest.org/viewtopic.php?f=11&t=9231>

`boost_cart`
<https://forum.minetest.net/viewtopic.php?f=11&t=10172>

`farming_plus`
<https://forum.minetest.net/viewtopic.php?id=2787>

`glowcrystals`
<https://forum.minetest.net/viewtopic.php?id=9047>

`highlandpools`
<https://forum.minetest.net/viewtopic.php?id=8400>

`item_tweaks`
<https://github.com/minetest-technic/item_tweaks>

`item_frames`
<https://forum.minetest.net/viewtopic.php?id=5600>

`hades_chests` (based on `kerova`)
<https://forum.minetest.net/viewtopic.php?id=8054>

`mesecons`
<https://forum.minetest.net/viewtopic.php?t=628>

`mobs` (Mobs Redo)
<https://forum.minetest.net/viewtopic.php?t=9917>
<https://forum.minetest.net/viewtopic.php?f=15&t=9184>

`pipeworks`
<https://forum.minetest.net/viewtopic.php?t=2155>

`plantlife` (old destroyed code)
<https://forum.minetest.net/viewtopic.php?id=3898>

`signs_lib`
<https://forum.minetest.net/viewtopic.php?id=2041>

`trash_can`
<https://forum.minetest.net/viewtopic.php?id=6315>

`travelnet`
<https://forum.minetest.net/viewtopic.php?id=4877>

`vines`
<https://forum.minetest.net/viewtopic.php?id=2344>


## Licensing
This game is free software. It has been licensed under these licenses:

* GNU LGPLv2.1 (or later) for the code
* CC BY-SA 3.0 for the media

Some mods have separate licenses:

* `3dfornitore`: GPLv2
* `travelnet`: GPLv3
* `bags`: New BSD License
* `bedrock`: zlib license
* `signs_lib`: LGPLv3
* `mesecons` (entire modpack): LGPLv3 for code, CC BY-SA 3.0 for media
* `simple_bushes`: WTFPL for code, CC BY-SA 4.0 for media

For detailed credits and author information, check out the readme files of the
individual mods (in the `mods` directory).

Sorry for the mess, it might be cleaned up later.
