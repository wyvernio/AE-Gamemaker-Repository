//Damage Setup 20 health
	get_damaged_create(20, true);

//Movement variables
	moveDir = 0;
	moveSpd = 2; //In pixels
	xspd = 0;
	yspd = 0;

//Sprite control
#region
	centerYOffset = -6;
	centerY = y + centerYOffset; //set in step event

	weaponOffsetDist = 4;
	aimDir = 0;


	face = 3;
	sprite[0] = sPlayerBatRight;
	sprite[1] = sPlayerBatUp;
	sprite[2] = sPlayerBatLeft;
	sprite[3] = sPlayerBatDown;
#endregion

	sprite_index = sprite[face];
	
//Weapon info
	shootTimer = 0;
	
	//Add weapons to player weapon inv
	array_push( global.PlayerWeapons, global.WeaponList.bigShoota);
	array_push( global.PlayerWeapons, global.WeaponList.longShoota);
	array_push( global.PlayerWeapons, global.WeaponList.multiShoota);
	
	//Definition of selected weapon, 0 is first slot, 1 is second
	selectedWeapon = 0;
	weapon = global.PlayerWeapons[selectedWeapon];
		
	