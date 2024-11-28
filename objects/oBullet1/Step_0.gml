//move
	xspd = lengthdir_x( spd, dir);
	yspd = lengthdir_y( spd, dir);
	
	
	x += xspd;
	y += yspd;
	
//Cleanup

	//Hit confirm destroy
	if hitConfirm == true && enemyDestroy == true { destroy = true; };
	//Destroy
	if destroy == true 
	{
		//Vfx might go here
		instance_destroy();
	}

	//collision 
	if place_meeting( x + xspd, y, oSolidWall ) { destroy = true; }
	
	
	//Bulleto out of rangeo
	if point_distance( xstart, ystart, x, y) > maxDist { destroy = true; }
	
