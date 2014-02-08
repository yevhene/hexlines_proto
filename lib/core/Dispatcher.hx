package core;

import core.IObservable;


class Dispatcher implements IObservable {

  private var event_handlers_map : Map<String, Array<Dynamic -> Void>>;

  public function new() {
    event_handlers_map = new Map();
  }

  public function add_event_listener(name : String, handler : Dynamic -> Void) {
    var event_handlers = event_handlers_map[name];
    if (event_handlers == null) {
      event_handlers = [];
      event_handlers_map[name] = event_handlers;
    }
    event_handlers.push(handler);
  }

  public function trigger_event(name : String, data : Dynamic) {
    var event_handlers = event_handlers_map[name];
    if (event_handlers != null) {
      for (handler in event_handlers) {
        handler(data);
      }
    }
  }

}
