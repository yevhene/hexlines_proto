package model;

import model.Tile;
import model.Ball;
import model.Color;


class Board {

  public var tiles (get, null) : Array<Tile>;
  public var balls (get, null) : Array<Ball>;

  public var width (get, null) : Int;
  public var height (get, null) : Int;

  public function new(width : Int, height : Int) {
    this.width = width;
    this.height = height;

    tiles = [];
    balls = [];
    create_tiles();
  }

  private function tiles_without_ball() : Array<Tile> {
    var tiles_without_ball : Array<Tile> = [];
    for (tile in tiles) {
      if (ball_at(tile.x, tile.y) == null) {
        tiles_without_ball.push(tile);
      }
    }
    return tiles_without_ball;
  }

  public function spawn_ball() : Ball {
    var available_tiles = tiles_without_ball();
    var index = Std.random(available_tiles.length);
    var tile = available_tiles[index];
    var ball = new Ball();
    ball.x = tile.x;
    ball.y = tile.y;
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

  public function ball_at(x : Int, y : Int) : Ball {
    for (ball in balls) {
      if (ball.x == x && ball.y == y) {
        return ball;
      }
    }
    return null;
  }

  private function create_tiles() {
    for (i in 0...height) {
      for (j in 0...(width - i % 2)) {
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
    return balls;
  }

}
