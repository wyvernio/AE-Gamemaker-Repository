//Get the player's hp info
if instance_exists(oPlayer)
{
	playerHp = oPlayer.hp;
	playerMaxHp = oPlayer.maxHp;
}

// Manage timer countdown
if global.timerActive {
    global.timer--;
    if global.timer <= 0 {
        global.timerActive = false; // Stop timer
        global.timer = 0; // Ensure it doesn't go negative
    }
}


