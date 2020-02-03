///@param entity array
///@param entity tilesize
///@param entity tilemap
///@param enum hspd
///@param enum vspd
///@param enum grnd

//Gets the entity array and enumerators.
var _entity_array		= argument0;
var _entity_tilemap		= layer_tilemap_get_id(layer_get_id(argument2));
var _entity_tilesize	= argument1;
var _enum_hspd			= argument3;
var _enum_vspd			= argument4;
var _enum_grnd			= argument5;
var _entity_bboxside;

//Changes the horizontal bounding box side to check.
if (_entity_array[@ _enum_hspd] > 0){ _entity_bboxside = bbox_right; }else{ _entity_bboxside = bbox_left; }

//Checks the horizontal positions of the entity bounding box.
var entity_pos1		= tilemap_get_at_pixel(_entity_tilemap, _entity_bboxside + _entity_array[_enum_hspd], bbox_top);
var entity_pos2		= tilemap_get_at_pixel(_entity_tilemap, _entity_bboxside + _entity_array[_enum_hspd], bbox_bottom);

//Checks if the entity is on a slope.
if (tilemap_get_cell_y_at_pixel(_entity_tilemap, x, bbox_bottom) > 1){ entity_pos2 = false; }

//Checks for horizontal tile collisions.
if (entity_pos1 == 1) || (entity_pos2 == 1){
	
	//Checks if the entity is moving.
	if (_entity_array[@ _enum_hspd] > 0){
		
		//Changes the entity x value left.
		x = (x - (x mod _entity_tilesize)) + (_entity_tilesize - 1) - (bbox_right - x);
		
	}else{
		
		//Changes the entity x value right.
		x = (x - (x mod _entity_tilesize)) - (bbox_left - x);
		
	}
	
	//Stops the entity from moving.
	_entity_array[@ _enum_hspd] = 0;
	
}

//Applies the horizontal speed to the entity position.
x += _entity_array[_enum_hspd];

//Checks if the tile is not a slope.
if (tilemap_get_at_pixel(_entity_tilemap, x, bbox_bottom + _entity_array[_enum_vspd]) <= 1){
	
	//Changes the horizontal bounding box side to check.
	if (_entity_array[@ _enum_vspd] > 0){ _entity_bboxside = bbox_bottom; }else{ _entity_bboxside = bbox_top; }
	
	//Checks the vertical positions of the entity bounding box.
	var entity_pos1		= tilemap_get_at_pixel(_entity_tilemap, bbox_left, _entity_bboxside + _entity_array[_enum_vspd]);
	var entity_pos2		= tilemap_get_at_pixel(_entity_tilemap, bbox_right, _entity_bboxside + _entity_array[_enum_vspd]);

	//Checks for vertical tile collisions.
	if (entity_pos1 == 1) || (entity_pos2 == 1){
	
		//Checks if the entity is moving.
		if (_entity_array[@ _enum_vspd] > 0){
		
			//Changes the entity y value up.
			y = (y - (y mod _entity_tilesize)) + (_entity_tilesize - 1) - (bbox_bottom - y);
		
		}else{
		
			//Changes the entity y value down.
			y = (y - (y mod _entity_tilesize)) - (bbox_top - y);
		
		}
	
		//Stops the entity from moving.
		_entity_array[@ _enum_vspd] = 0;
		
		//Rounds the position to prevents bugs.
		y = round(y);
	
	}
	
}

//Checks if the tile is a slope.
var entity_floor = scr_entity_floor(_entity_tilesize, _entity_tilemap, x, bbox_bottom + _entity_array[_enum_vspd]);
if (entity_floor >= 0){
	
	//Applies the vertical speed to the position.
	y += _entity_array[_enum_vspd];
	y -= (entity_floor + 1);
	
	//Stops the entity from moving.
	_entity_array[@ _enum_vspd] = 0;
	entity_floor = -1;
	
}

//Checks if walking down a slope.
if (_entity_array[_enum_grnd]){
	
	//Moves the entity down the slope.
	y += abs(entity_floor) - 1;
	
	//Checks if at the bottom of the tile.
	if((bbox_bottom mod _entity_tilesize) == _entity_tilesize - 1){
		
		//Checks if the slope continues.
		if (tilemap_get_at_pixel(_entity_tilemap, x, bbox_bottom + 1) > 1){
			
			//Moves to the tile.
			y += abs(scr_entity_floor(_entity_tilesize, _entity_tilemap, x, bbox_bottom + 1));
			
		}
		
	}
	
}

//Applies the horizontal speed to the entity position.
y += _entity_array[_enum_vspd];