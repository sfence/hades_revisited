# Hades Revisited Compass

This mod adds a compass to the top of the screen.
It shows the 4 cardinal directions North (N), South (S), West (W) and East (E).

It must be first enabled by a mod.

## API

There are two functions:

* `hades_compass.enable(player)`: Enable compass for player
* `hades_compass.disable(player)`: Disable compass for player

## Translating

If you want to translate this mod (N, E, S, W), you need to draw an image
of the style of `hades_compass_nesw.png`.
The 4 letters in this image represent the 4 cardinal directions:
The letters uses the font Ubuntu Semi-Bold, size 34 pt.
The text color is #4BD84E.
Each letter must be centered at X=0, 128, 256 and 356.
Note: The letter for South is cut in half at the image boundaries.

For testing, you can just override `hades_compass_nesw.png` but to make
it work properly, the code must be updated.


## Author
Wuzzy

## License
This mod and all files in it are licensed under the MIT License (see LICENSE.txt).
