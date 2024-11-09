//Get inputs
rightKey = keyboard_check(ord( "D" ));
leftKey = keyboard_check(ord( "A" ));
upKey = keyboard_check(ord( "W" ));
downKey = keyboard_check(ord( "S" ));
shootKey = mouse_check_button( mb_left );

//Player movement
#region
	//Get direction
	var _horizKey = rightKey - leftKey;
	var _vertKey = downKey - upKey;
	moveDir = point_direction(0,0, _horizKey, _vertKey );
	
	//Get x and y speeds
	var _spd = 0;
	var _inputLevel = point_distance(0, 0, _horizKey, _vertKey);
	_inputLevel = clamp( _inputLevel, 0, 1);
	_spd = moveSpd * _inputLevel;
	
	xspd = lengthdir_x( _spd, moveDir );
	yspd = lengthdir_y( _spd, moveDir );
	
	//Collisions
	if place_meeting( x + xspd, y, oWall) {
		xspd = 0;
	}
	
	if place_meeting( x, y + yspd, oWall) {
		yspd = 0;
	}
	
	//Moving the player
	x += xspd;
	y += yspd;
	
	//Depth
	depth = -bbox_bottom;
	
#endregion

//Player aiming
#region
	centerY = y + centerYOffset;
	
	//aim
	aimDir = point_direction( x, centerY, mouse_x, mouse_y );
#endregion

//Sprite control
#region
	//Make sure the player is facing the right direction
	face = round( aimDir/90 );
	if face == 4 { face = 0; };

	//stop animating on idle
	if xspd == 0 && yspd == 0 
	{
		image_index = 0;
	}
	
	//set the player sprite
	mask_index = sprite[3];
	sprite_index = sprite[face];
#endregion

//Shooting weapon
#region

if shootTimer > 0 { shootTimer--;};


if shootKey && shootTimer <= 0
{
	
	//Reset the timer
	shootTimer = shootCooldown;
	
	//Shooting
			//Create bullet, storing identifier into bulletinst
			var _xOffset = lengthdir_x( weaponLength + weaponOffsetDist, aimDir );
			var _yOffset = lengthdir_y( weaponLength + weaponOffsetDist, aimDir );
	
			var _bulletinst = instance_create_depth( x +_xOffset, centerY + _yOffset, depth-100, bulletObj);
	
			//Change bullet's direction
			with ( _bulletinst )
			{
				dir = other.aimDir;
			}
			
}

#endregion