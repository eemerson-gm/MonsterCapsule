/// @description Monster - Defenitions.

//Inherit the parent event.
event_inherited();

//Defines the monster alarm enumerators.
enum monster_alarm{ move }

//Defines the monster variables.
enum monster{ name, attk, defn, sped, type }
monster_array[monster.name]		= 0;
monster_array[monster.attk]		= 0;
monster_array[monster.defn]		= 0;
monster_array[monster.sped]		= 0;
monster_array[monster.type]		= 0;

