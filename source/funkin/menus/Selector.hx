package funkin.menus; // i don't know where else to put this it can stay for now

class Selector {
	public var index:Int = 0;
	public var limit:Int = 0;
	public var selectSound:String = 'menu/scrollMenu';
	
	public function new(limit:Int, ?selectSound:String) {
		this.selectSound ??= selectSound;
		this.limit = limit;
	}
	
	public function changeIndex(i:Int, ?playSound:Bool = true) {
		if (playSound) FlxG.sound.play(Paths.sound(selectSound));
		index = FlxMath.wrap(index + i, 0, limit);
	}
}
