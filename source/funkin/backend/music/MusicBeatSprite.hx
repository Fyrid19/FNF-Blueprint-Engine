package funkin.backend.music;

import funkin.backend.interfaces.IMusicBeat;

class MusicBeatSprite extends FlxSprite implements IMusicBeat {
	public function new(x:Float, y:Float) {
		super(x, y);
		
		Conductor.onStepHit.add(stepHit);
		Conductor.onBeatHit.add(beatHit);
		Conductor.onMeasureHit.add(measureHit);
	}
	
	override public function destroy() {
		Conductor.onStepHit.remove(stepHit);
		Conductor.onBeatHit.remove(beatHit);
		Conductor.onMeasureHit.remove(measureHit);
		super.destroy();
	}
	
	public function stepHit() {}
	
	public function beatHit() {}
	
	public function measureHit() {}
}
