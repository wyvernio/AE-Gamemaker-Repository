//The draw event runs during the entire program, its like the step event, but its more expensive.
//It can calculate things but also put things on the screen.

//Draw the weapon behind the player
	if aimDir >= 0 && aimDir < 180
	{
	draw_my_weapon();
	}

//Draw the player
	draw_self();


//Draw the weapon
	if aimDir >= 180 && aimDir < 360
	{
	draw_my_weapon();
	}