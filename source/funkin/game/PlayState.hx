package funkin.game;

import funkin.game.song.Song;

class PlayState extends MusicBeatState {
	public static var SONG:Song = null;
	public static var songDiff:String = '';
	public static var songPlaylist:Array<String> = [''];
	public static var isStoryMode:Bool = false;
	public static var storyWeek:Int = 0;
	public static var campaignScore:Int = 0;
	
	var wipText:FunkinText;
	
	var camGame:FlxCamera;
	var camHUD:FlxCamera;
	var camOther:FlxCamera;
	
	public static var instance:PlayState;
	
	public function new(song:String, storyMode:Bool = false, difficulty:Int = -1) {
		super();
		songDiff = Difficulty.getDiff(difficulty);
		SONG.loadSong(song, songDiff);
		isStoryMode = storyMode;
	}
	
	override public function create() {
		super.create();
		
		wipText = new FunkinText(0, 0, 'EXTREMELY WIP');
		wipText.x = 2;
		wipText.y = FlxG.height - wipText.height - 2;
		wipText.alpha = 0.4;
		add(wipText);
	}
	
	override public function update(elapsed:Float) {
		super.update(elapsed);
	}
}
