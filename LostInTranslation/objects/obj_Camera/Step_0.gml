//Update destination
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

//Update Object Position
if(xdelay = false)
{
	x += (xTo - x);
}
else
{
	x += (xTo - x) / 15;
}
y += (yTo - y) / 15;

//Keep camera center inside room
x = clamp(x, viewWidthHalf, room_width - viewWidthHalf);
y = clamp(y, viewHeightHalf, room_height - viewHeightHalf);//  - viewHeightHalf/2);

//Screenshake
x += random_range(-shakeRemain, shakeRemain);
y += random_range(-shakeRemain, shakeRemain);

shakeRemain = max(0, shakeRemain - ((1/shakeLength) * shakeMagnitude));

camera_set_view_pos(cam, x - viewWidthHalf, y - viewHeightHalf)// - viewHeightHalf/2);

/*
 devicew = display_get_width()    //store width of display
 deviceh = display_get_height()    //store height of display

 //next line of code calculates the aspect ratio of the display, 
 //and calculates what the room_height would need to be decreased to in order to meet the aspect ratio
 //note that this assumes portrait mode (height > width) and would need to be reversed if in landscape mode
 newdisplay = devicew/deviceh*room_height   

 //set the view to the newly determined resolution, and the port to the device we are scaling to
 view_wview[0] = newdisplay
 view_hview[0] = room_height
 view_wport[0] = devicew
 view_hport[0] = deviceh

 //do the actual resizing
 surface_resize(application_surface, view_wport[0], view_hport[0])