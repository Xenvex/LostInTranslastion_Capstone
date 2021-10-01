//input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);

var horizontal_move = key_right - key_left;
var vertical_move = key_down - key_up;

//horizontal movement
{
	if(is_hurt and knock_direction=="sideways"){
		horizontal_speed *= knockback_fr;
		if(abs(horizontal_speed)<1){
			is_hurt = false;
		}
	}else{
		horizontal_speed = horizontal_move * walk_speed;
	}
	
	if(place_meeting(x+horizontal_speed,y,o_Wall)){
	while(!place_meeting(x+sign(horizontal_speed),y,o_Wall)){
		x = x + sign(horizontal_speed);
	}
	horizontal_speed = 0;
	}
	
	x+=horizontal_speed;
	
}

//vertical movement
{
	if(is_hurt and knock_direction=="updown"){
		vertical_speed *= knockback_fr;
		if(abs(vertical_speed)<1){
			is_hurt = false;
		}
	}else{
		vertical_speed = vertical_move * walk_speed;
	}
	
	if(place_meeting(x,y+vertical_speed,o_Wall)){
	while(!place_meeting(x,y+sign(vertical_speed),o_Wall)){
		y = y + sign(vertical_speed);
	}
	vertical_speed = 0;
	}

	y+=vertical_speed;
}

//Vertical Door Collision
{
	if(not is_hurt and place_meeting(x,y,o_VDoor)){
		is_hurt = true;
		player_lives -=1;
		knock_direction = "sideways";
		horizontal_speed = - horizontal_speed;
		show_debug_message("Player now has " + string(player_lives) + " lives.");
	}
}

//Horizontal Collision
{
	if(not is_hurt and place_meeting(x,y,o_HDoor)){
		is_hurt = true;
		player_lives-=1;
		knock_direction = "updown";
		vertical_speed = - vertical_speed;
		show_debug_message("Player now has " + string(player_lives) + " lives.");
	}
}


