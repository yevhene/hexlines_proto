package model;

import core.Model;

import model.Tile;
import model.Ball;
import model.Color;

import util.PathFind;
import util.LinesFind;


class Board extends Model {

  public var tiles (get, null) : Array<Tile>;
  public var balls (get, null) : Array<Ball>;

  public var width (get, null) : Int;
  public var height (get, null) : Int;

  public function new(width : Int, height : Int) {
    super();

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
    balls.push(ball);

    trigger_event('board_ball_new', ball);

    return ball;
  }

  public function move(ball : Ball, tile : Tile) : Bool {
    if (can_move(ball, tile)) {
      ball.x = tile.x;
      ball.y = tile.y;
      trigger_event('board_ball_moved', ball);
      return true;
    }
    return false;
  }

  public function destroy_lines() : Bool {
    var balls = new LinesFind(this).run();
    var result = balls.length > 0;

    for (ball in balls) {
      trigger_event('board_ball_destroy', ball);
      this.balls.remove(ball);
    }

    return result;
  }

  public function can_move(ball : Ball, tile : Tile) {
    return new PathFind(this, tile_at(ball.x, ball.y), tile).run();
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
