cam = view_camera[0];
//follow = 
viewWidthHalf = camera_get_view_width(cam) * 0.5;
viewHeightHalf = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;

//Screenshake variables
shakeLength = 0;
shakeMagnitude = 0;
shakeRemain = 0;