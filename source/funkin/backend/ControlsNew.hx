package funkin.backend;

import flixel.input.gamepad.FlxGamepadInputID;
import flixel.input.keyboard.FlxKey;

class ControlKey {
	public var P(get, null):Bool;
	public var R(get, null):Bool;
}

class ControlsNew {
	public static var keyboardMap:Map<String, Array<FlxKey>> = [
		'ui_left' => [A, LEFT],
		'ui_up' => [W, UP],
		'ui_down' => [S, DOWN],
		'ui_right' => [D, RIGHT],
		'note_left' => [A, LEFT],
		'note_up' => [W, UP],
		'note_down' => [S, DOWN],
		'note_right' => [D, RIGHT],
		'reset' => [R],
		'accept' => [ENTER],
		'back' => [ESCAPE, BACKSPACE],
		'pause' => [ENTER, ESCAPE]
	];
	
	public static var controllerMap:Map<String, Array<FlxGamepadInputID>> = [
		'ui_left' => [DPAD_LEFT, LEFT_STICK_DIGITAL_LEFT],
		'ui_up' => [DPAD_UP, LEFT_STICK_DIGITAL_UP],
		'ui_down' => [DPAD_DOWN, LEFT_STICK_DIGITAL_DOWN],
		'ui_right' => [DPAD_RIGHT, LEFT_STICK_DIGITAL_RIGHT],
		'note_left' => [X, LEFT_STICK_DIGITAL_LEFT, RIGHT_STICK_DIGITAL_LEFT],
		'note_up' => [Y, LEFT_STICK_DIGITAL_UP, RIGHT_STICK_DIGITAL_UP],
		'note_down' => [A, LEFT_STICK_DIGITAL_DOWN, RIGHT_STICK_DIGITAL_DOWN],
		'note_right' => [B, LEFT_STICK_DIGITAL_RIGHT, RIGHT_STICK_DIGITAL_RIGHT],
		'reset' => [BACK],
		'accept' => [A, START],
		'back' => [B, BACK],
		'pause' => [START]
	];
}
