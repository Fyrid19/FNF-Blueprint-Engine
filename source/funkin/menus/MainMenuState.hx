package funkin.menus;

import flixel.effects.FlxFlicker;

class MainMenuState extends MusicBeatState {
	var engineVer = 'v' + Application.current.meta.get('version');
	var funkinVer = 'v0.2.7';
	
	var menuGrp:FlxTypedGroup<MenuItem>;
	var menuItems:Array<String> = ['Story Mode', 'Freeplay', 'Credits', 'Options'];
	
	var curSelected:Int;
	
	var bg:FlxSprite;
	
	var camPoint:FlxObject;
	var yFactor:Float;
	
	override function create() {
		bg = new FlxSprite().loadGraphic(Paths.image('menus/menuBG'));
		bg.scale.set(1.2, 1.2);
		bg.screenCenter();
		add(bg);
		
		menuGrp = new FlxTypedGroup<MenuItem>();
		add(menuGrp);
		
		var spacing = 150;
		for (i in 0...menuItems.length) {
			var item:MenuItem = new MenuItem(0, 100 + i * spacing, menuItems[i].toLowerCase());
			item.screenCenter(X);
			item.ID = i;
			menuGrp.add(item);
		}
		
		for (item in menuGrp) {
			switch (item.imageName) {
				case 'story_mode':
					item.acceptMenu = () -> {
						trace('hi');
					}
				default:
					item.acceptMenu = () -> {
						trace('acceptMenu pointer on "${item.realName}" is unset!');
					}
			}
		}
		
		var engineVerTxt:FunkinText = new FunkinText(6, FlxG.height, 'Blueprint Engine $engineVer', 12);
		var funkinVerTxt:FunkinText = new FunkinText(6, FlxG.height, 'Friday Night Funkin $funkinVer', 12);
		engineVerTxt.y -= engineVerTxt.height + funkinVerTxt.height + 4;
		funkinVerTxt.y -= funkinVerTxt.height + 4;
		add(engineVerTxt);
		add(funkinVerTxt);
		
		changeSel(0, false);
		
		camPoint = new FlxObject();
		
		super.create();
	}
	
	override function update(elapsed:Float) {
		super.update(elapsed);
		
		var sel = controls.UI_DOWN_P ? 1 : controls.UI_UP_P ? -1 : 0; // this seems stupid lowkey
		if (sel != 0) changeSel(sel);
		
		if (controls.ACCEPT) {
			var item:MenuItem = menuGrp.members[curSelected];
			FlxFlicker.flicker(item, 1, 0.1, true, true, (f:FlxFlicker) -> {
				FlxG.sound.play(Paths.sound('menu/confirmMenu'));
				item.acceptMenu();
			});
		}
	}
	
	function changeSel(index:Int, ?playSound:Bool = true) {
		if (playSound) FlxG.sound.play(Paths.sound('menu/scrollMenu'));
		curSelected = FlxMath.wrap(curSelected + index, 0, menuItems.length - 1);
		
		for (item in menuGrp) {
			item.isSelected = curSelected == item.ID;
			item.screenCenter(X);
			item.centerOffsets();
		}
	}
}
