depth = room_height - y;

x += 4*(keyboard_check(vk_right) - keyboard_check(vk_left));
y += 4*(keyboard_check(vk_down) - keyboard_check(vk_up));

var _camera = view_get_camera(0);
camera_set_view_pos(_camera, x - camera_get_view_width(_camera) div 2, y - (sprite_height div 2) - (camera_get_view_height(_camera) div 2));