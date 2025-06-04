package backend.music;

import flixel.util.FlxSignal;
import funkin.game.song.Song.SongData;

typedef SignatureChange = {
    ?numerator:Int,
    ?denominator:Int,
    ?songTime:Float
}

typedef BPMChange = {
    ?bpm:Float,
    ?stepTime:Float,
    ?songTime:Float
}

/**
 * The music backend for the game.
 */
class Conductor {
    // variables
    public static var curStep:Int = 0;
    public static var curBeat:Int = 0;
    public static var curMeasure:Int = 0;
    
    public static var stepFloat:Float = 0;
    public static var beatFloat:Float = 0;
    public static var measureFloat:Float = 0;

    public static var stepCrochet:Float;
    public static var crochet:Float;
    public static var measureCrochet:Float;

    // time signature and bpm stuff
    public static var stepsPerBeat:Float = 4;
    public static var beatsPerMeasure:Float = 4;
    public static var signatureMap:Array<SignatureChange> = [];

    public static var bpm:Float = 100;
    public static var bpmMap:Array<BPMChange> = [];

    public static var songPosition:Float = 0;
    public static var songOffset:Float = 0;

    // signals
    public static var onStepHit:FlxSignal = new FlxSignal();
    public static var onBeatHit:FlxSignal = new FlxSignal();
    public static var onMeasureHit:FlxSignal = new FlxSignal();
    public static var onBPMChange:FlxSignal = new FlxSignal();

    public static var onSongStart:FlxSignal = new FlxSignal();
    public static var onSongEnd:FlxSignal = new FlxSignal();
    
    // soon to be removed (or rather moved)
	public static var lastSongPos:Float;
	public static var safeFrames:Int = 10;
	public static var safeZoneOffset:Float = (safeFrames / 60) * 1000;
	public static var offset:Float = 0;

    public function new() {}

    private static function update() {
        var realSongTime:Float = FlxG.sound.music != null ? FlxG.sound.music.time : 0.0;
        songPosition = realSongTime + songOffset;

        var lastBPMChange:BPMChange = {
            bpm: 0,
            stepTime: 0,
            songTime: 0
        };

        for (i in 0...bpmMap.length) if (songPosition == bpmMap[i].songTime) {
            lastBPMChange = bpmMap[i];
        }

        if (lastBPMChange.bpm > 0 && lastBPMChange.bpm != bpm) changeBPM(lastBPMChange.bpm);

        stepFloat = lastBPMChange.stepTime + ((songPosition - lastBPMChange.songTime) / stepCrochet);
        beatFloat = stepFloat / stepsPerBeat;
        measureFloat = beatFloat / beatsPerMeasure;

        if (curStep != Math.floor(stepFloat)) {
            curStep = Math.floor(stepFloat);
            onStepHit.dispatch();
        }

        if (curBeat != Math.floor(beatFloat)) {
            curBeat = Math.floor(beatFloat);
            onBeatHit.dispatch();
        }

        if (curMeasure != Math.floor(measureFloat)) {
            curMeasure = Math.floor(measureFloat);
            onMeasureHit.dispatch();
        }
    }

    public static function init() {
        FlxG.signals.preUpdate.add(update);
        clearSignals();
    }

    public static function clearSignals() {
        onStepHit.removeAll();
        onBeatHit.removeAll();
        onMeasureHit.removeAll();
        onBPMChange.removeAll();
    }

    // will be here once i implement events
    public static function mapBPMChanges(song:SongData) {
		bpmMap = [];

		var curBPM:Float = song.bpm;
		var totalSteps:Int = 0;
		var totalPos:Float = 0;
		// for (i in 0...song.notes.length)
		// {
		// 	if(song.notes[i].changeBPM && song.notes[i].bpm != curBPM)
		// 	{
		// 		curBPM = song.notes[i].bpm;
		// 		var event:BPMChange = {
		// 			stepTime: totalSteps,
		// 			songTime: totalPos,
		// 			bpm: curBPM
		// 		};
		// 		bpmMap.push(event);
		// 	}

		// 	var deltaSteps:Int = song.notes[i].lengthInSteps;
		// 	totalSteps += deltaSteps;
		// 	totalPos += ((60 / curBPM) * 1000 / 4) * deltaSteps;
		// }
		trace("new BPM map BUDDY " + bpmMap);
    }

    public static function changeBPM(newBPM:Float) {
        bpm = newBPM;

        crochet = ((60 / bpm) * 1000);
        stepCrochet = crochet / stepsPerBeat;
        measureCrochet = crochet * beatsPerMeasure;

        onBPMChange.dispatch();
    }

    public static function changeTimeSignature(newStepsPerBeat:Float, newBeatsPerMeasure:Float) {
        stepsPerBeat = newStepsPerBeat;
        beatsPerMeasure = newBeatsPerMeasure;
    }
}