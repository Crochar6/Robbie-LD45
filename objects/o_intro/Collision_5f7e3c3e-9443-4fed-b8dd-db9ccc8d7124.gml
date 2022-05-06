if (endable){
	if (point_distance(2051,543,o_robbie.x,o_robbie.y) > 1){
		o_robbie.hascontrol = false;
		hsp = sign(2051 - x) * 1
		hsp_frac = 0;
		
	}else{
		if(!started_end){
			started_end = true;
		o_robbie.visible = false;
		o_end. visible = true;
		o_end.image_speed = 1;
		visible = false;
		visible_master = false;
		o_robbie.hascontrol = false;
		o_robbie.state = PlayerStates.A;
		if (!sounded){ 
			sounded = true;
		audio_play_sound(snd_end, 1,false);
		}
		o_robbie.intro_over = false;
		}
		
	}
	
}