package core;

import core.IObservable;
import core.Dispatcher;


class Model implements IObservable {
  private var dispatcher : Dispatcher;

  public function new() {
    dispatcher = new Dispatcher();
  }

  public function add_event_listener(name : String, handler : Dynamic -> Void) {
    dispatcher.add_event_listener(name, handler);
  }

  public function trigger_event(name : String, data : Dynamic) {
    dispatcher.trigger_event(name, data);
  }
}
