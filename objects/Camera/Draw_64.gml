/// @description Draw stuff on the GUI

draw_text(32, 32, "This is the UI");

var screen_pos = world_to_screen(100, 0, 20, view_mat, proj_mat);
draw_sprite(spr_duck, 0, screen_pos[0], screen_pos[1]);