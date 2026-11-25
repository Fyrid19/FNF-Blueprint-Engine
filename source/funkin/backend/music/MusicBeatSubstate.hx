package funkin.backend.music;

import flixel.FlxSubState;

import funkin.backend.interfaces.IMusicBeat;

/**
 * FlxSubState with Music Beat properties.
 */
class MusicBeatSubstate extends FlxSubState implements IMusicBeat {
	public var curStep:Int = 0;
	public var curBeat:Int = 0;
	public var curMeasure:Int = 0;
	
	public var pauseState:Bool;
	
	public var controls(get, never):Controls.ControlMap;
	
	inline function get_controls():Controls.ControlMap
		return Controls.controlMap;
		
	public function new(?pauseState:Bool = false) {
		super();
		this.pauseState = pauseState;
	}
	
	override function create() {
		super.create();
		
		Conductor.onStepHit.add(stepHit);
		Conductor.onBeatHit.add(beatHit);
		Conductor.onMeasureHit.add(measureHit);
		
		if (pauseState)
			FlxG.camera.followLerp = 0;
	}
	
	override function update(elapsed:Float) {
		super.update(elapsed);
		
		curStep = Conductor.curStep;
		curBeat = Conductor.curBeat;
		curMeasure = Conductor.curMeasure;
	}
	
	override function close() {
		super.close();
		
		Conductor.onStepHit.remove(stepHit);
		Conductor.onBeatHit.remove(beatHit);
		Conductor.onMeasureHit.remove(measureHit);
		
		if (pauseState)
			FlxG.camera.followLerp = Globals.CAMERA_LERP;
	}
	
	public function stepHit() {}
	
	public function beatHit() {}
	
	public function measureHit() {}
}
