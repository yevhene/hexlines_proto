package model;

import core.Model;

import model.Ball;


class Tile extends Model {

  @:isVar
  public var ball (get, set) : Ball;

  public var x (get, null) : Int;
  public var y (get, null) : Int;

  public function new(x : Int, y : Int) {
    super();

    this.x = x;
    this.y = y;
  }

  private function get_x() : Int {
    return x;
  }

  private function get_y() : Int {
    return y;
  }

  private function get_ball() : Ball {
    return ball;
  }

  private function set_ball(ball : Ball) : Ball {
    return this.ball = ball;
  }

}
