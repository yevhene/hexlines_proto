package model;

import core.Model;

import model.Tile;
import model.Color;


class Ball extends Model {

  @:isVar
  public var x (get, set) : Int;

  @:isVar
  public var y (get, set) : Int;

  public var color (get, null) : Color;

  public function new() {
    super();

    this.color = Colors.random();
  }

  private function get_color() : Color {
    return color;
  }

  private function get_x() : Int {
    return x;
  }

  private function set_x(x : Int) : Int {
    return this.x = x;
  }

  private function get_y() : Int {
    return y;
  }

  private function set_y(y : Int) : Int {
    return this.y = y;
  }

}
