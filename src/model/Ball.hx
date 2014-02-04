package model;

import model.Tile;
import model.Color;


class Ball {

  @:isVar
  public var tile (get, set) : Tile;

  public var color (get, null) : Color;

  public function new(tile : Tile, color : Color) {
    this.color = color;
    this.tile = tile;
  }

  private function get_color() : Color {
    return color;
  }

  private function get_tile() : Tile {
    return tile;
  }

  private function set_tile(tile : Tile) : Tile {
    return this.tile = tile;
  }

}
