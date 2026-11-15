package funkin.game.stage;

import flixel.FlxBasic;
import flixel.math.FlxPoint;

class FunkinStage extends FlxBasic {
	public var name:String;
	public var defaultZoom:Float;
	
	public var bfPos:FlxPoint;
	public var gfPos:FlxPoint;
	public var dadPos:FlxPoint;
	public var bfCamOffset:FlxPoint;
	public var gfCamOffset:FlxPoint;
	public var dadCamOffset:FlxPoint;
	
	public var bgSprites:FlxTypedGroup<BGSprite>;
	public var stageSounds:Array<String>;
	public var soundSuffix:String;
	
	public function new() {
		bgSprites = new FlxTypedGroup<BGSprite>();
	}
	
	public function loadStageFile(stage:String) {
		var stageMeta:StageFile = FunkinAssets.getToml(Paths.stage('$stage/meta.toml'));
		
		name = stageMeta.name;
		defaultZoom = stageMeta.camera_zoom;
		
		bfPos.x = stageMeta.bf.pos[0];
		bfPos.y = stageMeta.bf.pos[1];
		gfPos.x = stageMeta.gf.pos[0];
		gfPos.y = stageMeta.gf.pos[1];
		dadPos.x = stageMeta.dad.pos[0];
		dadPos.y = stageMeta.dad.pos[1];
		
		bfCamOffset.x = stageMeta.bf.cam_offset[0];
		bfCamOffset.y = stageMeta.bf.cam_offset[1];
		gfCamOffset.x = stageMeta.gf.cam_offset[0];
		gfCamOffset.y = stageMeta.gf.cam_offset[1];
		dadCamOffset.x = stageMeta.dad.cam_offset[0];
		dadCamOffset.y = stageMeta.dad.cam_offset[1];
	}
}

typedef StageFile = {
	var name:String;
	var camera_zoom:Int;
	var bf:StageCharInfo;
	var gf:StageCharInfo;
	var dad:StageCharInfo;
}

typedef StageCharInfo = {
	var pos:Array<Int>;
	var cam_offset:Array<Int>;
}
