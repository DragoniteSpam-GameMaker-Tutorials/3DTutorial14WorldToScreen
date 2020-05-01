/// @description Draw the 3D world

// 3D projections require a view and projection matrix
var camera = camera_get_active();

var xfrom = Player.x;
var yfrom = Player.y;
var zfrom = Player.z;
var xto = xfrom + dcos(Player.look_dir);
var yto = yfrom - dsin(Player.look_dir);
var zto = zfrom - dsin(Player.look_pitch);

camera_set_view_mat(camera, matrix_build_lookat(xfrom, yfrom, zfrom, xto, yto, zto, 0, 0, 1));
camera_set_proj_mat(camera, matrix_build_projection_perspective_fov(-60, -window_get_width() / window_get_height(), 1, 32000));
camera_apply(camera);

// Everything must be drawn after the 3D projection has been set
gpu_set_zwriteenable(false);
matrix_set(matrix_world, matrix_build(xfrom, yfrom, zfrom, 0, 0, 0, 1, 1, 1));
vertex_submit(skybox, pr_trianglelist, sprite_get_texture(spr_skybox, 0));
matrix_set(matrix_world, matrix_build_identity());
gpu_set_zwriteenable(true);

vertex_submit(vbuffer, pr_trianglelist, sprite_get_texture(spr_grass, 0));

matrix_set(matrix_world, matrix_build(500, 500, 50, 0, 0, 0, 2, 2, 2));
vertex_submit(merry, pr_trianglelist, -1);
matrix_set(matrix_world, matrix_build_identity());