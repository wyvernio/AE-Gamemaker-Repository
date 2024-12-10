
if (state == 0 && instance_exists(oPlayer)) {
    // Calculate and store the direction at the moment of firing
    dir = point_direction(x, y, oPlayer.x, oPlayer.y);
    image_angle = dir; // Rotate the sprite initially to face the player
}


//state machine
switch ( state ) 
{
	
	//wait for enemy to shoot state
	case 0: 
	
			//aim for player
			if instance_exists( oPlayer )
			{
				dir = point_direction(x,y, oPlayer.x, oPlayer.centerY);
			}
			
			//Set the depth to make myself more visible
			depth = -y - 50;
								
		break;
		
		//shoot / travel
		case 1: 
				
				//Movement
				xspd = lengthdir_x(spd, dir);
				yspd = lengthdir_y(spd, dir);
				
				x += xspd;
				y += yspd;
				
				//Updated depth
				depth = -y;
				
				
		
		
		break;
}


//clean up
	//Out of room bounds
	if bbox_right < 0 || bbox_left > room_width || bbox_bottom < 0 || bbox_top > room_height 
	{
		destroy = true;
	}
	
	//Player collision
	if hitConfirm == true && playerDestroy == true { destroy = true; };
	
	//Actually destroy self
	if destroy == true { instance_destroy(); };

	//Wall collision
	if place_meeting( x ,y , oSolidWall ) { destroy = true; };