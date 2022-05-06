if ((place_meeting(x,y,o_robbie)) and (global.checkpoint != id) and (o_robbie.vsp < 1 and o_robbie.vsp > -1)){
	o_robbie.checkpoint_set = id;
	global.checkpointX = x;
	global.checkpointY = y - 2;

	
}

if (global.checkpoint == id){
	sprite_index = s_checkpoint_on;
}
else{
	sprite_index = s_checkpoint_off;
}

