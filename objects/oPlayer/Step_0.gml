// Input {see notes.txt}
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"));
keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));
KeyActivate = keyboard_check_pressed(vk_space);
KeyAttack = keyboard_check_pressed(vk_shift);
KeyItem = keyboard_check_pressed(vk_control);

inputDirection = point_direction(0, 0, keyRight - keyLeft, keyDown - keyUp);
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0);

// Movement
hSpeed = lengthdir_x(inputMagnitude * movSpeed, inputDirection);
vSpeed = lengthdir_y(inputMagnitude * movSpeed, inputDirection);

x += hSpeed;
y += vSpeed;

// Update Sprite Index
var _oldSprite = sprite_index;
if (inputMagnitude != 0) {
	direction = inputDirection;
	sprite_index = spriteRun;
} else {
	sprite_index = spriteIdle;
}

if (_oldSprite != sprite_index) {
	localFrame = 0;
}