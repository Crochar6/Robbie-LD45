
if (checkpoint_set != global.checkpoint) and (vsp < 1 and vsp > -1){
	hascontrol = false;
	if (!visible){
		if audio_is_playing(snd_checkpoint){
			audio_stop_sound(snd_checkpoint);
		}
		sprite_index = s_robbie_B_walk;
	}
	if (point_distance(x, y, checkpoint_set.x, checkpoint_set.y) > checkpoint_min_distance){
		hsp = sign(checkpoint_set.x - x) * checkpoint_approach_speed;
		hsp_frac = 0;
		checkpoint_bugtimer --;
		if (checkpoint_bugtimer <= 0){
			hascontrol = true;
		}
	}	
	else {
		audio_sound_gain(snd_checkpoint,1,0);
		if (checkpoint_set.played_sound == false){
			audio_play_sound(snd_checkpoint,1,false);
			checkpoint_set.played_sound = true;
		}
		if vsp != 0 vsp = 0;
		hsp = 0;
		hsp_frac = 0;
		image_xscale = 1;
		checkpoint_bugtimer = checkpoint_bugtimer_frames;
		
		if (!visible){
		if audio_is_playing(snd_checkpoint){
			audio_stop_sound(snd_checkpoint);
		}
		sprite_index = s_robbie_B_walk;
		}else sprite_index = s_robbie_checkpoint;
	}
}