package funkin.backend.transition;

import flixel.util.FlxGradient;

// todo: make a base state transition later
class StateTransition extends MusicBeatSubstate {
	public var transTime:Float = 1;
	public var transType:TransitionType = OUT;
	
	var gradient:FlxSprite;
	var graphic:FlxSprite;
	
	var finishCallback:Void->Void = null;
	
	public function new(?transType:TransitionType = OUT, ?finishCallback:Void->Void) {
		super();
		this.transType = transType;
		this.finishCallback ??= finishCallback;
	}
	
	override public function create() {
		super.create();
		
		transTime = transType == IN ? 0.6 : 0.4;
		
		gradient = FlxGradient.createGradientFlxSprite(FlxG.width, FlxG.height, (transType == OUT ? [0x0, FlxColor.BLACK] : [FlxColor.BLACK, 0x0]));
		graphic = new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height * 2, FlxColor.BLACK);
		add(gradient);
		add(graphic);
		
		gradient.y = -FlxG.height;
		
		if (transType == IN) {
			graphic.y = gradient.y - graphic.height;
		}
		
		FlxTween.tween(graphic, {y: FlxG.height}, transTime, {onComplete: Void -> finishTransition()});
	}
	
	override public function update(elapsed:Float) {
		super.update(elapsed);
		
		if (gradient != null && graphic != null) {
			if (transType == IN) {
				gradient.y = graphic.y + graphic.height;
			} else {
				gradient.y = graphic.y - gradient.height;
			}
		}
	}
	
	public function finishTransition() {
		gradient.destroy();
		graphic.destroy();
		if (finishCallback != null) finishCallback();
		close();
	}
}
