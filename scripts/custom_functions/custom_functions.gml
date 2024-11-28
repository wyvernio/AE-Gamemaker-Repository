//Drawing the player's weapon

function draw_my_weapon() 
{

//Get the weapon off the player's body
	var _xOffset = lengthdir_x( weaponOffsetDist, aimDir );
	var _yOffset = lengthdir_y( weaponOffsetDist, aimDir );

	//flip the weapon upright when turning around
	var _weaponYscl = 1;
	
	if aimDir > 90 && aimDir < 270 
	{
		_weaponYscl = -1;
	}


draw_sprite_ext( weapon.sprite, 0, x + _xOffset, centerY + _yOffset, 1, _weaponYscl, aimDir, c_white, image_alpha );



}



//Damage Calculation

	//Damage create event
function get_damaged_create(_hp = 10, _iframes = false)
{
	hp = _hp;
	
	//Get iframes
	if _iframes == true
	{
		iframeTimer = 0;
		iframeNumber = 90;
	}
	
	//Create the damage list
	if _iframes == false
	{
		damageList = ds_list_create();
	}
}

	//Damage clean up event
function get_damaged_cleanup() 
{
	//DO NOT NEED if using iframes.
	
	//Deletes our damage list data structure to free memory
	ds_list_destroy(damageList);
}

	//Damage step event
function get_damaged( _damageObj, _iframes = false)
	{
		
		//Special exit for iframe timer
		if _iframes == true && iframeTimer > 0 
			{
					iframeTimer--;
					//Every 5 frames, this code will run, basically
					if iframeTimer mod 5 == 0 {
					//Turn opacity to 0 when hit during iframes
					if image_alpha == 1
					{
						image_alpha = 0;
					} else {
						image_alpha = 1;
					}
			}
			
			exit;
		}
		
		//Make sure the iframe blinkin' stops
		if _iframes == true 
		{
			image_alpha = 1;
		}
		//Receive damage
		if place_meeting( x, y, _damageObj )
		{

	
			//Getting a list of the damage instances
	
				//Create a ds list and copy instances onto it
				var _instList = ds_list_create();
				instance_place_list( x, y, _damageObj, _instList, false );
	
	
			//Get the size of our list 
			var _listSize = ds_list_size(_instList);
		
		
				//Loop through our list of damage instances
				var _hitConfirm = false;
				
				
				for (var i=0; i <  _listSize; i++) 
					{
				
						//Get a damage object instance from the list
						var _inst = ds_list_find_value (_instList, i);
			
				
			
				

						//Check if this instance is already in the damage list
						if _iframes == true || ds_list_find_index( damageList, _inst ) == -1 
						{
					
							//Add the new damage instance to the damage list
							if _iframes == false { ds_list_add( damageList, _inst); }
				
							
							//Take damage from that one instance
							hp -= _inst.damage;
							_hitConfirm = true;
							//Tell that one instance it has impacted
							_inst.hitConfirm = true;
						}
				
					}
					//Set iframes if we were hit!
					if _iframes == true && _hitConfirm
					{
						iframeTimer = iframeNumber;
					}
			
		
			//Free memory by destroying the ds list, no memory leaks!!
			ds_list_destroy( _instList );
	

		}

		//Clear the damage list of objects that no longer exist, and are no longer touching
		if _iframes == false
		{
			var _damageListSize = ds_list_size(damageList);
				for (var i = 0; i < _damageListSize; i++)
				{

					//If not touching the damage instance anymore, remove it from the list AND set the loop back 1 position
						var _inst = ds_list_find_value( damageList, i);
						if !instance_exists( _inst ) || !place_meeting( x, y, _inst)
						{
							ds_list_delete(damageList, i);
							i--;
							_damageListSize--;
						}
				}
		}
	
	}