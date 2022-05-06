
while (blower_particle_counter > 0){
	if (layer_exists("Particles")){
		instance_create_layer(x,y+o_robbie.vsp - 5, "Particles",o_particle_blower);
	}
	blower_particle_counter --;
}
blower_particle_counter = blower_particle_number;

image_speed = 1;
