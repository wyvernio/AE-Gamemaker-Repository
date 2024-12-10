

//What should we be checking for in order to receive damage?
get_damaged(oDamageEnemy);



//Death!!
if hp <= 0 
{
	instance_destroy();
	global.enemyKillCount++;
}