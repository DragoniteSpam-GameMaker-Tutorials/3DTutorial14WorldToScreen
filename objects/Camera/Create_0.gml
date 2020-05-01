/// @description Set up 3D things

// Bad things happen if you turn off the depth buffer in 3D
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

#region vertex format setup
// Vertex format: data must go into vertex buffers in the order defined by this
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format = vertex_format_end();
#endregion

#region create the grid
vbuffer = vertex_create_buffer();
vertex_begin(vbuffer, vertex_format);

// Create a checkerboard pattern on the floor
var s = 128;
for (var i = 0; i < room_width; i += s) {
    for (var j = 0; j < room_height; j += s) {
        if ((i % (s * 2) == 0 && j % (s * 2) == 0) || (i % (s * 2) > 0 && j % (s * 2) > 0)) {
            var color = c_aqua;
        } else {
            var color = c_white;
        }
        
        #region add data to the vertex buffer
        vertex_add_point(vbuffer, i, j, 0,                0, 0, 1,        0, 0,       color, 1);
        vertex_add_point(vbuffer, i + s, j, 0,            0, 0, 1,        1, 0,       color, 1);
        vertex_add_point(vbuffer, i + s, j + s, 0,        0, 0, 1,        1, 1,       color, 1);

        vertex_add_point(vbuffer, i + s, j + s, 0,        0, 0, 1,        1, 1,       color, 1);
        vertex_add_point(vbuffer, i, j + s, 0,            0, 0, 1,        0, 1,       color, 1);
        vertex_add_point(vbuffer, i, j, 0,                0, 0, 1,        0, 0,       color, 1);
        #endregion
    }
}

vertex_end(vbuffer);
#endregion

skybox = load_model("skybox.gmmod");

var t = get_timer();
//merry = load_obj("merry.obj", "merry.mtl");
var merry_data = buffer_load("merry.vbuff");
merry = vertex_create_buffer_from_buffer(merry_data, vertex_format);
buffer_delete(merry_data);
show_debug_message("Loading the Merry took " + string((get_timer() - t) / 1000) + " milliseconds");

instance_create_depth(0, 0, 0, Player);