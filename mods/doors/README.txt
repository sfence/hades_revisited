Doors for Hades Revisited

(fork of Doors Redux Mod v1.0 by Leslie E. Krause)

Doors for Hades Revisited is the mod that adds doors, trapdoors and fence gates
to Hades Revisited.
It's a fork of the Doors Redux mod with added functionality.

Some of the notable features include:

- Distinctive sound fx when attempting to open a locked or blocked door
- Multiple locking modes for all doors: unlocked, locked, and shared
- Multiple closing modes for all doors: auto-close, hold-open, and manual
- Support for node-center and node-offset door positions
- Wrench tool cycles between door locking and closing modes
- Screwdriver tool alternates door position and direction
- API to add new door (NOT backwards-compatible!)

With the screwdriver tool you
can reposition almost any door depending on the mode of operation. Left-clicking switches
the hand between left vs. right. Whereas right-clicking switches the position between
center vs. offset. It's really that easy!

The wrench is another powerful tool in your arsenal for manipulating doors and trapdoors.
It can be crafted from just one steel ingot and one steel rod. Like the screwdriver from
Minetest Game, the wrench has two modes of operation.

To adjust the closing mode, right-click the door or trapdoor with a wrench. The changes
will be indicated in chat as follows:

 - Normal (door will remain open or closed as per usual operation)
 - Auto-Close (door will close automatically when opened)
 - Hold-Open (door will be non-closable when opened)

Auto-closing doors are ideally suited for high-traffic commercial buildings like shopping
centers, where doors must not be left open unattended. The closing mechanism activates
after a preset time period, defined by an internal variable.

Hold-open doors are ideal for when you want to allow for uninterupted passage through a
doorway, without having to remove the door entirely. Fire doors in schools are a typical
example of doors that are intended to remain open, except during emergencies.

To adjust the locking mode, punch the door or trapdoor with a wrench. The changes
will be indicated in chat as follows:

 - Unlocked (door may be opened and closed by any player)
 - Locked (door may only be opened and closed by the owner)
 - Shared (door may only be opened and closed by members of the protection area)

When placing a door, it will be unlocked.

Below are some helpful notes regarding functionality that may be somewhat unique
in this mod:

 - Players that have the 'protection_bypass' privilege, can open, close, and otherwise
   manipulate any door regardless of ownership or locking-mode.

 - Use of the wrench and screwdriver is restricted to the owner of the door (in the case
   of protected doors) or, otherwise, members of the protected area.

 - The owner of a protected door can always dig the door that they placed, even when it
   is in a protected area that is controlled by another player.

Custom door definitions may be added by using the API in your own mods.
The following function is available for registering new doors:

   doors.register_door( name, def )
   Registers a door withe the given name and definition table.

Several fields of the definition table are required, but most are optional.

 * def.tiles - the list of textures to apply to the model
 * def.description - the description to show in the craft guide and itemstack tooltips
 * def.inventory_image - the texture for the inventory item
 * def.groups - the group levels of the node ('door = 1' will be added automatically)
 * def.is_lockable - whether the locking mode is adjustable (default is true)
 * def.is_closable - whether the closing mode is adjustable (default is true)
 * def.sound_open - sound effect when opening
 * def.sound_close - sound effect when closing
 * def.sound_locked - sound effect when locked
 * def.sound_locking - sound effect when setting lock state to locked
 * def.sound_unlocking - sound effect when setting lock state to unlocked
 * def.sound_shared - sound effect when setting lock state to shared
 * def.sound_held_open - sound effect when trying to open a door in hold-open state
                         or when center door is blocked
 * def.sound_closing_mode - sound effect when changing door closing mode
 * def.can_center - whether center positioning (default is true)

For programmatically examining and manipulating doors, two API functions are provided:

  doors.get_door( pos )
  Returns an object for working with a door at the given position.

The door object, returned by the function above, provides the following methods:

  door_obj.get_properties( )
  Returns a table with four fields describing the various properties of the door:

   * is_open - true for opened or false for closed, as determined by the state
   * type - either "center" or "offset", as determined by the state
   * hand - either "left" or "right", as determined by the state
   * face - ranges from 1 to 4, corresponding with the value of param2

  door_obj.open( )
  Opens the door, unless it is already in an opened state. This will circumvent any
  ownership checks.

  door_obj.close( )
  Closes the door, unless it is already in a closed state. This will circumvent any
  ownership checks.

A similar function, doors.get_trapdoor( ), allows for working with trapdoors. The object
returned provides the same methods as those above.


Compatability
----------------------

This mod was made for Hades Revisited and as such, is not intended to be used outside of it.

Source code license
----------------------------------------------------------

GNU Lesser General Public License v3 (LGPL-3.0)

Copyright (c) 2018-2020, Leslie E. Krause (leslie@searstower.org)

This program is free software; you can redistribute it and/or modify it under the terms of
the GNU Lesser General Public License as published by the Free Software Foundation; either
version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

http://www.gnu.org/licenses/lgpl-2.1.html


Multimedia License (textures, sounds, and models)
----------------------------------------------------------

Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0)

   /models/door_a.obj
   by sofar

   /models/door_b.obj
   by sofar

   /models/fencegate_open.obj
   by sofar

   /models/fencegate_closed.obj
   by sofar

   /textures/doors_door_dungeon1.png
   by sorcerykid

   /textures/doors_door_dungeon2.png
   by sorcerykid

   /textures/doors_item_obsidian_glass.png
   by sorcerykid

   /textures/doors_item_steel.png
   by PilzAdam

   /textures/doors_item_wood.png
   by Fernando Zapata

   /textures/doors_trapdoor.png
   by BlockMen

   /textures/doors_trapdoor_side.png
   by paramat

   /textures/doors_trapdoor_steel.png
   by sofar

   /textures/doors_trapdoor_steel_side.png
   by paramat

   /textures/doors_door_glass.png
   by Krock & paramat
   inspired by VanessaE

   /textures/doors_door_obsidian_glass.png
   by red-001
   inspired by PilzAdam & BlockMen

   /textures/doors_wrench.png
   obtained from https://github.com/Rogier-5/minetest-mod-rotate
   by Rogier

   /textures/doors_door_steel_bar.png
   /textures/doors_item_steel_bar.png
   /textures/doors_door_rusty_bar.png
   /textures/doors_item_rusty_bar.png
   /textures/doors_trapdoor_steel_bar.png
   /textures/doors_trapdoor_steel_bar_side.png
   /textures/doors_trapdoor_rusty_bar.png
   /textures/doors_trapdoor_rusty_bar_side.png
   derivate works of Minetest Game textures, by Minetest Game developers

   /sounds/doors_door_close.ogg
   by bennstir

   /sounds/doors_door_open.ogg
   by CGEffex
   modified by BlockMen

   /sounds/doors_door_locked.ogg
   obtained from https://freesound.org/people/BenjaminNelan/sounds/321087/
   by BenjaminNelan (relicensed CC0)
   modified by sorceryid

   /sounds/doors_door_locked_stone.ogg
   obtained from https://freesound.org/people/F.M.Audio/sounds/570534/
   by F.M.Audio (CC BY 3.0)

   /sounds/doors_door_locking.ogg
   /sounds/doors_door_unlocking.ogg
   /sounds/doors_door_sharing.ogg
   obtained from https://freesound.org/people/Ryding/sounds/110137/
   by Ryding (relicensed CC0)
   modified by Wuzzy

   /sounds/doors_door_held_open.ogg
   obtained from https://freesound.org/people/Brutavious08/sounds/332963/
   by Brutavious08 (relicensed CC0)

   /sounds/doors_door_closing_mode.ogg
   obtained from https://freesound.org/people/xxqmanxx/sounds/147018/
   by xxqmanxx (relicensed CC0)
   modified by Wuzzy

   /sounds/doors_fencegate_close.ogg
   obtained from http://www.freesound.org/people/BarkersPinhead/sounds/274807/
   by BarkersPinhead
   obtained from http://www.freesound.org/people/rivernile7/sounds/249573/
   by rivernile7

   /sounds/doors_fencegate_open.ogg
   obtained from http://www.freesound.org/people/mhtaylor67/sounds/126041/
   by mhtaylor67 (relicensed CC0)

   /sounds/doors_glass_door_close.ogg
   obtained from https://www.freesound.org/people/SkeetMasterFunk69/sounds/235546/
   by SkeetMasterFunk69 (relicensed CC0)

   /sounds/doors_glass_door_open.ogg
   obtained from https://www.freesound.org/people/SkeetMasterFunk69/sounds/235546/
   by SkeetMasterFunk69 (relicensed CC0)

   /sounds/doors_steel_door_close.ogg
   by HazMatt

   /sounds/doors_steel_door_open.ogg
   by HazMatt

   /sounds/mcl_fences_nether_brick_fence_gate_open.ogg
   /sounds/mcl_fences_nether_brick_fence_gate_close.ogg
   obtained from https://www.freesound.org/people/Slanesh/sounds/31770
   by Slanesh (CC BY 3.0)

   /sounds/doors_door_steel_bar_open.ogg
   /sounds/doors_door_steel_bar_close.ogg
   originally licensed CC0

   Note: Any media file not mentioned here falls under the Multimedia License
   (see above).


You are free to:
Share — copy and redistribute the material in any medium or format.
Adapt — remix, transform, and build upon the material for any purpose, even commercially.
The licensor cannot revoke these freedoms as long as you follow the license terms.

Under the following terms:

Attribution — You must give appropriate credit, provide a link to the license, and
indicate if changes were made. You may do so in any reasonable manner, but not in any way
that suggests the licensor endorses you or your use.

No additional restrictions — You may not apply legal terms or technological measures that
legally restrict others from doing anything the license permits.

Notices:

You do not have to comply with the license for elements of the material in the public
domain or where your use is permitted by an applicable exception or limitation.
No warranties are given. The license may not give you all of the permissions necessary
for your intended use. For example, other rights such as publicity, privacy, or moral
rights may limit how you use the material.

For more details:
http://creativecommons.org/licenses/by-sa/3.0/


Multimedia License (textures, sounds, and models)
----------------------------------------------------------

Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)

   /models/door_c.obj
   by TumeniNodes

   /models/door_d.obj
   by TumeniNodes

   /models/door_e.obj
   by TumeniNodes

You are free to:
Share — copy and redistribute the material in any medium or format.
Adapt — remix, transform, and build upon the material for any purpose, even commercially.
The licensor cannot revoke these freedoms as long as you follow the license terms.

Under the following terms:

Attribution — You must give appropriate credit, provide a link to the license, and
indicate if changes were made. You may do so in any reasonable manner, but not in any way
that suggests the licensor endorses you or your use.

ShareAlike — If you remix, transform, or build upon the material, you must distribute
your contributions under the same license as the original.

No additional restrictions — You may not apply legal terms or technological measures that
legally restrict others from doing anything the license permits.

Notices:

You do not have to comply with the license for elements of the material in the public
domain or where your use is permitted by an applicable exception or limitation.
No warranties are given. The license may not give you all of the permissions necessary
for your intended use. For example, other rights such as publicity, privacy, or moral
rights may limit how you use the material.

For more details:
http://creativecommons.org/licenses/by-sa/4.0/
