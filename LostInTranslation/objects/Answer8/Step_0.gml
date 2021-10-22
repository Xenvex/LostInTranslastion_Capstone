/// @description Insert description here
// You can write your code in this editor
if(mouse_check_button(mb_left)){
	grab=true;
if(keyboard_check(vk_anykey) and string_length(text) < 20) {
text = text+string(keyboard_string);
keyboard_string = "";
}

if(keyboard_check(vk_backspace) and !keyboard_check_pressed(vk_backspace) and delete_timer = 2) {
text = string_delete(text, string_length(text),1);
delete_timer = 0;
keyboard_string = "";
}

if(keyboard_check_pressed(vk_backspace)) {
text = string_delete(text, string_length(text),1);
keyboard_string = "";
delete_timer = -4;
}

if(delete_timer!=2){
delete_timer ++;
}

if(text==correct_answer){
instance_create_layer(x,y, "Instances", Correct);
global.score++;
}
}