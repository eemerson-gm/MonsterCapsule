
///@param tiles size
///@param tiles sprite
///@param tiles tileset

//Defines the tiles variables.
tiles_width			= sprite_get_width(argument1);
tiles_count			= tiles_width / argument0;

//Creates a temp tilemap.
var tiles_temp		= layer_create(0, "Tiles");

//Creates the tilemap layer.
tiles_tilemap		= layer_tilemap_create(tiles_temp, 0, 0, argument2, tiles_count, 1);

//Sets the tilemap tiles to the same as the tileset.
for(var t = 0; t <= tiles_count; t++){ tilemap_set(tiles_tilemap, t, t, 0); }