
vsp = vsp_blower * random_range(1.1,1);
if !(o_robbie.died){
audio_sound_gain(snd_blower, random_range(5.5,6.5), 0);
audio_sound_pitch(snd_blower, random_range(1.15,0.8));
audio_play_sound(snd_blower, 4, false);
just_jumped = false;
}
