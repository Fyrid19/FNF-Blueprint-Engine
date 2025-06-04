package funkin.options;

import flixel.group.FlxSpriteGroup;

class OptionItem extends FlxSpriteGroup {
    var nameText:FunkinText;
    var valueText:FunkinText;

    var name:String;
    var value:String;

    public function new(x:Float, y:Float, name:String, startingValue:Dynamic) {
        super(x, y);

        nameText = new FunkinText(x, y, FlxG.width * 0.8, '', 32);
        add(nameText);

        valueText = new FunkinText(x, y, FlxG.width * 0.8, '', 32);
        add(valueText);
    }

    override function update(elapsed:Float) {
		super.update(elapsed);
    }
}