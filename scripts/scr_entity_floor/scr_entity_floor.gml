
///@param entity tilesize
///@param entity tilemap
///@param entity x
///@param entity y

//Gets the tilemap at the position.
var _entity_tile = tilemap_get_at_pixel(argument1, argument2, argument3);

//Checks if the tile exists.
if (_entity_tile > 0){
	
	//Checks if the tile is a solid.
	if (_entity_tile == 1){ return (argument3 mod argument0); }
	
	//Checks the floor of the slope value.
	var _entity_floor = tiles_heights[(argument2 mod argument0) + (_entity_tile * argument0)];
	return ((argument3 mod argument0) - _entity_floor);
	
}else{
	
	//Returns the distance from the ground.
	return -(argument0 - (argument3 mod argument0));
	
}