package funkin.backend.music;

import flixel.addons.ui.FlxUIState;
import flixel.addons.transition.FlxTransitionableState;

import funkin.backend.interfaces.IMusicBeat;
import funkin.backend.transition.StateTransition;

enum TransitionType {
	IN;
	OUT;
}

/**
 * FlxUIState with MusicBeat properties.
 */
class MusicBeatState extends FlxUIState implements IMusicBeat {
	public static var skipTransitionIn:Bool = false;
	public static var skipTransitionOut:Bool = false;
	
	public var curStep:Int = 0;
	public var curBeat:Int = 0;
	public var curMeasure:Int = 0;
	
	public var controls(get, never):Controls.ControlMap;
	
	var stateTransIn:Class<StateTransition> = StateTransition;
	var stateTransOut:Class<StateTransition> = StateTransition;
	
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
		
		if (!skipTransitionIn) openSubState(Type.createInstance(stateTransIn, [IN]));
	}
	
	override function update(elapsed:Float) {
		super.update(elapsed);
		
		curStep = Conductor.curStep;
		curBeat = Conductor.curBeat;
		curMeasure = Conductor.curMeasure;
	}
	
	override function startOutro(onOutroComplete:() -> Void) {
		if (!skipTransitionOut) {
			openSubState(Type.createInstance(stateTransOut, [
				OUT,
				() -> {
					Conductor.onStepHit.remove(stepHit);
					Conductor.onBeatHit.remove(beatHit);
					Conductor.onMeasureHit.remove(measureHit);
					onOutroComplete();
				}
			]));
			
			return;
		}
		super.startOutro(onOutroComplete);
	}
	
	public function stepHit() {}
	
	public function beatHit() {}
	
	public function measureHit() {}
}
