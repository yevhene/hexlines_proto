package controller;

import flash.display.Sprite;
import flash.Lib;

import model.Board;
import model.Ball;
import model.Tile;
import model.Color;

import view.BoardView;

import core.Dispatcher;


class Game {

  private var dispatcher : Dispatcher;

  private var board : Board;

  private var main_frame : Sprite;
  private var board_view : BoardView;

  @:isVar
  private var active_ball (get, set) : Ball;

  private static var game : Game;

  public static function init_instance(main_view : Sprite) : Game {
    game = new Game(main_view);
    return game;
  }

  public static function get_instance() : Game {
    return game;
  }

  private function new(main_frame : Sprite) {
    dispatcher = new Dispatcher();

    board = new Board(8, 19);

    board_view = new BoardView(board, Lib.current.stage.stageWidth - 1, Lib.current.stage.stageHeight - 1);
    main_frame.addChild(board_view);

    spawn_balls(3);

    add_event_listener('ball_activation', function(ball : Ball) {
      if (active_ball == ball) {
        active_ball = null;
      } else {
        active_ball = ball;
      }
    });

    add_event_listener('tile_activation', function(tile : Tile) {
      var ball = board.ball_at(tile.x, tile.y);
      if (ball != null) {
        trigger_event('ball_activation', ball);
      } else {
        if (active_ball != null) {
          if (board.move(active_ball, tile)) {
            active_ball = null;
            if (!board.destroy_lines()) {
              spawn_balls(3);
            }
          }
        }
      }
    });
  }

  private function spawn_balls(count : Int) {
    for (i in 0...count) {
      board.spawn_ball();
    }
  }

  private function get_active_ball() : Ball {
    return active_ball;
  }

  private function set_active_ball(active_ball : Ball) : Ball {
    this.active_ball = active_ball;
    board_view.set_active_ball_view_for(this.active_ball);
    return this.active_ball;
  }

  public function add_event_listener(name : String, handler : Dynamic -> Void) {
    dispatcher.add_event_listener(name, handler);
  }

  public function trigger_event(name : String, data : Dynamic) {
    dispatcher.trigger_event(name, data);
  }

}
