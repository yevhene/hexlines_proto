package model;

enum Color {
  Red;
  Green;
  Blue;
}

class Colors {
  public static function toInt(c : Color) : Int {
    return switch(c) {
      case Red: 0xaa0000;
      case Green: 0x00aa00;
      case Blue: 0x0000aa;
    }
  }

  public static function random() : Color {
    var colors = [Red, Green, Blue];
    return colors[Std.random(colors.length)];
  }
}
