if(global.ca==1 && text==correct_answer)
{
instance_create_depth(x,y, -99, Correct);
if(collision==0)
	{
		global.score++;
		collision++;
	}
}
if(global.ca==1 && text!="" && text!=correct_answer)
{
		instance_create_depth(x,y, -99, Incorrect);

}
