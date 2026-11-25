package funkin.backend.framerate;

import openfl.Assets;
import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.text.TextField;
import openfl.text.TextFormat;

import funkin.backend.framerate.FPSCounter;
import funkin.backend.framerate.MemoryCounter;

class FullFPS extends Sprite {
	public static var fpsFont:String;
	
	public var backGraphic:Bitmap;
	
	public var fpsCount:FPSCounter;
	public var memCount:MemoryCounter;
	public var watermarkTxt:TextField;
	public var commitTxt:TextField;
	
	var boxWidth:Float = 300;
	var offset:Array<Float> = [6, 4];
	var boxBorder:Float = 1;
	
	public function new() {
		super();
		
		fpsFont = Assets.getFont(Paths.defaultFont).fontName;
		
		fpsCount = new FPSCounter();
		memCount = new MemoryCounter();
		watermarkTxt = new TextField();
		commitTxt = new TextField();
		
		for (text in [watermarkTxt, commitTxt]) {
			text.text = "";
			text.autoSize = LEFT;
			text.multiline = false;
			text.defaultTextFormat = new TextFormat(FullFPS.fpsFont, 12, 0xFFFFFF);
			addChild(text);
		}
		
		watermarkTxt.text = 'Blueprint Engine ${Globals.ENGINE_VERSION_STRING}';
		commitTxt.text = 'Commit ${Globals.COMMIT_NUMBER} (${Globals.COMMIT_HASH})';
		
		fpsCount.x = memCount.x = watermarkTxt.x = commitTxt.x = boxBorder; // wow
		
		fpsCount.y = boxBorder;
		memCount.y = fpsCount.y + fpsCount.height + 2;
		watermarkTxt.y = memCount.y + memCount.height + 2;
		commitTxt.y = watermarkTxt.y + watermarkTxt.height;
		
		var _bitmap:BitmapData = new BitmapData(1, 1, false, 0xFF000000);
		backGraphic = new Bitmap(_bitmap);
		backGraphic.alpha = 0.2;
		
		addChild(backGraphic);
		addChild(fpsCount);
		addChild(memCount);
		addChild(watermarkTxt);
		addChild(commitTxt);
		
		x = offset[0];
		y = offset[1];
	}
	
	public override function __enterFrame(delta:Float) {
		fpsCount.__enterFrame(delta);
		memCount.__enterFrame(delta);
		
		backGraphic.scaleX = boxWidth + (boxBorder * 2);
		backGraphic.scaleY = fpsCount.height + memCount.height + watermarkTxt.height + commitTxt.height + (boxBorder * 2);
	}
}
