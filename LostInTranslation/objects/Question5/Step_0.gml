/// @description Insert description here
// You can write your code in this editor
if(place_meeting(x,y, Answer5))
{
	instance_create_layer(x,y,"Instances",Correct);
	if(collision==0)
	{
		global.score++;
		collision++;
	}
}
if(place_meeting(x,y, Answer2)|| place_meeting(x,y, Answer3) 
|| place_meeting(x,y, Answer4) || place_meeting(x,y, Answer1))
{
	instance_create_layer(x,y,"Instances",Incorrect);
}