depth = -1000;

w = display_get_gui_width();
h = display_get_gui_height();
h_half = h * 0.5;
enum TRANS_MODE
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO,
	NEXTLEVEL
}
mode = TRANS_MODE.INTRO; //0 = off, 1 = next  [TRANS_MODE.INTRO = 4]
percent = 1;
target = room;