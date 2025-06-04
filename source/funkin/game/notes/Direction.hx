package funkin.game.notes;

// based off funkin kinda, mania support soon maybe
enum abstract Direction(Int) from Int to Int {
    var LEFT = 0;
    var DOWN = 1;
    var UP = 2;
    var RIGHT = 3;

    public function toString():String {
        return switch (this) {
            case LEFT: 'left';
            case DOWN: 'down';
            case UP: 'up';
            case RIGHT: 'right';
            default: 'unknown';
        }
    }
}