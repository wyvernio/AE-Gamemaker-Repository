
var _camX = camera_get_view_x( view_camera[0] );
var _camW = camera_get_view_width( view_camera[0] );
var _camY = camera_get_view_y( view_camera[0] );
var _camH = camera_get_view_height( view_camera[0] );

//draw a black rectangle over the screen

draw_set_alpha( alpha * alphaMax );
draw_rectangle_color( _camX, _camY, _camX + _camW, _camY + _camH, c_black, c_black, c_black, c_black, false );
draw_set_alpha( 1 );

//draw the text
	//Reset the alpha
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha(alpha);
	draw_set_font( fnt8bit );
	
	//Game Over
	var _gameoverOffset = -32;
	draw_text_transformed( _camX + _camW/2, _camY + _camH/2 + _gameoverOffset, "Game Over!?!", 5, 5, 0 );
	
	//Press Shoot to Restart
	var _restartOffset = 80;
	draw_text_transformed( _camX + _camW/2, _camY + _camH/2 + _restartOffset, "- Press Shoot to Restart -", 2, 2, 0 );
	draw_set_alpha( 1 );