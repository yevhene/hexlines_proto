package core;


interface IObservable {
  function add_event_listener(name : String, handler : Dynamic -> Void) : Void;

  function trigger_event(name : String, data : Dynamic) : Void;
}
