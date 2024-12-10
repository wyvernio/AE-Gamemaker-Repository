

//Spawn an enemy
	timer++;
	
	//Reset timer when enemy limits have been reached
	if instance_number( oEnemyParent ) >= global.activeEnemyMax || global.totalEnemiesSpawned >= global.enemyRoomMax
	{
		timer = 0;
	}

	if timer >= spawnTime && !place_meeting( x, y+16, oTestSubject )
	{
		//Create enemy
		var _inst = instance_create_depth( x, y, depth - 1, oTestSubject);
		with (_inst) 
		{
			//make enemy invis
			image_alpha = 0;
			state = -1;
		}
	
		//Reset the timer
		timer = 0;
	}