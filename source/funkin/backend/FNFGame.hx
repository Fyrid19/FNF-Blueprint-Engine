package funkin.backend;

import flixel.FlxGame;

// mainly used for debug keybinds
class FNFGame extends FlxGame {
	override function update(delta:Float) {
		try {
			super.update(delta);
		} catch (e:Dynamic) {
			trace('Error in update: ' + e);
			Sys.exit(1);
		}
		
		debugKeys();
	}
	
	function debugKeys() {
		if (FlxG.keys.pressed.SHIFT && FlxG.keys.pressed.CONTROL && FlxG.keys.justPressed.R) {
			FlxG.resetGame();
			trace('reset');
		}
		
		if (FlxG.keys.pressed.CONTROL && FlxG.keys.justPressed.F) {
			FlxG.fullscreen = !FlxG.fullscreen;
			trace('fullscreen ' + FlxG.fullscreen);
		}
		
		// if (FlxG.keys.justPressed.E) FunkinUtil.forceCrash('testing');
	}
}
