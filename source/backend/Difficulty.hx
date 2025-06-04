package backend;

// just for default difficulties, keeps everything neat
class Difficulty {
    public static var defaultDiff:String = 'normal';
    public static var difficulties:Array<String> = ['easy', 'normal', 'hard'];

    /**
     * Returns a difficulty based on the default index, if it doesn't exist then returns normal
     * @param index 
     */
    public static function getDiff(index:Int, ?toUpperCase:Bool = false) {
        if (index < difficulties.length - 1 && index > 0) return difficulties[index];
        else return !toUpperCase ? defaultDiff : defaultDiff.toUpperCase();
    }

    /**
     * Returns the index of the difficulty
     * @param diff 
     */
    public static function getIndex(diff:String) {
        var index:Int = -1;
        for (i in 0...difficulties.length) {
            index++;
            if (difficulties[i] == diff) {
                return index;
            }
        }
        return -1;
    }
}