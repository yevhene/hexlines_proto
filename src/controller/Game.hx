package controller;

import flash.display.Sprite;

import model.Board;
import model.Ball;
import model.Color;

import view.BoardView;


class Game {

  private var board : Board;

  private var main_frame : Sprite;
  private var board_view : BoardView;

  public function new(main_frame : Sprite) {
    var board = new Board(10, 10);
    var tile = board.tile_at(5, 5);
    var ball = board.spawn_ball_at(tile, Color.Red);

    board_view = new BoardView(board);

    main_frame.addChild(board_view);
  }

}
