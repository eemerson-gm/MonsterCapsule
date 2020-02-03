
///@param bool
///@param col-true
///@param col-false

//Gets the color variables.
var flag = argument[0];
var colT = argument[1];
var colF = argument[2];

//Sets to different colors if one is true.
if (flag){
	draw_set_color(colT);
}else{
	draw_set_color(colF);
}