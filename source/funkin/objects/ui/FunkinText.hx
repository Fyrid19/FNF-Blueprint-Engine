package funkin.objects.ui;

class FunkinText extends FlxText {
	public function new(x:Float, y:Float, ?text:String = '', ?size:Int = 24, ?fieldWidth:Int = 0, ?align:FlxTextAlign = LEFT) {
		super(x, y, fieldWidth, text, size);
		super.setFormat(Paths.defaultFont, size, FlxColor.WHITE, align, FlxTextBorderStyle.OUTLINE_FAST, FlxColor.BLACK);
	}
}
