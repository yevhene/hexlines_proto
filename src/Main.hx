package;

import flash.display.Sprite;

import controller.Game;


class Main extends Sprite {

  public function new() {
    super();

    new Game(this);
  }

}
