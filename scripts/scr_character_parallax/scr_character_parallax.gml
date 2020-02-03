
///@param parralax layers...

//Loops through all the parralax layers.
for(var l = 0; l < argument_count; l++){
	
	//Gets the layer to parralax.
	var parralax_layer = layer_get_id(argument[l]);
	
	//Checks if the layer exists.
	if (layer_exists(parralax_layer) == true){
	
		//Sets the position of the background.
		layer_x(parralax_layer, camera_get_view_x(view_camera[0]) / ((argument_count - l) * 5) + (16 * l));
	
	}
	
}