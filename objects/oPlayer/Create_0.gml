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