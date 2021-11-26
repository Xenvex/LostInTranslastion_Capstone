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
		if(horizontal_move==1){
			image_speed = horizontal_speed/3;
			sprite_index=PlayerWalkRight;
		}
		if(horizontal_move==-1){
			image_speed = horizontal_speed/3;
			sprite_index=PlayerWalkLeft;
		}
		if(keyboard_check(vk_nokey)){
			image_speed = 0;
			image_index = 0;
		}
	}
	
	if(place_meeting(x+horizontal_speed,y,o_Wall)){
	while(!place_meeting(x+sign(horizontal_speed),y,o_Wall)){
		x = x + sign(horizontal_speed);
	}
	horizontal_speed = 0;
	}
	
	if(place_meeting(x+horizontal_speed,y,o_Invisible_Wall)){
	while(!place_meeting(x+sign(horizontal_speed),y,o_Invisible_Wall)){
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
		if(vertical_move == 1){
			image_speed = vertical_speed/3;
			sprite_index = PlayerWalkDown;
		}
		if(vertical_move == -1){
			image_speed = vertical_speed/3;
			sprite_index = PlayerWalkUp;
		}
		if(keyboard_check(vk_nokey)){
			image_speed = 0;
			image_index = 0;
		}
	}
	
	if(place_meeting(x,y+vertical_speed,o_Wall)){
	while(!place_meeting(x,y+sign(vertical_speed),o_Wall)){
		y = y + sign(vertical_speed);
	}
	vertical_speed = 0;
	}
	
	if(place_meeting(x,y+vertical_speed,o_Invisible_Wall)){
	while(!place_meeting(x,y+sign(vertical_speed),o_Invisible_Wall)){
		y = y + sign(vertical_speed);
	}
	vertical_speed = 0;
	}

	y+=vertical_speed;
}

//Vertical East Door Collision
{
	if(not is_hurt and place_meeting(x,y,o_VEastDoor)){
		var door_obj=instance_place(x,y,o_VEastDoor);
		if(door_obj.correct_door == true){
			door_obj.visible = false;
			if(door_obj.playedAlready == false){
				PlayOneShot(sndDoorOpen);
				door_obj.playedAlready = true;
				global.door_count+=1;
				//instance_activate_object(o_Check);
				if(instance_exists(o_Cross))
				{
					instance_destroy(o_Cross);	
				}
				instance_create_depth(global.ePoint.x, global.ePoint.y, o_Player.depth + 1, o_Check);
			}
			//have counter for if door was already passed through
			door_obj.visible = false;
			//show_debug_message("Correct Door Taken");
			
		}else{
			is_hurt = true;
			PlayOneShot(sndHurt);
			player_lives -=1;
			knock_direction = "sideways";
			horizontal_speed = - horizontal_speed;
			show_debug_message("Player now has " + string(player_lives) + " lives.");
			if(instance_exists(o_Check))
			{
				instance_destroy(o_Check);	
			}
			instance_create_depth(global.ePoint.x, global.ePoint.y, o_Player.depth + 1, o_Cross);
		}
	}
	
}

//Vertical West Door
{
if(not is_hurt and place_meeting(x,y,o_VWestDoor)){
		var door_obj=instance_place(x,y,o_VWestDoor);
		if(door_obj.correct_door == true){
			door_obj.visible = false;
			if(door_obj.playedAlready == false){
				PlayOneShot(sndDoorOpen);
				door_obj.playedAlready = true;
				global.door_count+=1;
				//instance_activate_object(o_Check);
				if(instance_exists(o_Cross))
				{
					instance_destroy(o_Cross);	
				}
				instance_create_depth(global.ePoint.x, global.ePoint.y, o_Player.depth + 1, o_Check);
			}
			//have counter for if door was already passed through
			door_obj.visible = false;
			//show_debug_message("Correct Door Taken");
			
		}else{
			is_hurt = true;
			PlayOneShot(sndHurt);
			player_lives -=1;
			knock_direction = "sideways";
			horizontal_speed = - horizontal_speed;
			show_debug_message("Player now has " + string(player_lives) + " lives.");
			if(instance_exists(o_Check))
			{
				instance_destroy(o_Check);	
			}
			instance_create_depth(global.ePoint.x, global.ePoint.y, o_Player.depth + 1, o_Cross);
		}
	}	
}

//Horizontal North Collision
{
	if(not is_hurt and place_meeting(x,y,o_HNorthDoor)){
		var door_obj=instance_place(x,y,o_HNorthDoor);
		if(door_obj.correct_door == true){
			if(door_obj.playedAlready == false){
				PlayOneShot(sndDoorOpen);
				door_obj.playedAlready = true;
				global.door_count+=1;
				//instance_activate_object(o_Check);
				if(instance_exists(o_Cross))
				{
					instance_destroy(o_Cross);	
				}
				instance_create_depth(global.ePoint.x, global.ePoint.y, o_Player.depth + 1, o_Check);
			}
			//have counter for if door was already passed through
			door_obj.visible = false;
			//show_debug_message("Correct Door Taken");
		}else{
			is_hurt = true;
			PlayOneShot(sndHurt);
			player_lives-=1;
			knock_direction = "updown";
			vertical_speed = - vertical_speed;
			show_debug_message("Player now has " + string(player_lives) + " lives.");
			if(instance_exists(o_Check))
			{
				instance_destroy(o_Check);	
			}
			instance_create_depth(global.ePoint.x, global.ePoint.y, o_Player.depth + 1, o_Cross);
		}
	}
}

//Horizontal South Collision
{
	if(not is_hurt and place_meeting(x,y,o_HSouthDoor)){
		var door_obj=instance_place(x,y,o_HSouthDoor);
		if(door_obj.correct_door == true){
			if(door_obj.playedAlready == false){
				PlayOneShot(sndDoorOpen);
				door_obj.playedAlready = true;
				global.door_count+=1;
				//instance_activate_object(o_Check);
				if(instance_exists(o_Cross))
				{
					instance_destroy(o_Cross);	
				}
				instance_create_depth(global.ePoint.x, global.ePoint.y, o_Player.depth + 1, o_Check);
			}
			//have counter for if door was already passed through
			door_obj.visible = false;
			//show_debug_message("Correct Door Taken");
		}else{
			is_hurt = true;
			PlayOneShot(sndHurt);
			player_lives-=1;
			knock_direction = "updown";
			vertical_speed = - vertical_speed;
			show_debug_message("Player now has " + string(player_lives) + " lives.");
			if(instance_exists(o_Check))
			{
				instance_destroy(o_Check);	
			}
			instance_create_depth(global.ePoint.x, global.ePoint.y, o_Player.depth + 1, o_Cross);
		}
	}
}



