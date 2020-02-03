/// @description Character - Camera.

//Inherit the parent event.
event_inherited();

//Defines the character speed.
entity_array[entity.sped] = 2;
entity_array[entity.jump] = 4;

//Resizes the appliation surface.
window_set_size(1280, 720);
surface_resize(application_surface, 1280, 720);