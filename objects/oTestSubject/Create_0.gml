
// Inherit the parent event
event_inherited();

spd = 0;
chaseSpd = .5;
dir = 0;
xspd = 0;
yspd = 0;

face = 1;

//State Machine (Either 1 or 0 for switch case)
state = 0;

		//Spawn from spawner state
		fadeSpd = 1/15;
		emergeSpd = .2;
		//Shooting state
		cooldownTime = 4 * 60;
		shootTimer = irandom( cooldownTime);
		windupTime = 60;
		recoveryTime = 45;
		bulletInst = noone;
		
		//These two are the offsets for where the projectile appears on the model, because mine is a placeholder, they'll be 0 for now.
		bulletXoff = 0;
		bulletYoff = 0;