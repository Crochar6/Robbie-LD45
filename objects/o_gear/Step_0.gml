if (started){
if (i > frames){
	vspeed = -2;
	image_alpha -= 0.02;
	image_speed = 3;
}else{
	x += (o_robbie.x - x)/15;
	y += ((o_robbie.y - 23) - y)/15;
	image_speed = 2.2;
}
i ++;
} else{
	//Sinus
	y = round(anchorY + sin(timer*frequency)*amplitude);
	timer++;
}

if image_alpha < 0{
	instance_destroy();
	global.points ++;
}

