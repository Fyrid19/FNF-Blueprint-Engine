package backend.transition;

import lime.app.Future;
import lime.app.Promise;

import flixel.addons.util.FlxAsyncLoop;

import flash.media.Sound;

import openfl.utils.Assets;

class LoadingState extends MusicBeatState {
	public static function loadState(nextState:FlxState, ?showLoadingScreen:Bool) {}
}
