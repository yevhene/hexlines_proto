package;

import flash.display.Sprite;

import controller.Game;


class Main extends Sprite {

  public function new() {
    super();

    Game.init_instance(this);
  }

}
