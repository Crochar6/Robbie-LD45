/// @description
image_alpha = 0.8;
image_index = 0;
vspeed = random_range(-0.2,-0.4);
hspeed = random_range(0,0.13) * choose(1,-1);
fric = 0.005;
image_speed = random_range (0.15,0.8);
y += choose(0,-1);
if (irandom_range(0,1) == 1) instance_destroy();