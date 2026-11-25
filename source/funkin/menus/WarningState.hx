package funkin.menus;

class WarningState extends MusicBeatState {
	var background:FlxSprite;
	var versionInfoTxt:FunkinText;
	var warningTxt:FunkinText;
	var warningTxt2:FunkinText;
	
	override function create() {
		super.create();
		
		background = new FlxSprite().loadGraphic(Paths.image('menus/menuInvert'));
		background.screenCenter();
		add(background);
		
		warningTxt = new FunkinText(0, 5, '!! WARNING !!', 64, FlxG.width, CENTER);
		warningTxt.color = FlxColor.RED;
		add(warningTxt);
		
		versionInfoTxt = new FunkinText(0, 0, '', 24, FlxG.width, CENTER);
		versionInfoTxt.y = warningTxt.y + warningTxt.height + 5;
		versionInfoTxt.text = 'Version: ${Globals.ENGINE_VERSION_STRING} | Current Commit: ${Globals.COMMIT_NUMBER}';
		add(versionInfoTxt);
		
		warningTxt2 = new FunkinText(0, 0, '', 32, FlxG.width, CENTER);
		
		warningTxt2.text += "!! THIS ENGINE IS CURRENTLY IN ACTIVE DEVELOPMENT !!\n";
		warningTxt2.text += "This engine is not suggested for use just yet!\n";
		warningTxt2.text += "EVERYTHING is subject to change.";
		
		warningTxt2.screenCenter();
		add(warningTxt2);
		
		var confirmationTxt:FunkinText = new FunkinText(0, 0, 'Press ACCEPT to proceed', 64, FlxG.width, CENTER);
		confirmationTxt.y = FlxG.height - confirmationTxt.height - 5;
		add(confirmationTxt);
	}
	
	override function update(elapsed:Float) {
		super.update(elapsed);
		
		if (controls.ACCEPT) {
			trace('going to title');
			MusicBeatState.skipTransitionIn = MusicBeatState.skipTransitionOut = false;
			FlxG.switchState(() -> new TitleState());
		}
	}
}
