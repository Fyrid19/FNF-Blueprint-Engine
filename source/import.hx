// importing utils and more so i dont have to put the shit in every file!!
#if !macro
#if DISCORD_RPC
import utils.DiscordRPC;
#end
import utils.FunkinUtil;
import utils.Highscore;

import funkin.game.PlayState;
import funkin.states.*;
import funkin.objects.*;
import funkin.objects.ui.*;
import funkin.objects.game.*;
import funkin.game.song.*;

import shaders.*;

import funkin.backend.Globals;
import funkin.backend.FunkinData;
import funkin.backend.Difficulty;
import funkin.backend.music.Conductor;
import funkin.backend.music.MusicBeatState;
import funkin.backend.music.MusicBeatSubstate;
import funkin.backend.assets.Paths;
import funkin.backend.assets.FunkinAssets;
import funkin.backend.transition.LoadingState;

import openfl.Lib;

import lime.app.Application;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.group.FlxGroup;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;
using Lambda;
#end
