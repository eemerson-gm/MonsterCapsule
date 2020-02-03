/// @description Entity - Defenitions.

//Defines the entity macros.
#macro ENTITY_GRAVITY				0.3
#macro ENTITY_ACCELERATION			0.4
#macro ENTITY_TILEMAP_SIZE			16
#macro ENTITY_TILEMAP_COLLISION		"Tiles_Collision"

//Defines the entity physics array.
enum entity{ hspd, vspd, sped, jump, grnd }
entity_array[entity.hspd]		= 0;
entity_array[entity.vspd]		= 0;
entity_array[entity.grnd]		= 0;

//Defines the entity control array.
enum control{ keyL, keyR, keyJ }
entity_control[control.keyL]	= false;
entity_control[control.keyR]	= false;
entity_control[control.keyJ]	= false;