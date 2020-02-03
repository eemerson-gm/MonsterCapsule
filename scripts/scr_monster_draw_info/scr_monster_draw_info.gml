
///@param info x
///@param info y
///@param monster grid
///@param monster index

//Gets the position of the info box.
var xx	= argument0;
var yy	= argument1;

//Gets the monster grid and index.
var monster_grid	= argument2;
var monster_index	= argument3;

//Gets the monster id.
var monster_id		= scr_monster_get_id(monster_grid[# monster_party.object, monster_index]);

//Draws the information background.
draw_set_color(COLOR_HUD);
draw_rectangle(xx, yy, xx + 84, yy + 44, false);
draw_set_halign(fa_center);

//Draws the monster statistic labels.
draw_set_color(COLOR_TEXT);
draw_text(xx + 17, yy + 4, "Health");
draw_text(xx + 17, yy + 14, "Level");
draw_text(xx + 17, yy + 24, "Attack");
draw_text(xx + 17, yy + 34, "Speed");

//Draws a vertical line divider.
draw_line_width(xx + 35, yy + 3, xx + 35, yy + 41, 1);

//Draws the current monster statistics values.
draw_color_condition((monster_grid[# monster_party.max_health, monster_index] == global_monster_grid[# monster_info.max_health, monster_id]), COLOR_HEALTH, COLOR_DAMAGE);
draw_text(xx + 45, yy + 4, string(monster_grid[# monster_party.max_health, monster_index]));
draw_color_condition((monster_grid[# monster_party.level, monster_index] == global_monster_grid[# monster_info.level, monster_id]), COLOR_HEALTH, COLOR_DAMAGE);
draw_text(xx + 45, yy + 14, string(monster_grid[# monster_party.level, monster_index]));
draw_color_condition((monster_grid[# monster_party.attack, monster_index] == global_monster_grid[# monster_info.attack, monster_id]), COLOR_HEALTH, COLOR_DAMAGE);
draw_text(xx + 45, yy + 24, string(monster_grid[# monster_party.attack, monster_index]));
draw_color_condition((monster_grid[# monster_party.speed, monster_index] == global_monster_grid[# monster_info.speed, monster_id]), COLOR_HEALTH, COLOR_DAMAGE);
draw_text(xx + 45, yy + 34, string(monster_grid[# monster_party.speed, monster_index]));

//Draws the statistics divider.
draw_set_color(COLOR_TEXT);
draw_text(xx + 60, yy + 4, "/");
draw_text(xx + 60, yy + 14, "/");
draw_text(xx + 60, yy + 24, "/");
draw_text(xx + 60, yy + 34, "/");

//Draws the maximum monster statistics values.
draw_set_color(COLOR_HEALTH);
draw_text(xx + 75, yy + 4, string(global_monster_grid[# monster_info.max_health, monster_id]));
draw_text(xx + 75, yy + 14, string(global_monster_grid[# monster_info.level, monster_id]));
draw_text(xx + 75, yy + 24, string(global_monster_grid[# monster_info.attack, monster_id]));
draw_text(xx + 75, yy + 34, string(global_monster_grid[# monster_info.speed, monster_id]));