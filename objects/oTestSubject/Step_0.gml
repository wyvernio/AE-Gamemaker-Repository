
//Code commands
var _wallCollisions = true;
var _getDamage = true;
//State machine
switch( state )
{
	
	//Spawn in from spawner
	
	case -1:
	
	//Fade in
	if image_alpha < 1 
	{
		//Don't walk while fading in
		spd = 0;
		image_alpha += fadeSpd;
	}
	
	//Walk out
	_wallCollisions = false;
	_getDamage = false;
	
	if image_alpha >= 1
	{
		
		//Set the right speed and direction
		spd = emergeSpd;
		dir = 270;
	}
	
	//Switch to a chasing state after out of spawner wall
	if !place_meeting(x, y, oWall) 
	{
		state = 0;
	}
	
	break;
	
	
	//Chase state
	case 0 :
	#region
			//Get the player's direction
			if instance_exists(oPlayer) 
		{
			dir = point_direction( x, y, oPlayer.x, oPlayer.y );
		}
		
		//Set the correct speed
		spd = chaseSpd;
		
		//Transition to shooting state
		var _camLeft = camera_get_view_x( view_camera[0] );
		var _camRight = _camLeft + camera_get_view_width( view_camera[0] );
		var _camTop = camera_get_view_y(  view_camera[0] );
		var _camBottom = _camTop + camera_get_view_height( view_camera[0] );
		
		//Only add to timer if on screen
		if  bbox_right > _camLeft && bbox_left < _camRight && bbox_bottom > _camTop && bbox_top < _camBottom
		{
			shootTimer++;
		}
		
		if shootTimer > cooldownTime
		{
			//Go to shoot state
			state = 1;
			
			//Reset timer for shooting timer
			shootTimer = 0;
		}
		
		#endregion
		break;
		
		
	//Pause and shoot state
	case 1 : 
			#region
			//Get the player's direction
			if instance_exists(oPlayer) 
		{
			dir = point_direction( x, y, oPlayer.x, oPlayer.y );
		}
		
		//Set the correct speed
		spd = 0;
		
		//Stop animating / manually setting the image index
		image_index = 0;
		
		//Shoot a bullet
			shootTimer++;
		
			//Create bullet
			if shootTimer == 1
			{
				bulletInst = instance_create_depth( x + bulletXoff*face, y + bulletYoff, depth, oSpit );
			}
			
			//Keep the bullet in the test subject's mouf 
			if shootTimer <= windupTime && instance_exists( bulletInst )
			{
				bulletInst.x = x + bulletXoff * face;
				bulletInst.y = y + bulletYoff;
			}
			
			
			//Shoot the bullet after the windup time is over
			if shootTimer == windupTime && instance_exists( bulletInst )
			{
				//Set bullet state to movement state
				bulletInst.state = 1;	
			}
			
			//Recover, and return to chasing player
			if shootTimer > windupTime + recoveryTime
			{
				//Go back to chasing player
				state = 0;
				
				//Reset the timer so we can use it again
				shootTimer = 0;
			}
			#endregion
		break;
}

//Chase the player

		
	
	
	//Getting the speeds
	xspd = lengthdir_x( spd, dir);
	yspd = lengthdir_y( spd, dir);
	
	//Get the correct face
		if dir > 90 && dir < 270 
		{
			face = -1;
		} else {
			face = 1;
		}
		
		
	//Collisions
		//Wall collisions
		if _wallCollisions == true
			{
	
				if place_meeting( x + xspd, y, oWall ) 
				{
					xspd = 0;
				}
	
				if place_meeting( x, y + yspd, oWall )
				{
					yspd = 0;
				}
			}
		//Enemy Collisions
		if _wallCollisions == true
			{
	
				if place_meeting( x + xspd, y, oEnemyParent ) 
				{
					xspd = 0;
				}
	
				if place_meeting( x, y + yspd, oEnemyParent )
				{
					yspd = 0;
				}
			}
		//Moving
		x += xspd;
		y += yspd;
	
		// Repulsion force to separate overlapping enemies
		var overlap = instance_place(x, y, oEnemyParent);
			if overlap != noone && overlap != id {
			    var dx = x - overlap.x;
			    var dy = y - overlap.y;
			    var dist = point_distance(x, y, overlap.x, overlap.y);
			    if dist > 0 {
			        x += dx / dist; // Push away along X
			        y += dy / dist; // Push away along Y
			    }
			}

		//Set the depth
			depth = -y;
	
	// Getting damaged and dying
		// Inherit the parent event
		event_inherited();


