package backend.framerate;

import haxe.Timer;

import openfl.text.TextField;
import openfl.display.Sprite;
import openfl.text.TextFormat;
import openfl.system.System;

import backend.framerate.FullFPS;

class FPSCounter extends Sprite {
	public var fpsCountTxt:TextField;
	public var fpsLabelTxt:TextField;
	
	private var times:Array<Float>;
	
	public function new() {
		super();
		
		fpsCountTxt = new TextField();
		fpsLabelTxt = new TextField();
		
		for (text in [fpsCountTxt, fpsLabelTxt]) {
			text.text = "";
			text.autoSize = LEFT;
			text.multiline = false;
			addChild(text);
		}
		
		fpsCountTxt.defaultTextFormat = new TextFormat(FullFPS.fpsFont, 16, 0xFFFFFF);
		fpsLabelTxt.defaultTextFormat = new TextFormat(FullFPS.fpsFont, 14, 0xFFFFFF);
		fpsLabelTxt.text = "FPS";
		
		times = [];
	}
	
	public override function __enterFrame(delta:Float) {
		var now = Timer.stamp();
		times.push(now);
		
		while (times[0] < now - 1)
			times.shift();
			
		var curFPS:Float;
		curFPS = times.length;
		
		fpsCountTxt.text = Std.string(curFPS);
		fpsLabelTxt.x = fpsCountTxt.x + fpsCountTxt.width;
		fpsLabelTxt.y = fpsCountTxt.y + fpsCountTxt.height - fpsLabelTxt.height;
	}
}
