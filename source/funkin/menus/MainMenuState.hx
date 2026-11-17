package funkin.menus;

import flixel.effects.FlxFlicker;

class MainMenuState extends MusicBeatState {
	var engineVer = 'v' + Application.current.meta.get('version');
	var funkinVer = 'v0.2.7';
	
	var loadedMenuItems:FlxTypedGroup<MenuItem>;
	var menuItems:Array<String> = ['Story Mode', 'Freeplay', 'Credits', 'Options'];
	
	var selector:Selector;
	
	var bg:FlxSprite;
	
	override function create() {
		selector = new Selector(menuItems.length);
		
		bg = new FlxSprite().loadGraphic(Paths.image('menus/menuBG'));
		bg.scale.set(1.2);
		bg.screenCenter();
		add(bg);
		
		super.create();
	}
	
	override function update(elapsed:Float) {
		super.update(elapsed);
	}
}
