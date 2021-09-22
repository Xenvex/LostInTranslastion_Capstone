/// @description Insert description here
// You can write your code in this editor
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);

var horizontal_move = key_right - key_left;
var vertical_move = key_up - key_down;

horizontal_speed = horizontal_move * walk_speed;
vertical_speed = vertical_move * walk_speed;
x = x + horizontal_speed;