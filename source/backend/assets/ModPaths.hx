package backend.assets;

class ModPaths extends Paths {
    override function getPath(key:String) {
        return Assets.exists('mods/$key') ? 'mods/$key' : super.getPath(key);
    }
}