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
    ball_views = [];

    board.add_event_listener('board_ball_new', function(ball : Ball) {
      add_ball_view_for(ball);
    });

    board.add_event_listener('board_ball_moved', function(ball : Ball) {
      var ball_view = get_ball_view_for(ball);
      ball_view.x = screen_x(ball.x, ball.y);
      ball_view.y = screen_y(ball.x, ball.y);
    });

    board.add_event_listener('board_ball_destroy', function (ball : Ball) : Void {
      var ball_view = get_ball_view_for(ball);
      ball_views.remove(ball_view);
      removeChild(ball_view);
    });

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

  public function get_ball_view_for(ball : Ball) {
    for (ball_view in ball_views) {
      if (ball_view.ball == ball) {
        return ball_view;
      }
    }
    return null;
  }

  public function add_ball_view_for(ball : Ball) {
    var ball_view = new BallView(ball, tile_w, tile_h);
    ball_view.x = screen_x(ball.x, ball.y);
    ball_view.y = screen_y(ball.x, ball.y);
    ball_views.push(ball_view);
    addChild(ball_view);
  }

  private function get_board() : Board {
    return board;
  }

  public function set_active_ball_view_for(ball : Ball) {
    for (ball_view in ball_views) {
      ball_view.active = ball_view.ball == ball;
    }
  }

}
