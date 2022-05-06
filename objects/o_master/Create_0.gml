
audio_play_sound(ambience,1,true);
audio_sound_gain(ambience, 0.3, 0);

audio_play_sound(M_1,1,true);
audio_sound_gain(M_1, 0.8, 0);
audio_play_sound(M_2,1,true);
audio_sound_gain(M_2, 0, 0);
audio_play_sound(M_3,1,true);
audio_sound_gain(M_3, 0, 0);

full = true;

global.checkpoint = noone;
global.checkpointX = 0;
global.checkpointY = 0;

global.timer = 0;
global.points = 0;

room_goto_next();


