//constructor template for weapons, all values given in the function are defaults that get replaced when the function is called.
function create_weapon( _sprite = sBigShoota, _weaponLength = 0, _bulletObj = oBullet1, _cooldown = 1, _bulletNum = 1, _spread = 0  ) constructor
{
	sprite = _sprite;
	length = _weaponLength;
	bulletObj = _bulletObj;
	cooldown = _cooldown;
	bulletNum = _bulletNum;
	spread = _spread;
	

}

global.PlayerWeapons = array_create(0);


//The weapons
global.WeaponList = 
{
	bigShoota : new create_weapon( 
		sBigShoota,
		sprite_get_bbox_right( sBigShoota ) - sprite_get_xoffset( sBigShoota ),
		oBullet1,
		5,
		1,
		0
	),
	
	longShoota : new create_weapon(
		sLongShoota,
		sprite_get_bbox_right( sLongShoota ) - sprite_get_xoffset( sLongShoota ),
		oLongBullet,
		70,
		1,
		0
	),
	
	multiShoota : new create_weapon(
		sMultiShoota,
		sprite_get_bbox_right( sMultiShoota ) - sprite_get_xoffset( sMultiShoota ),
		oMultiBullet,
		18,
		7,
		90
	),
	
}

