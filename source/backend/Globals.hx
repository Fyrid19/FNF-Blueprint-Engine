package backend;

class Globals {
	public static final WINDOW_TITLE:String = "Blueprint Engine";
	
	public static final ENGINE_VERSION_MAJOR:Int = 0;
	public static final ENGINE_VERSION_MINOR:Int = 1;
	public static final ENGINE_VERSION_PATCH:Int = 0;
	public static final ENGINE_VERSION_STRING:String = "v0.1.0 INDEV";
	
	public static final SAVE_PATH:String = "KayNet";
	
	public static final COMMIT_NUMBER:Int = backend.macro.CommitMacro.curCommit;
	public static final COMMIT_HASH:String = backend.macro.CommitMacro.curCommitHash;
	
	public static final CAMERA_LERP:Float = 0.04;
}
