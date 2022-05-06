/// @description
if (irandom_range(0,3) == 1) instance_create_layer(x,y, "Particles",o_particle_smoke);
image_alpha = 1;
image_index = 0;
vspeed = random_range(-0.5,-1.1);
hspeed = random_range(0,0.14) * choose(1,-1) - o_robbie.image_xscale * 1.4;
fric = 0.06;
image_speed = random_range (0.2,0.3);
x+= choose(1,0,-1);
y+= choose(0,-1,1,1,-2);
visible = o_robbie.visible;