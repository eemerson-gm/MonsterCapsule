/// @description Entity - Mouvement.

//Gets the current entity speeds.
var entity_hspeed	= (entity_control[control.keyR] - entity_control[control.keyL]) * entity_array[entity.sped];
var entity_vspeed	= (entity_control[control.keyJ] * entity_array[entity.grnd]) * entity_array[entity.jump];

//Script manages the entity mouvement.
scr_entity_mouvement(entity_array, ENTITY_TILEMAP_SIZE, ENTITY_TILEMAP_COLLISION, ENTITY_ACCELERATION, ENTITY_GRAVITY, entity_hspeed, entity_vspeed, entity.hspd, entity.vspd, entity.grnd);

//Script manages the entity collision.
scr_entity_collision(entity_array, ENTITY_TILEMAP_SIZE, ENTITY_TILEMAP_COLLISION, entity.hspd, entity.vspd, entity.grnd);

//Clamps the entity inside the room.
x = clamp(x, 8, room_width - 8);