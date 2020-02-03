
///@param entity array
///@param entity type
///@param entity name
///@param enum hspd
///@param enum grnd

//Gets the entity array and enumerators.
var _entity_array	= argument0;
var _enum_hspd		= argument3;
var _enum_grnd		= argument4;

//Gets the character name to retrive sprites.
var char_type		= argument1;
var char_name		= argument2;
var spr_wait		= asset_get_index("spr_" + char_type + "_idle_" + char_name);
var spr_walk		= asset_get_index("spr_" + char_type + "_walk_" + char_name);
var spr_jump		= asset_get_index("spr_" + char_type + "_jump_" + char_name);

//Changes character to moving direction.
if (_entity_array[_enum_hspd] != 0){ image_xscale = sign(_entity_array[_enum_hspd]); }

//Checks if the character is on the ground.
if (_entity_array[_enum_grnd] == true){
	
	//Checks if the character is currently moving.
	if (_entity_array[_enum_hspd]  != 0){
		
		//Changes character image speed to walking speed.
		image_speed = abs(_entity_array[_enum_hspd]) / 1.5;
		
		//Checks if sprite is not already walking.
		sprite_index = spr_walk;
		
	}else{

		//Checks if sprite is not already waiting.
		sprite_index = spr_wait;

	}
	
}else{
	
	//Changes character to jumping sprite.
	sprite_index = spr_jump;
	
}