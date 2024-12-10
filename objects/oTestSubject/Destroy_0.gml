//Get rid of bullet if we haven't shot it yet, and die
if instance_exists( bulletInst ) && bulletInst.state == 0 
{
	bulletInst.destroy = true;
}