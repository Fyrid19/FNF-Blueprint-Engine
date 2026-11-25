package funkin.backend.framerate;

import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.display.Sprite;
import openfl.system.System;

class MemoryCounter extends Sprite {
	public var memText:TextField;
	
	public function new() {
		super();
		
		memText = new TextField();
		memText.text = "MEM: 0MB - GC: 0MB";
		memText.autoSize = LEFT;
		memText.defaultTextFormat = new TextFormat(FullFPS.fpsFont, 14, 0xFFFFFF);
		addChild(memText);
	}
	
	private var memPeak:Float = 0;
	private var gcMemPeak:Float = 0;
	
	public override function __enterFrame(delta:Float) {
		var mem:Float = external.memory.Memory.getCurrentUsage();
		var gcMem:Float = cpp.vm.Gc.memInfo64(cpp.vm.Gc.MEM_INFO_USAGE);
		
		if (mem > memPeak) memPeak = mem;
		if (gcMem > gcMemPeak) gcMemPeak = gcMem;
		
		memText.text = 'MEM: ${FunkinUtil.formatMemory(mem)}' + ' - GC: ${FunkinUtil.formatMemory(gcMem)}';
	}
}
