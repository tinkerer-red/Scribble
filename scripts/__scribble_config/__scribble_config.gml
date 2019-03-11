//  Scribble (light) v2.5.5
//  2019/03/11
//  @jujuadams
//  With thanks to glitchroy and Rob van Saaze
//  
//  Intended for use with GMS2.2.1 and later

#macro SCRIBBLE_DEFAULT_SPRITEFONT_MAPSTRING  "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789,.-;:_+-*/\\'\"!?~^°<>|(){[]}%&=#@$ÄÖÜäöüß"
#macro SCRIBBLE_DEFAULT_WAVE_SIZE             4
#macro SCRIBBLE_DEFAULT_SHAKE_SIZE            4
#macro SCRIBBLE_DEFAULT_RAINBOW_WEIGHT        0.4
#macro SCRIBBLE_DEFAULT_TYPEWRITER_SPEED      0.3
#macro SCRIBBLE_DEFAULT_TYPEWRITER_METHOD     SCRIBBLE_TYPEWRITER_PER_CHARACTER
#macro SCRIBBLE_DEFAULT_TYPEWRITER_SMOOTHNESS 3

#macro SCRIBBLE_ANIMATION_SPEED                    0.02    //Speed of shader animation effects
#macro SCRIBBLE_EMULATE_LEGACY_SPRITEFONT_SPACING false    //GMS2.2.1 made spritefonts much more spaced out for some reason. Turn this if you want to replicate pre-GMS2.2.1 spritefont behaviour
#macro SCRIBBLE_HASH_NEWLINE                       true    //Replaces hashes (#) with newlines (ASCII chr10) to emulate GMS1 behaviour
#macro SCRIBBLE_FIX_NEWLINES                       true    //The newline fix stops unexpected newline types from breaking the parser, but it can be a bit slow
#macro SCRIBBLE_COMPATIBILITY_DRAW                false    //Forces Scribble functions to use GM's native draw_text() renderer. Turn this on if certain platforms are causing problems
#macro SCRIBBLE_COMMAND_TAG_OPEN                  ord("[") //Character used to open a command tag. First 127 ASCII chars only
#macro SCRIBBLE_COMMAND_TAG_CLOSE                 ord("]") //Character used to close a command tag. First 127 ASCII chars only
#macro SCRIBBLE_COMMAND_TAG_ARGUMENT              ord(",") //Character used to delimit a command parameter inside a command tag. First 127 ASCII chars only

//Typewriter constants
//Used as arguments for scribble_typewriter_in() and scribble_typewrite_out()
#macro SCRIBBLE_TYPEWRITER_WHOLE         0
#macro SCRIBBLE_TYPEWRITER_PER_CHARACTER 1
#macro SCRIBBLE_TYPEWRITER_PER_LINE      2

//Glyph property constants
//Used as arguments for scribble_font_character_property()
//These link into internal glyph properties
#macro SCRIBBLE_GLYPH_X_OFFSET   __E_SCRIBBLE_GLYPH.DX
#macro SCRIBBLE_GLYPH_Y_OFFSET   __E_SCRIBBLE_GLYPH.DY
#macro SCRIBBLE_GLYPH_SEPARATION __E_SCRIBBLE_GLYPH.SHF

enum E_SCRIBBLE_BOX
{
    X0, Y0, //Top left corner
    X1, Y1, //Top right corner
    X2, Y2, //Bottom left corner
    X3, Y3  //Bottom right corner
}

#region -- Internal Definitions --

#macro __SCRIBBLE_VERSION "2.5.5 (light)"
#macro __SCRIBBLE_DATE    "2019/03/11"

enum __E_SCRIBBLE_FONT
{
    NAME,           // 0
    TYPE,           // 1
    TEXTURE_WIDTH,  // 2
    TEXTURE_HEIGHT, // 3
    SPACE_WIDTH,    // 4
    MAPSTRING,      // 5
    SEPARATION,     // 6
    SPRITE,         // 7
    SPRITE_X,       // 8
    SPRITE_Y,       // 9
    __SIZE          //10
}

enum __E_SCRIBBLE_GLYPH
{
    CHAR,  // 0
    ORD,   // 1
    X,     // 2
    Y,     // 3
    W,     // 4
    H,     // 5
    DX,    // 6
    DY,    // 7
    SHF,   // 8
    U0,    // 9
    V0,    //10
    U1,    //11
    V1,    //12
    __SIZE //13
}

enum __E_SCRIBBLE_SURFACE
{
    WIDTH,  //0
    HEIGHT, //1
    FONTS,  //2
    LOCKED, //3
    __SIZE  //4
}

enum __E_SCRIBBLE_LINE
{
    X,          //0
    Y,          //1
    WIDTH,      //2
    HEIGHT,     //3
    LENGTH,     //4
    FIRST_CHAR, //5
    LAST_CHAR,  //6
    HALIGN,     //7
    WORDS,      //8
    __SIZE      //9
}

enum __E_SCRIBBLE_WORD
{
    X,              // 0
    Y,              // 1
    WIDTH,          // 2
    HEIGHT,         // 3
    VALIGN,         // 4
    STRING,         // 5
    INPUT_STRING,   // 6
    SPRITE,         // 7
    IMAGE,          // 8
    LENGTH,         // 9
    FONT,           //10
    COLOUR,         //11
    RAINBOW,        //12
    SHAKE,          //13
    WAVE,           //14
    NEXT_SEPARATOR, //15
    __SIZE          //16
}

enum __E_SCRIBBLE_VERTEX_BUFFER
{
    VERTEX_BUFFER,
    SPRITE,
    TEXTURE,
    __SIZE
}

enum __E_SCRIBBLE
{
    __SECTION0,           // 0
    STRING,               // 1
    DEFAULT_FONT,         // 2
    DEFAULT_COLOUR,       // 3
    DEFAULT_HALIGN,       // 4
    WIDTH_LIMIT,          // 5
    LINE_HEIGHT,          // 6
    
    __SECTION1,           // 7
    HALIGN,               // 8
    VALIGN,               // 9
    WIDTH,                //10
    HEIGHT,               //11
    LEFT,                 //12
    TOP,                  //13
    RIGHT,                //14
    BOTTOM,               //15
    LENGTH,               //16
    LINES,                //17
    WORDS,                //18
    
    __SECTION2,           //19
    TW_DIRECTION,         //20
    TW_SPEED,             //21
    TW_POSITION,          //22
    TW_METHOD,            //23
    TW_SMOOTHNESS,        //24
    CHAR_FADE_T,          //25
    LINE_FADE_T,          //26
    
    __SECTION3,           //27
    WAVE_SIZE,            //28
    SHAKE_SIZE,           //29
    RAINBOW_WEIGHT,       //30
    ANIMATION_TIME,       //31
    
    __SECTION4,           //32
    LINE_LIST,            //33
    VERTEX_BUFFER_LIST,   //34
    
    __SECTION5,           //35
    EV_CHARACTER_LIST,    //36
    EV_NAME_LIST,         //37
    EV_DATA_LIST,         //38
    EV_TRIGGERED_LIST,    //39
    EV_TRIGGERED_MAP,     //40
    EV_VALUE_MAP,         //41
    EV_CHANGED_MAP,       //42
    EV_PREVIOUS_MAP,      //43
    EV_DIFFERENT_MAP,     //44
    
    __SIZE                //45
}

#endregion