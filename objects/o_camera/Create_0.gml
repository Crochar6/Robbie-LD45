/// @description Setup camera

cam = view_camera[0];

follow = o_robbie;

view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;

xTo = x;
yTo = y;
camspeed = 20;

mouse_camera_change = 30; //Amount of the camera's position that the player can change with the mouse

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 8;

b1_id = layer_get_id("Background1");
b1_depth = 1.4;
b2_id = layer_get_id("Background2");
b2_depth = 1.3;
b3_id = layer_get_id("Background3");
b3_depth = 1.2;
b4_id = layer_get_id("Background4");
b4_depth = 1.1;
b5_id = layer_get_id("Background5");
b5_depth = 1;

if (layer_exists("Fog")){
	clouds_id = layer_get_id("Fog");
	clouds_depth = 1.6;
}else clouds_id = noone;
if (layer_exists("Fog1")){
	clouds1_id = layer_get_id("Fog1");
	clouds1_depth = 1.6;
}else clouds1_id = noone;
if (layer_exists("Bush_back")){
	bush_back_id = layer_get_id("Bush_back");
	bush_back_depth =  10;
}else bush_back_id = noone;


