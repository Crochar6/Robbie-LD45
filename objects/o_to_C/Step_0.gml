if (layer_exists("Particles")){
	if (choose(1,2,3,4,5,6,7,8,9) == 3) instance_create_layer(x+irandom_range(-2,2),y-4,"Particles",o_particle_green);
}