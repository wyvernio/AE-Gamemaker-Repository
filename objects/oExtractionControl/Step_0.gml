shootKey = global.shootKey;

if (global.game_ended == true) {
    // Check if the player clicks the left mouse button to restart
    //Restart
	
	//fade in
	alpha += alphaSpd;
	alpha = clamp ( alpha, 0, 1);

	 if (mouse_check_button_pressed(mb_left) && alpha >= 1)
		{
			global.timer = 90 * 60;
			player_destroyed = false;
			global.game_ended = false;
			alpha = 0;
			
			room_restart();	
			
			
		}
		
		
	if (!player_destroyed && instance_exists(oPlayer)) 
		{
		
		    instance_destroy(oPlayer); 
			player_destroyed = true;
		}
}





