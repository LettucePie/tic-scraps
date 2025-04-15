 
# Data Planning Sheet / Outline

I need to keep track of how I plan on utilizing the 7 other Data Banks, as well as the additional sprite/tile/map pages enabled by structuring the project on 2bpp instead of 4bpp.

## Important Notes/Discoveries on the 2bpp structure

Maps do not care what the bpp is, at least not in a memory sense. You can set the map to utilize 1, 2, or 4 bpp in the editor, and these options will provide additional sprite pages to toggle through. However these additional pages do not provide a new map template to work on, they simply apply those sprite pages onto the map, matched to the coordinates.

You can change the Pinned setting on the Bank Switcher, allowing you to change the bank the map is on to a fresh/unused bank, while retaining the sprites of a previous bank. In theory this allows us to expand the size of the overworld, though I currently do not know the process in code to load just the sprites of one bank, and the map of another.

As far as sprite data in ram is concerned, 4bpp, 2bpp, and 1bpp are just a sort of "rendering" method. the data is the same and in the same location. How it's interpreted in the editor is completely over my head, but as long as I retrieve enough of the spritesheet and set the blit mode to 2bpp it will render 2bpp sprites.

~~gathering 512\*8 by 512\*8 sprite data is a lot for tic80 to handle. Going to need to limit the amount of Collision/Interaction/Palette Data Index tiles, perhaps to one single bank.~~

**512 * 8 by 512 * 8** was not only absurd it was just wrong. The total sprite field is 512 by 512...

**OH DANG** I cannot do the color manipulations I had originally planned this whole thing around... Screen coordinates are literally coordinates to the Palette data. I cannot change just one set of map tile or sprite or even screen pixel colors without affecting the entire render. There is an overlay render, but it's limited to just the one layer.

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

 * Outdoor Overworld (Sync + Render)

#### Tiles Page 1

 * Outdoor Overworld Tiles (Don't Store)

#### Tiles Page 2

 * No Designation

#### Sprites Page 1

 * Main Character Overworld Animations (Store)
 * *Other Characters???*

#### Sprites Page 2

 * Probably more Character Overworld Sprites (Store)

#### Sounds

 * No Designation

#### Tracks

 * No Designation


### Bank 1

**BPP: 2**

#### Map

 * Indoor Overworld (Sync + Render)

#### Tiles Page 1

 * Indoor Overworld Tiles (Don't Store)

#### Tiles Page 2

 * No Designation

#### Sprites Page 1

 * Probably more Character Overworld Sprites (Store)

#### Sprites Page 2

 * Probably more Character Overworld Sprites (Store)

#### Sounds

 * No Designation

#### Tracks

 * No Designation


### Bank 2

**BPP: 2**

#### Map

 * Outdoor Collision/Interaction Data Tiles (Storage Only)

#### Tiles Page 1

 * Collision Code Tiles (Don't Store)
 * Key Interaction Code Tiles (Don't Store)

#### Tiles Page 2

 * Palette Code Tiles (Don't Store)

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

 * Indoor Collision/Interaction Data Tiles (Storage Only)

#### Tiles Page 1

 * *Battle Sprites?* (Sync)

#### Tiles Page 2

 * *Battle Sprites?*

#### Sprites Page 1

 * *Battle Sprites?*

#### Sprites Page 2

 * *Battle Sprites?*

#### Sounds

 * *Battle Sounds?*

#### Tracks

 * *Battle Music?*


### Bank 4

**BPP: 2**

#### Map

 * Outdoor Palette Data/Index Tiles (Storage Only)

#### Tiles Page 1

 * No Designation

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


### Bank 5

**BPP: 2**

#### Map

 * Indoor Palette Data/Index Tiles (Storage Only)

#### Tiles Page 1

 * No Designation

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


### Bank 6 and 7 currently unknown
