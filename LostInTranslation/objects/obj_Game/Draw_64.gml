XOffset = camera_get_view_width(view_camera[0])-640; 
YOffset = camera_get_view_height(view_camera[0])-660;

draw_set_font(fnt_UI);
draw_set_color(c_red);


if(room != Menu)
{
	//Draw Current Level
	//draw_text(OffSet, YOffset
	
	//Draw Lives
	if(instance_exists(o_Player))
	{
		draw_text(o_Player.x, o_Player.y, "Lives: ");
	}
}
//draw_text(XOffset, YOffset, "Hello");