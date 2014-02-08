package view;

import flash.display.Sprite;
import flash.events.MouseEvent;

import model.Ball;
import model.Color;
import controller.Game;


class BallView extends Sprite {

  public var ball (get, null) : Ball;

  @:isVar
  public var active (get, set) : Bool;

  private var w : Float;
  private var h : Float;

  public function new(ball : Ball, w : Float, h : Float) {
    super();

    this.ball = ball;
    this.w = w;
    this.h = h;

    draw();
    addEventListener(MouseEvent.CLICK, on_click);
  }

  private function draw() {
    graphics.lineStyle(3, Colors.toInt(ball.color));
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

  private function set_active(active : Bool) : Bool {
    this.active = active;
    draw();
    return this.active;
  }

  private function on_click(event) {
    Game.get_instance().trigger_event('ball_activation', ball);
  }

}
