
///@param view camera[]
///@param object index
///@param camera speed
///@param inside room?

//Gets the width and height of the view.
var view_width = camera_get_view_width(argument0);
var view_height = camera_get_view_height(argument0);

//Gets the position of the view camera.
var view_x = camera_get_view_x(argument0);
var view_y = camera_get_view_y(argument0);

//Aproaches the position of the object centered.
view_x = lerp(view_x, argument1.x - (view_width/2), argument2);
view_y = lerp(view_y, argument1.y - (view_height/2), argument2);

//Checks if clamping inside room.
if (argument3 == true){
	
	//Clamps the view inside the room.
	view_x = clamp(view_x, 0, room_width - view_width);
	view_y = clamp(view_y, 0, room_height - view_height);
	
}

//Sets the new position of the camera view.
camera_set_view_pos(argument0, view_x, view_y);