/// @description Insert description here
// You can write your code in this editor
switch(menu_index){
	case 0:
		show_debug_message("NEW MENU");
		room_goto(LvL1_Interconnected);
		break;
	case 2:
		game_end();
		break;
}