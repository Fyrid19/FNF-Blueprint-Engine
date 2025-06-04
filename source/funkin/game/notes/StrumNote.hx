package funkin.game.notes;

import flixel.graphics.frames.FlxFrame;

class StrumNote extends FlxSprite {
    public function new(dir:Direction) {
        super();

        frames = Paths.getAtlas('NOTE_assets');

        animation.add('static', [0 + dir]);
        animation.add('pressed', [4 + dir, 8 + dir], 12, false);
        animation.add('confirm', [12 + dir, 16 + dir], 24, false);
    }
}