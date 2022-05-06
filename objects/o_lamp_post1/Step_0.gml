if (irandom_range(1,130) == 1){
	i = irandom_range(6,20);
}

if (i > 0){
	image_speed = 1;
}else {
	image_speed = 0;
	if (image_index < 1) and (irandom_range(0,15)==1)image_index = 1;
}
i --;
