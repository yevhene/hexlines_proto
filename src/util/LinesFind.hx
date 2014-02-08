package util;

import model.Board;
import model.Ball;
import model.Tile;


class LinesFind {

  private var BALLS_IN_LINE = 5;

  private var balls_in_lines : Array<Ball>;
  private var board : Board;

  public function new(board : Board) {
    this.board = board;
  }

  public function run() : Array<Ball> {
    var balls : Array<Ball> = [];
    for (ball in board.balls) {
      if (check_line_for(ball)) {
        balls.push(ball);
      }
    }
    return balls;
  }

  private function check_line_for(ball : Ball) : Bool {
    return check_vertical_line_for(ball) || check_ascending_diagonal_line_for(ball) || check_descending_diagonal_line_for(ball);
  }

  private function check_vertical_line_for(ball : Ball) : Bool {
    var x = ball.x;
    var y = ball.y;
    var up_count = -1;
    var b = null;
    do {
      up_count += 1;
      y -= 2;
      b = board.ball_at(x, y);
    } while (b != null && b.color == ball.color);

    x = ball.x;
    y = ball.y;
    var down_count = -1;
    b = null;
    do {
      down_count += 1;
      y += 2;
      b = board.ball_at(x, y);
    } while (b != null && b.color == ball.color);

    return up_count + 1 + down_count >= BALLS_IN_LINE;
  }

  private function check_ascending_diagonal_line_for(ball : Ball) : Bool {
    return false;
  }

  private function check_descending_diagonal_line_for(ball : Ball) : Bool {
    return false;
  }


}
