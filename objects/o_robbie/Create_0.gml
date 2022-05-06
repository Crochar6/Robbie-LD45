hascontrol = false;
visible = false;

//State machine
enum PlayerStates{
	A,
	B,
	C,
	D
}
state = PlayerStates.A;

intro_over = false;

key_left = false;
key_right = false;
key_jump = false;
key_jump_forgiving = false;
forgive_jump_frames = 7; //the jump input is sustained n frames
forgive_jump_timer = forgive_jump_frames;forgive_jump_frames = 7; //the jump input is sustained n frames
key_down = false;
mouse_right = 0;

just_jumped = false; //If the player is in the air by having jumped
jump_frame = false; //If the player jumped this frame
jumpbuffer = 5;

grv = 0.26;

dir = 0; //-1 = left, 1 = right
hsp = 0;
vsp = 0;
hsp_frac = 0;
vsp_frac = 0;

hsp_acc = 0.1;
hsp_extra_acc = 0.3; //Extra acceleration when changing direction for better responsiveness
hsp_fric_ground = 0.07;
hsp_fric_air = 0.07;
hsp_walk = 3.3;

vsp_jump = -6.2;
vsp_blower = -10.5;
jump_stop_speed = -3.5;
vsp_max_down = 11;
vsp_max_umbrella = 1.2;
vsp_max_up = 25;

onfloor = false; //If the playier is on the floor
umbrelling = false; //If using umbrella

land_particle_number = 7;
land_particle_counter = land_particle_number;

died = false;

hascontrol = true; //If the player can move

checkpoint_set = noone; //The id of the checkpoint to set
checkpoint_min_distance = 1;
checkpoint_approach_speed = 2;
checkpoint_bugtimer_frames = 40; //Frames until the checkpoint animation is stopped
checkpoint_bugtimer = checkpoint_bugtimer_frames;

death_time = 0;

global.checkpointX = x;
global.checkpointY = y-1;
