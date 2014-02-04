package model;


class Tile {

  public var x (get, null) : Int;
  public var y (get, null) : Int;

  public function new(x : Int, y : Int) {
    this.x = x;
    this.y = y;
  }

  private function get_x() : Int {
    return x;
  }

  private function get_y() : Int {
    return y;
  }

}
