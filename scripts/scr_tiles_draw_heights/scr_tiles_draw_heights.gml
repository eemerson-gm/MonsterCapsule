
///@param tiles size
///@param tiles room

//Draws the tilemap layer.
draw_tilemap(tiles_tilemap, 0, 0);

//Defines the global height array.
globalvar tiles_heights;

//Loops through each tile height.
for(var t = tiles_width - 1; t >= 0; t--){
	
	//Checks the height of the tiles.
	var tiles_check = 0;
	while(tiles_check <= argument0){
		
		//Gets the heights of the tiles.
		tiles_heights[t] = tiles_check;
		if (tiles_check == argument0){ break; }
		if (surface_getpixel(application_surface, t, tiles_check) != c_black){ break; }
		tiles_check++;
		
	}
	
}

//Loads the next room.
room_goto(argument1);