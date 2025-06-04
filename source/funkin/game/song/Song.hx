package funkin.game.song;

import funkin.game.notes.Note;

import lime.utils.Assets;

typedef SongData = {
	var song:String;
	var notes:Array<Note>;
	var events:Array<Note>; // wip
	var bpm:Float;

    var stage:String;
	var needsVoices:Bool;
	var speed:Float;

	var players:Array<String>;
	var validScore:Bool;
}

class Song {
    public var song:String;
	public var bpm:Float;

    public var stage:String;
	public var needsVoices:Bool;
	public var speed:Float;

	public var players:Array<String>;
	public var validScore:Bool;

    public var data:SongData;

    public function loadSong(songName:String, difficulty:String, ?subFolder:String = '') {
        data = getSongData(Paths.chart(songName, difficulty, subFolder));

		song = data.song;
		bpm = data.bpm;
		
		stage = data.stage;
		needsVoices = data.needsVoices;
		speed = data.speed;

		players = data.players;
		validScore = data.validScore;
    }

	public function getSongData(path:String) {
		var rawJson = Assets.getText(path).trim();
		return haxe.Json.parse(rawJson);
	}
}