
///@param monster alarm
///@param monster time

//Gets the monster wander alarm and time.
var monster_alarm		= argument0;
var monster_time		= argument1;

//Checks if the alarm has been called.
if alarm_wait(monster_alarm, monster_time){
	
	//Selects random mouvement for left and right.
	entity_control[control.keyR]	= irandom_range(0, 1);
	entity_control[control.keyL]	= irandom_range(0, 1);
	
}