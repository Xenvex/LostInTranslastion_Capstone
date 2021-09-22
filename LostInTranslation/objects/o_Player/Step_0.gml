/// @description Insert description here
// You can write your code in this editor
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);

var horizontal_move = key_right - key_left;
var vertical_move = key_down - key_up;

horizontal_speed = horizontal_move * walk_speed;
vertical_speed = vertical_move * walk_speed;

//WALL COLLISION CHECK

if(place_meeting(x+horizontal_speed,y,o_Wall)){
	while(!place_meeting(x+sign(horizontal_speed),y,o_Wall)){
		x = x + sign(horizontal_speed);
	}
	horizontal_speed = 0;
}

if(place_meeting(x,y+vertical_speed,o_Wall)){
	while(!place_meeting(x,y+sign(vertical_speed),o_Wall)){
		y = y + sign(vertical_speed);
	}
	vertical_speed = 0;
}

//INVISIBLE WALL 

if(place_meeting(x+horizontal_speed,y,o_Invisible_Wall)){
	while(!place_meeting(x+sign(horizontal_speed),y,o_Invisible_Wall)){
		x = x + sign(horizontal_speed);
	}
	horizontal_speed = 0;
}

if(place_meeting(x,y+vertical_speed,o_Invisible_Wall)){
	while(!place_meeting(x,y+sign(vertical_speed),o_Invisible_Wall)){
		y = y + sign(vertical_speed);
	}
	vertical_speed = 0;
}


//DOOR COLLISION CHECK

if(place_meeting(x,y+vertical_speed,o_Door)){
	var door_obj=instance_place(x,y+vertical_speed,o_Door);
	
	if(door_obj.correct_door == false){
		o_Player.x = 225;
		o_Player.y = 189;
		vertical_speed = 0;
		o_Door.image_blend = c_white;
	}else{
		door_obj.image_blend = c_green;
	}
}

if(place_meeting(x+horizontal_speed,y,o_Door)){
	var door_obj=instance_place(x+horizontal_speed,y,o_Door);
	
	if(door_obj.correct_door == false){
		o_Player.x = 225;
		o_Player.y = 189;
		horizontal_speed = 0;
		o_Door.image_blend = c_white;
	}else{
		door_obj.image_blend = c_green;
	}
}


x = x + horizontal_speed;
y = y + vertical_speed;