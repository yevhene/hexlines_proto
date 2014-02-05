package controller;

import flash.display.Sprite;
import flash.Lib;

import model.Board;
import model.Ball;
import model.Color;

import view.BoardView;


class Game {

  private var board : Board;

  private var main_frame : Sprite;
  private var board_view : BoardView;

  public function new(main_frame : Sprite) {
    var board = new Board(8, 19);
    //var tile = board.tile_at(5, 5);
    //var ball = board.spawn_ball_at(tile, Color.Red);

    board_view = new BoardView(board, Lib.current.stage.stageWidth - 1, Lib.current.stage.stageHeight - 1);
    main_frame.addChild(board_view);

    board_view.add_ball_view_for(board.spawn_ball());
    board_view.add_ball_view_for(board.spawn_ball());
    board_view.add_ball_view_for(board.spawn_ball());
    board_view.add_ball_view_for(board.spawn_ball());

  }

}
