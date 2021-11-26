if(instance_exists(o_Player))
{
	if(o_Player.player_lives <= 0)
	{
		room_restart();
	}
	if(global.door_count==3){
		room_goto(Ending);
	}
}
