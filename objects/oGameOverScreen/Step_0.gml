//Get the shoot key, that we just made global using the function
shootKey = global.shootKey;

//fade in
alpha += alphaSpd;
alpha = clamp ( alpha, 0, 1);

//Restart
if shootKey && alpha >= 1
{
	room_restart();	
}