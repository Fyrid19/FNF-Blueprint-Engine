package backend.framerate;

import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;

class EngineWatermark extends Sprite {
    var watermarkTxt:TextField;
    var commitTxt:TextField;
    public function new() {
        super();

        watermarkTxt = new TextField();
        commitTxt = new TextField();

        for(text in [watermarkTxt, commitTxt]) {
			text.text = "";
			text.autoSize = LEFT;
			text.multiline = false;
            text.defaultTextFormat = new TextFormat(FullFPS.fpsFont, 10, 0xFFFFFF);
			addChild(text);
		}

        watermarkTxt.text = 'Prototype Engine ' + Globals.ENGINE_VERSION_STRING;
        commitTxt.text = 'Commit ' + Globals.COMMIT_NUMBER;
        commitTxt.y = watermarkTxt.y + watermarkTxt.height;
    }
}