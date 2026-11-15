package funkin.menus;

import flixel.effects.FlxFlicker;

class MainMenuState extends MusicBeatState {
	var engineVer = 'v' + Application.current.meta.get('version');
	var funkinVer = 'v0.2.7';
	
	var loadedMenuItems:FlxTypedGroup<MenuItem>;
	var menuItems:Array<String> = [
		'Story Mode',
		'Freeplay',
		'Credits',
		'Options' // 'Mods'
	];
	
	var curSelected:Int;
	
	var magentaBG:FlxSprite;
	var camFollowPoint:FlxObject;
	
	var itemSize:Float = 1;
	var yFactor:Float;
	
	override function create() {
		if (!FlxG.sound.music.playing) {
			FlxG.sound.playMusic(Paths.music('freakyMenu'));
		}
		
		#if DISCORD_RPC
		DiscordRPC.changePresence({details: 'In the menus'});
		#end
		
		var bgGraphicPath:String = 'menus/menuBG';
		var magentaBgGraphicPath:String = 'menus/menuDesat';
		
		var menuBG = new FlxSprite(Paths.image(bgGraphicPath));
		menuBG.setGraphicSize(Std.int(menuBG.width * 1.2));
		menuBG.scrollFactor.set(0, yFactor);
		menuBG.updateHitbox();
		menuBG.screenCenter();
		menuBG.antialiasing = true;
		menuBG.color = 0xF5CF3B;
		add(menuBG);
		
		camFollowPoint = new FlxObject(0, 0, 1, 1);
		add(camFollowPoint);
		
		magentaBG = new FlxSprite(Paths.image(magentaBgGraphicPath));
		magentaBG.setGraphicSize(Std.int(menuBG.width));
		magentaBG.scrollFactor.set(0, yFactor);
		magentaBG.updateHitbox();
		magentaBG.screenCenter();
		magentaBG.antialiasing = true;
		magentaBG.color = 0xfd719b;
		magentaBG.visible = false;
		add(magentaBG);
		
		var offset:Array<Float> = [2, 2];
		
		var funkinVerText:FunkinText = new FunkinText(0, 0, "Friday Night Funkin' " + funkinVer, 16);
		funkinVerText.scrollFactor.set();
		funkinVerText.x = offset[0];
		funkinVerText.y = FlxG.height - funkinVerText.height - offset[1];
		add(funkinVerText);
		var engineVerText:FunkinText = new FunkinText(0, 0, "Blueprint Engine " + engineVer, 16);
		engineVerText.scrollFactor.set();
		engineVerText.x = offset[0];
		engineVerText.y = funkinVerText.y - engineVerText.height - offset[1];
		add(engineVerText);
		
		loadedMenuItems = new FlxTypedGroup<MenuItem>();
		add(loadedMenuItems);
		
		for (i in 0...menuItems.length) {
			addMenuItem(menuItems[i]);
		}
		
		yFactor = (loadedMenuItems.length - 4) * 0.15;
		if (loadedMenuItems.length < 4) yFactor = 0;
		
		var itemSpacing:Float = 170;
		for (item in loadedMenuItems) {
			trace(item.realName);
			item.y = 50 + itemSpacing * item.ID;
			switch item.realName {
				case 'story mode':
					item.acceptMenu = () -> {
						FlxG.switchState(new StoryMenuState());
					}
				case 'freeplay':
					item.acceptMenu = () -> {
						FlxG.switchState(new FreeplayState());
					}
				case 'options':
					item.acceptMenu = () -> {
						// FlxG.switchState(new funkin.options.OptionsStateNew());
						trace('not yet bub');
					}
				default:
					item.acceptMenu = () -> {
						FlxG.log.add('"acceptMenu" pointer function isnt set!');
					}
			}
		}
		
		changeSelection(0, false);
		
		FlxG.camera.follow(camFollowPoint, null, 0.10);
		
		super.create();
	}
	
	override function update(elapsed:Float) {
		if (controls.UI_UP_P) {
			changeSelection(-1);
		}
		
		if (controls.UI_DOWN_P) {
			changeSelection(1);
		}
		
		if (controls.ACCEPT) {
			FlxG.sound.play(Paths.sound('menu/confirmMenu'));
			
			for (item in loadedMenuItems) {
				if (item.ID == curSelected) {
					item.acceptMenu();
				}
			}
		}
		
		super.update(elapsed);
	}
	
	var id:Int = 0;
	
	function addMenuItem(name:String) {
		var item:MenuItem;
		item = new MenuItem(0, 0, name.toLowerCase());
		item.setGraphicSize(Std.int(item.width * itemSize));
		item.scrollFactor.set(0, yFactor);
		item.screenCenter(X);
		item.ID = id;
		
		loadedMenuItems.add(item);
		id++;
	}
	
	function changeSelection(change:Int = 0, playSound:Bool = true) {
		if (playSound) FlxG.sound.play(Paths.sound('menu/scrollMenu'));
		
		curSelected += change;
		
		if (curSelected < 0)
			curSelected = menuItems.length - 1;
		if (curSelected > menuItems.length - 1)
			curSelected = 0;
			
		for (item in loadedMenuItems.members) {
			if (item.ID == curSelected)
				item.animation.play('selected');
			else
				item.animation.play('idle');
				
			item.centerOffsets();
			item.screenCenter(X);
			
			camFollowPoint.setPosition(item.getGraphicMidpoint().x, item.getGraphicMidpoint().y);
		}
	}
}
