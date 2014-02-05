package view;

import flash.display.Sprite;
import flash.events.MouseEvent;

import model.Ball;
import model.Color;


class BallView extends Sprite {

  public var ball (get, null) : Ball;

  public var active (get, null) : Bool;

  private var w : Float;
  private var h : Float;

  public function new(ball : Ball, w : Float, h : Float) {
    super();

    this.ball = ball;
    this.w = w;
    this.h = h;

    active = false;

    draw();
    addEventListener(MouseEvent.CLICK, on_click);
  }

  private function draw() {
    graphics.lineStyle(1, Colors.toInt(ball.color));
    if (active) {
      graphics.beginFill(Colors.toInt(ball.color));
    } else {
      graphics.beginFill(0xffffff);
    }
    graphics.drawCircle(w / 2, h / 2, Math.min(w, h) / 3);
    graphics.endFill();
  }

  private function get_ball() : Ball {
    return ball;
  }

  private function get_active() : Bool {
    return active;
  }

  private function on_click(event) {
    active = !active;
    draw();
  }

}
