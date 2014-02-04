package view;

import flash.display.Sprite;

import model.Board;


class BoardView extends Sprite {

  private var board : Board;

  public function new(board : Board) {
    super();

    this.board = board;

    graphics.lineStyle(2, 0xFF0000);
    graphics.drawRect(5, 5, 45, 35);
  }

}
