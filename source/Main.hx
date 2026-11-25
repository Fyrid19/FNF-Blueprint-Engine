package;

import funkin.backend.FNFGame;
import funkin.backend.framerate.FullFPS;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.media.Video;
import openfl.net.NetStream;

class Main extends Sprite {
	var gameWidth:Int = 1280; // Width of the game in pixels (might be less / more in actual pixels depending on your zoom).
	var gameHeight:Int = 720; // Height of the game in pixels (might be less / more in actual pixels depending on your zoom).
	var initialState:Class<flixel.FlxState> = funkin.Init; // The FlxState the game starts with.
	var zoom:Float = -1; // If -1, zoom is automatically calculated to fit the window dimensions.
	var framerate:Int = 60; // How many frames per second the game should run at.
	
	var skipSplash:Bool = true; // Whether to skip the flixel splash screen that appears in release mode.
	var startFullscreen:Bool = false; // Whether to start the game in fullscreen on desktop targets
	
	// You can pretty much ignore everything from here on - your code should go in your states.
	
	public static function main():Void {
		Lib.current.addChild(new Main());
	}
	
	public function new() {
		super();
		
		if (stage != null) {
			init();
		} else {
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
	}
	
	private function init(?E:Event):Void {
		if (hasEventListener(Event.ADDED_TO_STAGE)) {
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		setupGame();
	}
	
	var overlay:Sprite;
	
	public static var fpsCounter:FullFPS;
	
	private function setupGame():Void {
		var stageWidth:Int = Lib.current.stage.stageWidth;
		var stageHeight:Int = Lib.current.stage.stageHeight;
		
		if (zoom == -1) {
			var ratioX:Float = stageWidth / gameWidth;
			var ratioY:Float = stageHeight / gameHeight;
			zoom = Math.min(ratioX, ratioY);
			gameWidth = Math.ceil(stageWidth / zoom);
			gameHeight = Math.ceil(stageHeight / zoom);
		}
		
		addChild(new FNFGame(gameWidth, gameHeight, initialState, framerate, framerate, skipSplash, startFullscreen));
		
		// lostFocus = new FocusLost();
		// lostFocus.visible = false;
		// addChild(lostFocus);
		
		fpsCounter = new FullFPS();
		addChild(fpsCounter);
	}
}
