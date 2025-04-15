 
# Data Planning Sheet / Outline

I need to keep track of how I plan on utilizing the 7 other Data Banks, as well as the additional sprite/tile/map pages enabled by structuring the project on 2bpp instead of 4bpp.

## Important Notes/Discoveries on the 2bpp structure

Maps do not care what the bpp is, at least not in a memory sense. You can set the map to utilize 1, 2, or 4 bpp in the editor, and these options will provide additional sprite pages to toggle through. However these additional pages do not provide a new map template to work on, they simply apply those sprite pages onto the map, matched to the coordinates.

You can change the Pinned setting on the Bank Switcher, allowing you to change the bank the map is on to a fresh/unused bank, while retaining the sprites of a previous bank. In theory this allows us to expand the size of the overworld, though I currently do not know the process in code to load just the sprites of one bank, and the map of another.

## Brainstorm

 * By Default everything is in the grayscale. Colorization is unlocked as a gameplay feature.
 * The main overworld map is made in Bank 0 with Bank 0 Page 1 tiles.
 * Colorization and movement collision is going to made in seperate banks using seperate tiles on a designated "Data map".
    * We can try this two different ways maybe
    * Make tiles that function as index points to a table containing palettes, allowing us to break past the limit of a defined palette.
    * Make colorized versions of the original Outdoor and Indoor tiles.
    * Both?




## Bank Designations

### Bank 0

**BPP: 2**

#### Map

 * Outdoor Overworld

#### Tiles Page 1

 * Outdoor Overworld Tiles

#### Tiles Page 2

 * No Designation

#### Sprites Page 1

 * Main Character Overworld Animations
 * *Other Characters???*

#### Sprites Page 2

 * Probably more Character Overworld Sprites

#### Sounds

 * No Designation

#### Tracks

 * No Designation


### Bank 1

**BPP: 2**

#### Map

 * Indoor Overworld

#### Tiles Page 1

 * Indoor Overworld Tiles

#### Tiles Page 2

 * No Designation

#### Sprites Page 1

 * No Designation

#### Sprites Page 2

 * No Designation

#### Sounds

 * No Designation

#### Tracks

 * No Designation


### Bank 2

**BPP: 2**

#### Map

 * Outdoor Collision Data

#### Tiles Page 1

 * Collision Code Tiles
 * Key Interaction Code Tiles
 * Pallete Code Tiles?

#### Tiles Page 2

 * No Designation

#### Sprites Page 1

 * No Designation

#### Sprites Page 2

 * No Designation

#### Sounds

 * No Designation

#### Tracks

 * No Designation


### Bank 3

**BPP: 2**

#### Map

 * Indoor Collision Data

#### Tiles Page 1

 * No Designation **ASSUMING** the data tiles from Bank 2 TilePage 1 can be applied.

#### Tiles Page 2

 * No Designation

#### Sprites Page 1

 * No Designation

#### Sprites Page 2

 * No Designation

#### Sounds

 * No Designation

#### Tracks

 * No Designation


### Banks 4 - 7

Currently No Designation... but hey that is A LOT of data room. Perhaps storing save data or player actions / changes.
