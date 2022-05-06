

//Update destination
if (instance_exists(follow)){
	xTo = follow.x;
	yTo = follow.y;
}

xTo += lengthdir_x(mouse_camera_change,point_direction(x,y,mouse_x,mouse_y));
yTo += lengthdir_y(mouse_camera_change,point_direction(x,y,mouse_x,mouse_y));

//Move o_camera
x += (xTo - x) / camspeed;
y += (yTo - y) / camspeed;

//Keep camera inside the room
x = clamp(x,view_w_half+buff,room_width-view_w_half-buff);
y = clamp(y,view_h_half+buff,room_height-view_h_half-buff);

//Screen_shake
x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));

//Update camera view
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);

//Parallax background

//Sky
layer_y("Cel", y -view_h_half);
layer_x("Cel", x - view_w_half);

//Layer 1
if (layer_exists(b1_id)){
	layer_y(b1_id, y-view_h_half);
	layer_x(b1_id, x/b1_depth - global.timer * 0.2);
}
//Layer 2
if (layer_exists(b2_id)){
	layer_y(b2_id, y-view_h_half);
	layer_x(b2_id, x/b2_depth) ;
}

//Layer 3
if (layer_exists(b3_id)){
	layer_y(b3_id, y-view_h_half);
	layer_x(b3_id, x/b3_depth + global.timer * 0.15);
}
//Layer 4
if (layer_exists(b4_id)){
	layer_y(b4_id, y-view_h_half);
	layer_x(b4_id, x/b4_depth);
}
//Layer 5
if (layer_exists(b5_id)){
	layer_y(b5_id, y-view_h_half);
	layer_x(b5_id, x/b5_depth);
}
//Fog
if (layer_exists(clouds_id)){
	layer_y(clouds_id, y-view_h_half);
	layer_x(clouds_id, x/clouds_depth - global.timer * 0.1) ;
}
//Fog1
if (layer_exists(clouds1_id)){
	layer_y(clouds1_id, y-view_h_half);
	layer_x(clouds1_id, x/clouds1_depth + global.timer * 0.15) ;
}
global.timer ++;
