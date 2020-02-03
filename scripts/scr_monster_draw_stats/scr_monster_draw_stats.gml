
///@param stats x
///@param stats y
///@param monster prev-health
///@param monster grid
///@param monster index

//Gets the grid and index.
var xx					= argument0;
var yy					= argument1;
var monster_prev_health	= argument2;
var monster_grid		= argument3;
var monster_index		= argument4;

//Gets the monster information.
var monster_id					= scr_monster_get_id(monster_grid[# monster_party.object, monster_index]);
var monster_name				= global_monster_grid[# monster_info.name, monster_id];
var monster_max_health			= monster_grid[# monster_party.max_health, monster_index];
var monster_cur_health			= monster_grid[# monster_party.cur_health, monster_index];
var monster_max_experience		= monster_grid[# monster_party.max_experience, monster_index];
var monster_cur_experience		= monster_grid[# monster_party.cur_experience, monster_index];
var monster_level				= monster_grid[# monster_party.level, monster_index];

//Draws the statistics sprite.
draw_set_color(COLOR_HUD);
draw_rectangle(xx, yy, xx + 84, yy + 20, false);

//Draws the monster name.
draw_set_color(COLOR_TEXT);
draw_set_halign(fa_left);
draw_text(xx + 4, yy + 3, monster_name);

//Draws the monster level.
draw_set_color(COLOR_EXPERIENCE);
draw_set_halign(fa_right);
draw_text(xx + 80, yy + 3, "LVL. " + string(monster_level));

//Draws the monster statistics.
draw_health_line(xx + 3, yy + 12, xx + 80, yy + 12, 4, (monster_cur_health / monster_max_health), (monster_prev_health / monster_max_health), COLOR_HEALTH, COLOR_DAMAGE, COLOR_BACKGROUND);
draw_health_line(xx + 3, yy + 16, xx + 80, yy + 16, 1, (monster_cur_experience / monster_max_experience), 0, COLOR_EXPERIENCE, COLOR_DAMAGE, COLOR_BACKGROUND);