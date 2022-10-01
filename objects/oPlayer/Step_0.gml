/// @desc Core Player Logic

// player inputs
key_jump  = keyboard_check_pressed(vk_space);
key_left  = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);

// movement
var _move = key_right - key_left;

hsp = _move * walksp;

vsp = vsp + grv;

// jump
if (place_meeting(x,y+1,oWall)) && (key_jump) {
	vsp = -jumpsp;
}

// horizontal collison
if (place_meeting(x+hsp,y,oWall)) {
	while (!place_meeting(x+sign(hsp),y,oWall)) {
		x = x + sign(hsp);
	}
	hsp = 0; // hit collison
}

x = x + hsp;

// vertical collison
if (place_meeting(x,y+vsp,oWall)) {
	while (!place_meeting(x,y+sign(vsp),oWall)) {
		y = y + sign(vsp);
	}
	vsp = 0; // hit collison
}

y = y + vsp;