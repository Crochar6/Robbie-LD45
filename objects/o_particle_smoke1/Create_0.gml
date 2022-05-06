/// @description
if (irandom_range(0,3) == 1) instance_create_layer(x,y, "Particles",o_particle_smoke);
image_alpha = 1;
image_index = 0;
vspeed = random_range(-0.1,-0.8);
hspeed = random_range(0,0.25) * choose(1,-1);
fric = 0.006;
image_speed = random_range (0.08,0.3);
x+= choose(1,0,-1);
y+= choose(0,-1,1,1,-2);

