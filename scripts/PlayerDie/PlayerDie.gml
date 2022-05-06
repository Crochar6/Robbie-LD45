/// @desc PlayerDie
with (o_robbie){
	death_time = 60 * 2;
	if (!died){
	died = true;
	audio_play_sound(snd_death,1,false);
	for (i = 0; i < 7; i ++){
		var o = i;
		with(instance_create_layer(x,y,"Particles",o_death)){
			image_index = o;
		}
	}
	}
	
}
o_gear.started = false;
if audio_is_playing(snd_gear){
	audio_stop_sound(snd_gear);
}
