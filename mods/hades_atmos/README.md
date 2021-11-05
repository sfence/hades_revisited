## Hades Atmos

This mod adds atmospheric data to the world. Each pos has
'atmospheric values' associated with it.

This mod is still WIP! This is still an early concept only!

## The Concept

There is a static base value that remains fixed for the
entire game and there are various dynamic modifiers put
on top of it.
The most basic modifier is time-based, i.e. a random offset
is applied depending on the world time.
The other basic modifier is position-based, e.g. heat goes
up or down depending on the raw height.
Other mods can apply custom offsets.

Atmos data can be used by various other gameplay mechanics, such as
plant growth, heat stroke, etc.

Currently, these atmos types are available:
* sulphur: How much sulphur is in the air (0.0 to 1.0)
* humidity: Relative humidity (0.0 to 1.0)
* heat: Arbitrary heat value (no upper limit)
* radiation: How radioactive the area is(0.0 to 1.0)

Sulphur is used to limit and control plant growth.
Initially, it is on a high value in the whole world with
little variation.
You need to scrub the air off sulphur to unlock more plants.
A sulphur scrubber will directly reduce the sulphur in the air.
High sulphur also changes the sky color.

Humidity and heat are broadly distributed and high and low values
occur relatively evenly distributed. Heat does increase with depth,
however.
Those are mostly additional requirements for more demanding plants.
For common plants, hitting the right values might boost growth
speed and give other minor bonuses. Very high and very low heat
can also cause heat/cold damage unless the player wears protective
clothing.

Radiation is something unique with varying effects. Under
radiation, most plants wither and die, while other plants might
actually get a strong boost.
The player might take damage without protection.
Radiation also increases spawns of specialized mobs (like mutants).
Radiation might also have beneficial effects; e.g. some unique plants
may grow ONLY in high radiation, or some item can be "charged"
in highly-radiated areas and you can then use the item to do ... stuff.
There might be other effects of radiation ...
