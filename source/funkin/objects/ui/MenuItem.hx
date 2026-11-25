package funkin.objects.ui;

class MenuItem extends FlxSprite {
	public var acceptMenu:Void->Void = null;
	
	public var imageName:String;
	public var realName:String;
	
	public var isSelected(default, set):Bool = false;
	
	function set_isSelected(v:Bool) {
		if (v) animation.play('selected');
		else animation.play('idle');
		return v;
	}
	
	public function new(x:Float, y:Float, name:String) {
		super(x, y);
		realName = name;
		imageName = name.replace(' ', '_');
		frames = Paths.getSparrowAtlas('menus/main/' + imageName + '_menu');
		
		antialiasing = true;
		
		animation.addByPrefix('idle', 'idle', 24);
		animation.addByPrefix('selected', 'selected', 24);
		animation.play('idle');
	}
	
	override function update(elapsed:Float) {
		super.update(elapsed);
	}
}
