///@param alarm
///@param time

//Sets the time to wait in frames.
var aid = argument[0];
var time = argument[1];

//Counts down the timer and returns if 0.
if (alarm_get(aid)<=0){
	alarm[aid] = time;
	return true;
}else{
	alarm[aid] -= 1;
}