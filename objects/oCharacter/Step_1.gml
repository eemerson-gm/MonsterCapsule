/// @description Character - Controls.

//Gets the entity controls from the keyboard.
entity_control[control.keyL]	= keyboard_check(vk_left);
entity_control[control.keyR]	= keyboard_check(vk_right);
entity_control[control.keyJ]	= keyboard_check_pressed(ord("Z"));