

if (timer <= 0){
	image_speed = 1;
	visible = true;
	if visible_master = false visible = false;
	
}
timer --;

if (!particled) and (timer < -17){
particled = true;
for (i = 0; i < 6; i ++){
	var o = i;
	with(instance_create_layer(2040,541,"Particles",o_death1)){
		image_index = o;
		x+= irandom_range(-3,3);
	}
	ScreenShake(9,50);
	repeat (10){
	with(instance_create_layer(2040,541,"Particles",o_particle_smoke1)){

		x+= irandom_range(-18,18);
	}
	}
}
}

if (global.points >= 30){
	endable = true;
}