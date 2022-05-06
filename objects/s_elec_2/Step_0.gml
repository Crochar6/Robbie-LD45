if (state = 0){
	sprite_index = s_elec_off_2;
	image_speed = 0;
	wait_counter ++;
	if (wait_counter > wait){
		state = 1;
		wait_counter = 0;
	}
}
if (state = 1){
	sprite_index = s_elec_off_2;
	image_speed = 1;
}

if (state = 2){
	sprite_index = s_elec_on_2;
	image_speed = 1;
	if (place_meeting(x,y,o_robbie)) PlayerDie();
	if (times_count >= times){
		state = 0;
		times_count = 0;
	}
}