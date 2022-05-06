
if (hascontrol)
{
	//Get player input
	key_left = keyboard_check(ord("A"));
	key_right = keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("W"));
	key_jump_hold = keyboard_check(vk_space) or keyboard_check(ord("W"));
	key_down = keyboard_check(ord("S"));
	mouse_right = mouse_check_button_pressed(mb_right);
	mouse_left = mouse_check_button_pressed(mb_left);
	mouse_left_hold = mouse_check_button(mb_left);
} 
else{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
	key_down = 0;
}
jumped = key_jump;

//Forgiving mechanics
if (key_jump){
	key_jump_forgiving = true;
	forgive_jump_timer = forgive_jump_frames;
}
else if (forgive_jump_timer <= 0){
	key_jump_forgiving = false;
}
forgive_jump_timer --;


//Calculate horizontal direction
dir = key_right - key_left;


//Fix checkpoint
if (sprite_index == s_robbie_checkpoint){
	hsp = 0;
	dir = 0;
	key_jump = 0;
	key_jump_hold = 0;
	key_jump_forgiving = 0;
}


//Calculate horizontal movement

if (sign(hsp) != dir) or (hsp == 0 and dir != 0){
	hsp += dir * (hsp_acc + hsp_extra_acc);
}
else hsp += dir * hsp_acc;	

if (dir == 0){
	var hsp_fric_final = hsp_fric_ground;
	if (!onfloor) hsp_fric_final = hsp_fric_air;
	hsp = Approach(hsp,0,hsp_fric_final);
}
if umbrelling{
	var hsp_umb = 2;
	hsp = clamp(hsp,-hsp_walk/hsp_umb,hsp_walk/hsp_umb);
}
else hsp = clamp(hsp,-hsp_walk,hsp_walk);


//Stop jump
if (just_jumped) and (vsp < jump_stop_speed) and (!key_jump_hold){
	vsp = jump_stop_speed;
	vsp_frac = 0;
}

//Calculate vertical movement
var grv_final = grv;
var vsp_max_final_down = vsp_max_down;


if ((state != PlayerStates.A) and (state != PlayerStates.B)) and (key_jump_hold) and (vsp > 0){
	if (vsp > vsp_max_umbrella) and (sprite_index == s_robbie_B_umbrella){
		vsp -= grv*3;
	}
	umbrelling = true;
}
else {
	vsp += grv_final;
	umbrelling = false;
}

vsp = clamp(vsp,-vsp_max_up,vsp_max_final_down);

//Ground jump	
if (jumpbuffer > 0) and (state != PlayerStates.A){
	jumpbuffer--;
	if (key_jump_forgiving){
		jumpbuffer = 0;
		vsp = vsp_jump;
		vsp_frac = 0;
	
		just_jumped = true;
		jump_frame = true;
		forgive_jump_timer = 0;
		
		audio_sound_gain(snd_jump, random_range(1.7,2.6), 0);
		audio_sound_pitch(snd_jump, random_range(1.1,0.85));
		audio_play_sound(snd_jump, 4, false);
	}
}
vsp = clamp(vsp,-vsp_max_up,vsp_max_down);


//Arm movement
if (state == PlayerStates.A){
	if (dir == 1){
		if (image_index > 3) and (image_index < 6.1){
			hsp = 0.28;
		}
		else hsp = 0;
	}
	else hsp = 0;
}
//Dump fractions and get final integrer speeds
hsp += hsp_frac;
vsp += vsp_frac;
hsp_frac = frac(hsp);
vsp_frac = frac(vsp);
hsp -= hsp_frac;
vsp -= vsp_frac;
var hsp_final = hsp;

//Death
if (death_time >= 0){
	hsp = 0;
	vsp = 0;
	visible = false;
	death_time --;
	//died = true;
}

if (intro_over){
if ((visible == false) and (death_time <=0)) or (y > 2000){
	x = global.checkpointX;
	y = global.checkpointY;
	visible = true;
	died = false;
}
}




//Horizontal collision
if(place_meeting(x+hsp_final,y,o_wall)){
	var onepixel = sign(hsp_final);
	while(!place_meeting(x+onepixel,y,o_wall)) x += onepixel;
	hsp_final = 0;
	hsp_frac = 0;
	
}


//Horizontal movement
x += hsp_final;

//Vertical collision
if(place_meeting(x,y+vsp,o_wall)){

	if (vsp  > vsp_max_down *0.80){
		ScreenShake(3*(vsp/vsp_max_down),10);
	}
	if (vsp  > vsp_max_down *0.98){
		ScreenShake(5*(vsp/vsp_max_down),15);
		PlayerDie();
	}
	if (just_jumped){
		while (land_particle_counter > 0){
			if (layer_exists("Particles")){
				instance_create_layer(x,y+other.vsp, "Particles",o_particle_land);
			}
			land_particle_counter --;
		}
		land_particle_counter = land_particle_number;
	}
	var onepixel = sign(vsp);
	while(!place_meeting(x,y+onepixel,o_wall)) y += onepixel;
	vsp = 0;
	vsp_frac = 0;
	
	just_jumped = false;
	
}

//Vertical movement
y += vsp;

//Calculate status
onfloor = place_meeting(x,y+1,o_wall);
if onfloor umbrelling = false;

if (onfloor){
	jumpbuffer = 5;
}


//Animation
if (hsp != 0){
	image_xscale = sign(hsp);
}

if (hsp != 0) and (onfloor){
	switch state{
		case PlayerStates.B:
			if (sprite_index != s_BtoC){
				sprite_index = s_robbie_B_walk;
				image_speed = 1;
			}
			break;
			
		case PlayerStates.C:
			sprite_index = s_robbie_B_walk;
			image_speed = 1;
			break;
		
	}
}


if (state == PlayerStates.A){
	if (dir == 1) or (image_index > 4){
		image_speed = 1;
	}
	else{
		image_speed = 0;
	}
}else if (state == PlayerStates.B){
	
}else if (state == PlayerStates.C){
	if (onfloor) and (sprite_index == s_robbie_B_open_umbrella or sprite_index == s_robbie_B_umbrella){
		sprite_index = s_robbie_B_walk;
	}
	if (umbrelling) and ((sprite_index != s_robbie_B_open_umbrella) and (sprite_index != s_robbie_B_umbrella)){
		sprite_index = s_robbie_B_open_umbrella;
	}
}

if ((umbrelling) and (!key_jump_hold)) or (sprite_index == s_robbie_B_umbrella and !key_jump_hold){
	umbrelling = false;
	sprite_index = s_robbie_B_walk;
}




if (jump_frame){
	if (state == PlayerStates.B){
		sprite_index = s_robbie_B_jump;
		image_speed = 1;
	}
}

if (state != PlayerStates.A){
	if (layer_exists("Particles")){
		instance_create_layer(x - 7*image_xscale,y+vsp - 14, "Particles",o_particle_smoke);
	}
}

//Not fall infinitely
if (y > 2000) PlayerDie();

//Reset variables
jump_frame = false;
