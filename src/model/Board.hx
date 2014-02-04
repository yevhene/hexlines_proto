package model;

import model.Tile;
import model.Ball;
import model.Color;


class Board {

  private var tiles (get, null) : Array<Tile>;
  private var balls (get, null) : Array<Ball>;

  private var width (get, null) : Int;
  private var height (get, null) : Int;

  public function new(width : Int, height : Int) {
    this.width = width;
    this.height = height;

    tiles = [];
    balls = [];
    create_tiles();
  }

  public function spawn_ball_at(tile : Tile, color : Color) : Ball {
    var ball = new Ball(tile, color);
    balls.push(ball);
    return ball;
  }

  public function tile_at(x : Int, y : Int) : Tile {
    for (tile in tiles) {
      if (tile.x == x && tile.y == y) {
        return tile;
      }
    }
    return null;
  }

  public function ball_at(tile : Tile) : Ball {
    for (ball in balls) {
      if (ball.tile == tile) {
        return ball;
      }
    }
    return null;
  }

  private function create_tiles() {
    for (i in 0...height) {
      for (j in 0...(width - height % 2)) {
        tiles.push(new Tile(j, i));
      }
    }
  }

  private function get_width() : Int {
    return width;
  }

  private function get_height() : Int {
    return height;
  }

  private function get_tiles() : Array<Tile> {
    return tiles;
  }

  private function get_balls() : Array<Ball> {
    return valls;
  }

}
