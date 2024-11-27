//receive damage
if place_meeting( x, y, oDamageEnemy )
{
	var _inst = instance_place( x, y, oDamageEnemy );
	
	//take damage from specific instance whether thats an enemy or bullet
	hp -= _inst.damage;
	
	//Tell the damage instance how to destroy itself
	_inst.destroy = true;
}




//Death!!
if hp <= 0 
{
	instance_destroy();
	
}