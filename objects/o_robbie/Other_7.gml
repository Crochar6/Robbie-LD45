switch state{
	case PlayerStates.A:
		if (sprite_index == s_AtoB){
			sprite_index = s_robbie_B_walk;
			hascontrol = true;
			state = PlayerStates.B;
		}
		break;
	case PlayerStates.B:
		if (sprite_index == s_robbie_B_jump){
			sprite_index = s_robbie_B_walk;
		}
		
		if (sprite_index == s_BtoC){
			sprite_index = s_robbie_B_walk;
			hascontrol = true;
			key_jump = true;
			state = PlayerStates.C;
		}
		
		break;
	
	case PlayerStates.C:
		if (sprite_index == s_robbie_B_open_umbrella){
			sprite_index = s_robbie_B_umbrella;
		}
		
		if (sprite_index == s_robbie_B_jump){
			sprite_index = s_robbie_B_walk;
		}
		break;
}

if sprite_index == s_robbie_checkpoint{
	//hascontrol = true;
	global.checkpoint = checkpoint_set;
	sprite_index = s_robbie_B_walk;
	y-=1;
	checkpoint_set.played_sound = false;
}