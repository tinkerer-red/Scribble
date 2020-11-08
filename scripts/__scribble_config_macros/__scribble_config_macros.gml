/// Scribble's macros, used to customise and control behaviour throughout the library
///
/// N.B. You never need to run this script yourself! All of these macros are handled automatically when Scribble is compiled into your project

#macro SCRIBBLE_HASH_NEWLINE                  true   //Replaces hashes (#) with newlines (ASCII chr10) to emulate GMS1's newline behaviour
#macro SCRIBBLE_FIX_ESCAPED_NEWLINES          false  //Replaces incorrectly escaped newline literals with an actual newline
#macro SCRIBBLE_COLORIZE_SPRITES              true   //Whether to use colourization for sprites. This includes [rainbow] and [cycle]
#macro SCRIBBLE_ADD_SPRITE_ORIGINS            false  //Whether to use sprite origins. Setting this to <false> will vertically centre sprites on the line of text
#macro SCRIBBLE_SPRITEFONT_ALIGN_GLYPHS_LEFT  false  //Set to <true> to emulate GameMaker's native behaviour
#macro SCRIBBLE_MISSING_CHARACTER             "?"    //Used when a character is missing from a font
#macro SCRIBBLE_BGR_COLOR_HEX_CODES           false  //Set to <true> to use GameMaker's #BBGGRR format for in-line hex code colors. <false> uses the industry standard #RRGGBB format
#macro SCRIBBLE_DEFAULT_SPRITE_SPEED          0.1    //The default animation speed for sprites inserted into text
#macro SCRIBBLE_DEFAULT_DELAY_DURATION        450    //Default duration of the [delay] command, in milliseconds
#macro SCRIBBLE_INCLUDED_FILES_SUBDIRECTORY   ""     //The directory to look in for font .yy files, relative to the root folder that Included Files are stored in
#macro SCRIBBLE_BOX_ALIGN_TO_PAGE             false  //Whether to use text element sizes (false) or page sizes (true)
#macro SCRIBBLE_SKIP_SPEED_THRESHOLD          999    //A typewriter speed greater than or equal to this value is considered "skipping" and won't wait for delays or pauses in text
#macro SCRIBBLE_AUTO_TYPEWRITER_RESET         true



#region Advanced Features

#macro SCRIBBLE_STEP_SIZE                 (delta_time / 16666) //The animation step size. The default command here uses delta_time ensures that animations are smooth at all framerates
#macro SCRIBBLE_SLANT_AMOUNT              0.24      //The x-axis displacement when using the [slant] tag
#macro SCRIBBLE_CREATE_GLYPH_LTRB_ARRAY   false     //Outputs an array of glyph LTRB bounding boxes
#macro SCRIBBLE_CREATE_CHARACTER_ARRAY    false     //Outputs an array of character codes
#macro SCRIBBLE_DEFAULT_OCCURRENCE_NAME   "default" //Default value to use for autotyper occurrences
#macro SCRIBBLE_CACHE_MODEL_TIMEOUT       15000     //How long to wait (in milliseconds) before the cache automatically cleans up unused model data
#macro SCRIBBLE_CACHE_ELEMENT_TIMEOUT     15000     //How long to wait (in milliseconds) before the cache automatically cleans up unused element data
#macro SCRIBBLE_VERBOSE                   false     //Enables verbose console output to aid with debugging
#macro SCRIBBLE_BEZIER_ACCURACY           20        //Controls how accurate;y text fits Bezier curves. Higher is better
#macro SCRIBBLE_NEWLINES_TRIM_LEFT_SPACE  true      //Whether to trim off empty left-hand space when moving a word to a new line
#macro SCRIBBLE_FIT_TO_BOX_ITERATIONS     3         //Number of iterations to fit text when using the .fit_to_box() method. Higher values are slower but more accurate

#macro SCRIBBLE_COMMAND_TAG_OPEN      ord("[") //Character used to open a command tag. First 127 ASCII chars only
#macro SCRIBBLE_COMMAND_TAG_CLOSE     ord("]") //Character used to close a command tag. First 127 ASCII chars only
#macro SCRIBBLE_COMMAND_TAG_ARGUMENT  ord(",") //Character used to delimit a command parameter inside a command tag. First 127 ASCII chars only

#endregion



#region Warnings

//Various warning messages. Please do not turn these off unless you have to!
#macro SCRIBBLE_WARNING_TEXTURE_PAGE           true
#macro SCRIBBLE_WARNING_AUTOSCAN_YY_NOT_FOUND  true

#endregion