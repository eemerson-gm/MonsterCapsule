
///@param entity array
///@param entity accel
///@param entity gravity
///@param entity hspeed
///@param entity vspeed
///@param enum hspd
///@param enum vspd
///@param enum grnd

//Gets the entity array and enumerators.
var _entity_array		= argument0;
var _entity_tilesize	= argument1;
var _entity_tilemap		= layer_tilemap_get_id(layer_get_id(argument2));
var _entity_accel		= argument3;
var _entity_gravity		= argument4;
var _entity_hspeed		= argument5;
var _entity_vspeed		= argument6;
var _enum_hspd			= argument7;
var _enum_vspd			= argument8;
var _enum_grnd			= argument9;

//Checks if the entity is in the floor.
_entity_array[@ _enum_grnd] = (scr_entity_floor(_entity_tilesize, _entity_tilemap, x, bbox_bottom + 1) >= 0);

//Sets the values of horizontal and vertical speeds.
_entity_array[@ _enum_hspd]	= approach(_entity_array[@ _enum_hspd], _entity_hspeed, _entity_accel);

//Checks if the entity is jumping.
if(_entity_array[_enum_grnd]){
	
	//Checks if the entity is not moving.
	if (_entity_vspeed != 0){
	
		//Applies the jumping vertical speeds.
		_entity_array[@ _enum_vspd] = -_entity_vspeed;
	
		//Sets the gorunded value.
		_entity_array[@ _enum_grnd] = false;
		
	}
	
}else{
	
	//Applies the gravity value.
	_entity_array[@ _enum_vspd]	+= _entity_gravity;
	
}