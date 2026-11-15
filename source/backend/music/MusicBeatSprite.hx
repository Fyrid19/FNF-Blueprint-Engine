package backend.music;

import backend.interfaces.IMusicBeat;

class MusicBeatSprite extends FlxSprite implements IMusicBeat {
	public function new(x:Float, y:Float) {
		super(x, y);
		
		Conductor.onStepHit.add(stepHit);
		Conductor.onBeatHit.add(beatHit);
		Conductor.onMeasureHit.add(measureHit);
	}
	
	public function stepHit() {}
	
	public function beatHit() {}
	
	public function measureHit() {}
}
