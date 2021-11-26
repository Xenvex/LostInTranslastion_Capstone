XOffset = camera_get_view_width(view_camera[0])-640; 
YOffset = camera_get_view_height(view_camera[0])-660;

if(instance_exists(o_Player))
{

var cl = camera_get_view_x(view_camera[0])
var ct = camera_get_view_y(view_camera[0])
draw_set_halign(fa_center)

var off_x = self.x - cl // x is the normal x position
var off_y = self.y - ct // y is the normal y position
      
// convert to gui
var off_x_percent = off_x / camera_get_view_width(view_camera[0])
var off_y_percent = off_y / camera_get_view_height(view_camera[0])
      
var gui_x = off_x_percent * display_get_gui_width()
var gui_y = off_y_percent * display_get_gui_height()

}

draw_sprite(Tiempo, 0, gui_x,gui_y)