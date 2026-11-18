package backend.music;

import flixel.addons.ui.FlxUIState;
import flixel.addons.transition.FlxTransitionableState;

import backend.interfaces.IMusicBeat;

/**
 * FlxTransitionableState with Music Beat properties.
 */
class MusicBeatState extends FlxUIState implements IMusicBeat {
	public var curStep:Int = 0;
	public var curBeat:Int = 0;
	public var curMeasure:Int = 0;
	
	public var controls(get, never):Controls.ControlMap;
	
	inline function get_controls():Controls.ControlMap
		return Controls.controlMap;
		
	public function new() {
		super();
	}
	
	override function create() {
		super.create();
		
		Conductor.onStepHit.add(stepHit);
		Conductor.onBeatHit.add(beatHit);
		Conductor.onMeasureHit.add(measureHit);
	}
	
	override function update(elapsed:Float) {
		super.update(elapsed);
		
		curStep = Conductor.curStep;
		curBeat = Conductor.curBeat;
		curMeasure = Conductor.curMeasure;
	}
	
	override function startOutro(onOutroComplete:() -> Void) {
		Conductor.onStepHit.remove(stepHit);
		Conductor.onBeatHit.remove(beatHit);
		Conductor.onMeasureHit.remove(measureHit);
		super.startOutro(onOutroComplete);
	}
	
	public function stepHit() {}
	
	public function beatHit() {}
	
	public function measureHit() {}
}
