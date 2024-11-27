

//Chase the player

		if instance_exists(oPlayer) 
		{
			dir = point_direction( x, y, oPlayer.x, oPlayer.y );
		}
	
	
	//Getting the speeds
	xspd = lengthdir_x( spd, dir);
	yspd = lengthdir_y( spd, dir);
	
	//Get the correct face
		if xspd > 0 {	face = 1;  }
		if xspd < 0 {   face = -1; }
		
		
		
	//Collisions
	if place_meeting( x + xspd, y, oWall ) || place_meeting( x + xspd, y, oEnemyParent )
	{
		xspd = 0;
	}
	
	if place_meeting( x, y + yspd, oWall ) || place_meeting( x + xspd, y, oEnemyParent )
	{
		yspd = 0;
	}
	
	
	//Moving
	x += xspd;
	y += yspd;
	
// Getting damaged and dying
	// Inherit the parent event
	event_inherited();


