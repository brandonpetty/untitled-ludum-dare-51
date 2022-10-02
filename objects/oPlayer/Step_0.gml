/// @desc Core Player Logic

// player inputs
key_jump  = keyboard_check_pressed(vk_space);
key_left  = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);

// movement
var _move = key_right - key_left;

horz_speed = _move * walk_speed;

vert_speed = vert_speed + grv;

// jump
if (place_meeting(x,y+1,oWall)) && (key_jump) {
	vert_speed = -jump_speed;
}

// horizontal collison
if (place_meeting(x+horz_speed,y,oWall)) {
	while (!place_meeting(x+sign(horz_speed),y,oWall)) {
		x = x + sign(horz_speed);
	}
	horz_speed = 0; // hit collison
}

x = x + horz_speed;

// vertical collison
if (place_meeting(x,y+vert_speed,oWall)) {
	while (!place_meeting(x,y+sign(vert_speed),oWall)) {
		y = y + sign(vert_speed);
	}
	vert_speed = 0; // hit collison
}

y = y + vert_speed;