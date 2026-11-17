package funkin;

import openfl.Lib;

import lime.system.System;

#if CRASH_HANDLER
import openfl.events.UncaughtErrorEvent;

import haxe.CallStack;
import haxe.io.Path;

import sys.io.Process;
import sys.io.File;
import sys.FileSystem;
#end

/**
	Used for initializing utils and loading data preferences.
**/
class Init extends MusicBeatState {
	override function create() {
		Conductor.init();
		FunkinAssets.init();
		FunkinData.init();
		Highscore.load();
		
		FlxG.sound.muteKeys = [ZERO];
		
		if (FunkinData.save.data.volume != null)
			FlxG.sound.volume = FunkinData.save.data.volume;
		if (FunkinData.save.data.mute != null)
			FlxG.sound.muted = FunkinData.save.data.mute;
			
		FlxG.autoPause = FunkinData.save.data.unfocusPause;
		
		resetFramerate();
		
		Application.current.onExit.add(function(e) {
			FunkinData.save.data.volume = FlxG.sound.volume;
		});
		
		FlxG.game.focusLostFramerate = 30;
		FlxG.signals.focusLost.add(function() {
			// Main.lostFocus.visible = true;
			FlxG.drawFramerate = 30; // lower framerate for better performace
			// trace('focus lost');
		});
		
		FlxG.signals.focusGained.add(function() {
			// Main.lostFocus.visible = false;
			resetFramerate();
			// trace('focus gained');
		});
		
		trace('commit ' + Globals.COMMIT_NUMBER + '(${Globals.COMMIT_HASH})');
		
		if (FunkinData.initialized)
			FlxG.switchState(() -> new funkin.menus.WarningState());
		else
			throw "Data failed to initialize!";
			
		super.create();
	}
	
	function resetFramerate() {
		FlxG.drawFramerate = FunkinData.save.data.maxFramerate;
		FlxG.updateFramerate = FunkinData.save.data.maxFramerate;
	}
}
