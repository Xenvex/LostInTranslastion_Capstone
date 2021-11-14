if(instance_exists(o_Player))
{
	if(o_Player.player_lives <= 0)
	{
		room_restart();
	}
}
