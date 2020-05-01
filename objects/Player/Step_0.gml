/// @description Insert description here

look_dir -= (window_mouse_get_x() - window_get_width() / 2) / 10;
look_pitch += (window_mouse_get_y() - window_get_height() / 2) / 10;
look_pitch = clamp(look_pitch, -80, 80);

window_mouse_set(window_get_width() / 2, window_get_height() / 2);

if (keyboard_check_direct(vk_escape)) {
    game_end();
}

var move_speed = 4;

if (keyboard_check(ord("A"))) {
    x -= dsin(look_dir) * move_speed;
    y -= dcos(look_dir) * move_speed;
}

if (keyboard_check(ord("D"))) {
    x += dsin(look_dir) * move_speed;
    y += dcos(look_dir) * move_speed;
}

if (keyboard_check(ord("W"))) {
    x += dcos(look_dir) * move_speed;
    y -= dsin(look_dir) * move_speed;
}

if (keyboard_check(ord("S"))) {
    x -= dcos(look_dir) * move_speed;
    y += dsin(look_dir) * move_speed;
}