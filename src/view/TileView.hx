package view;

import flash.display.Sprite;
import flash.events.MouseEvent;

import model.Tile;
import controller.Game;


class TileView extends Sprite {

  public var tile : Tile;

  private var w : Float;
  private var h : Float;

  public function new(tile : Tile, w : Float, h : Float) {
    super();

    this.tile = tile;
    this.w = w;
    this.h = h;

    init_view();

    addEventListener(MouseEvent.CLICK, on_click);
  }

  private function init_view() {
    graphics.lineStyle(1, 0x000000);
    graphics.beginFill(0xffffff);
    graphics.moveTo( 0        , h / 2 );
    graphics.lineTo( w / 4    , 0     );
    graphics.lineTo( w * 3 / 4, 0     );
    graphics.lineTo( w        , h / 2 );
    graphics.lineTo( w * 3 / 4, h     );
    graphics.lineTo( w / 4    , h     );
    graphics.endFill();
  }

  private function get_tile() : Tile {
    return tile;
  }

  private function on_click(event) {
    Game.get_instance().trigger_event('tile_activation', tile);
  }
}
