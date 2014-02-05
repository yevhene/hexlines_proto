package view;

import flash.display.Sprite;

import model.Board;
import model.Ball;

import view.TileView;


class BoardView extends Sprite {

  public var board (get, null) : Board;

  private var w : Float;
  private var h : Float;

  private var tile_w : Float;
  private var tile_h : Float;

  private var tile_views : Array<TileView>;
  private var ball_views : Array<BallView>;

  public function new(board : Board, w : Float, h : Float) {
    super();

    this.board = board;
    this.w = w;
    this.h = h;
    tile_views = [];

    init_view();
  }

  private function init_view() {
    calculate_tile_size();
    create_tile_views();
  }

  private function calculate_tile_size() {
    tile_w = this.w / (board.width + (board.width - 1) / 2);
    tile_h = this.h / (Math.floor(board.height / 2) + (1 + board.height % 2) / 2);
  }

  private function screen_x(game_x : Int, game_y : Int) : Float {
    return (tile_w * 1.5) * game_x + (tile_w * 3 / 4 * game_y % 2);
  }

  private function screen_y(game_x : Int, game_y : Int) : Float {
    return (tile_h * game_y) / 2;
  }

  private function create_tile_views() {
    for (tile in board.tiles) {
      var tile_view = new TileView(tile, tile_w, tile_h);
      tile_view.x = screen_x(tile.x, tile.y);
      tile_view.y = screen_y(tile.x, tile.y);
      tile_views.push(tile_view);
      addChild(tile_view);
    }
  }

  public function add_ball_view_for(ball : Ball) {
    var ball_view = new BallView(ball, tile_w, tile_h);
    ball_view.x = screen_x(ball.x, ball.y);
    ball_view.y = screen_y(ball.x, ball.y);
    addChild(ball_view);
  }

  private function get_board() : Board {
    return board;
  }

}
