/// @description Character - Sprites.

//Script manages the character sprites.
scr_entity_sprites(entity_array, "character", "blue", entity.hspd, entity.grnd);

//Script manages the character camera.
scr_character_camera(view_camera[0], self, 0.3, true);

//Manages the camera parallax.
layer_x(layer_get_id("Parallax"), camera_get_view_x(view_camera[0])/2);