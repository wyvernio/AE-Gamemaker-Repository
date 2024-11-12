//Get inputs
rightKey = keyboard_check(ord( "D" ));
leftKey = keyboard_check(ord( "A" ));
upKey = keyboard_check(ord( "W" ));
downKey = keyboard_check(ord( "S" ));
shootKey = mouse_check_button( mb_left );
swapKeyPressed = mouse_check_button_pressed( mb_right );

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

//Weapon swapping
#region

var _playerWeapons = global.PlayerWeapons;

	//Cycle through weapons
	if swapKeyPressed
	{
		//Increment the weapon slot by one, switching to the next one in the array
		selectedWeapon++;
		
		//We have two weapons, so our selectedWeapon number can't be greater than two
		if selectedWeapon >= array_length(_playerWeapons) { selectedWeapon = 0; };
		
		//Set the new weapon
		weapon = _playerWeapons[selectedWeapon];
		
	}
#endregion

//Shooting weapon
#region

if shootTimer > 0 { shootTimer--;};


if shootKey && shootTimer <= 0
{
	
	//Reset the timer
	shootTimer = weapon.cooldown;
	
	//Shooting
			//Create bullet, storing identifier into bulletinst
			var _xOffset = lengthdir_x( weapon.length + weaponOffsetDist, aimDir );
			var _yOffset = lengthdir_y( weapon.length + weaponOffsetDist, aimDir );
	
			var _spread = weapon.spread;
			var _spreadDiv = _spread / max( weapon.bulletNum - 1, 1) ;
			
			
			//A loop that creates a bullet for each bulletNum we've set, so 7 loops for 7 bullets in a shotgun spread
			for ( var i = 0; i < weapon.bulletNum; i++) 
			{ 
				var _bulletinst = instance_create_depth( x +_xOffset, centerY + _yOffset, depth-100, weapon.bulletObj);
	
				//Change bullet's direction
				with ( _bulletinst )
				{
					dir = other.aimDir - _spread / 2 + _spreadDiv * i;
					
					//Turn the bullet to the correct direction at creation, if necessary
					if dirFix = true 
					{
						image_angle = dir;
					}
				}
			}
			
			
}

#endregion