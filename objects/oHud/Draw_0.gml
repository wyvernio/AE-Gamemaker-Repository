//Get cam coordinates
var _camX = camera_get_view_x( view_camera[0]);
var _camY = camera_get_view_y( view_camera[0]);

//central HUD coordinates
var _border = 16;
var _hudX = _camX + _border;
var _hudY = _camY + _border;

//Draw the players hp
if instance_exists( oPlayer )
{
	
	draw_sprite( sHealthbar2, 0, _camX + _border, _camY + _border );

	for (var i = 0; i < playerMaxHp; i++) 
	{
		//Show current hp
		var _img = 1;
		if i + 1 <= playerHp { _img = 2;  };
		var _sep = 3;
		draw_sprite( sHealthbar2, _img, _camX + _border + _sep*i, _camY + _border );
	}
}

//Draw the enemy kill count
var _enemyCountOffset = 25;
var _ecHudX = _hudX - 2;
var _ecHudY = _hudY + _enemyCountOffset;

//Draw the background/box
draw_sprite( sEnemyCountHud, 0, _ecHudX, _ecHudY )

//Draw the text
draw_set_halign( fa_left );
draw_set_valign( fa_top );
draw_set_font( fnt8bit );

	//The enemy kill count current
	draw_text( _ecHudX + 20, _ecHudY + 2, string( global.enemyKillCount) );
	
	//Total enemies in level count
	draw_text( _ecHudX + 40, _ecHudY + 2, "/" + string( global.enemyRoomMax ) );
	