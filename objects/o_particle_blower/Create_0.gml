/// @description
image_alpha = 0.8;
image_index = 0;
vspeed = random_range(-0.5,-3.2);
hspeed = random_range(0,1) * choose(1,-1);
fric = 0.03;
image_speed = random_range (0.15,0.6);
y += choose(0,-1);
x += irandom_range(5,-5);
visible = o_robbie.visible;