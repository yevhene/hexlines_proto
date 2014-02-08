package util;

import model.Board;
import model.Ball;
import model.Tile;


class PathFind {

  private var board : Board;
  private var tile_from : Tile;
  private var tile_to : Tile;
  private var passed_tiles : Array<Tile>;

  public function new(board : Board, tile_from : Tile, tile_to : Tile) {
    this.board = board;
    this.tile_from = tile_from;
    this.tile_to = tile_to;
    passed_tiles = [];
  }

  public function run() : Bool {
    return search(filtered_neighbors_for(tile_from));
  }

  private function search(tiles : Array<Tile>) : Bool {
    if (tiles.length == 0) {
      return false;
    }
    var children = new Array();
    for (t in tiles) {
      if (t == tile_to) {
        return true;
      }
      var neighbors = filtered_neighbors_for(t);
      for (n in neighbors) {
        children.push(n);
        passed_tiles.push(n);
      }
    }
    return search(children);
  }

  private function passed(tile : Tile) : Bool {
    for (t in passed_tiles) {
      if (t == tile) {
        return true;
      }
    }
    return false;
  }

  private function filtered_neighbors_for(tile : Tile) : Array<Tile> {
    var filtered_neighbors = new Array();
    for (n in neighbors_for(tile)) {
      if (n != null && !passed(n) && board.ball_at(n.x, n.y) == null) {
        filtered_neighbors.push(n);
      }
    }
    return filtered_neighbors;
  }

  private function neighbors_for(tile : Tile) : Array<Tile> {
    if (tile.y % 2 == 0) {
      return [
        board.tile_at(tile.x - 1, tile.y - 1),
        board.tile_at(tile.x    , tile.y - 2),
        board.tile_at(tile.x    , tile.y - 1),
        board.tile_at(tile.x    , tile.y + 1),
        board.tile_at(tile.x    , tile.y + 2),
        board.tile_at(tile.x - 1, tile.y + 1),
      ];
    } else {
      return [
        board.tile_at(tile.x    , tile.y - 1),
        board.tile_at(tile.x    , tile.y - 2),
        board.tile_at(tile.x + 1, tile.y - 1),
        board.tile_at(tile.x + 1, tile.y + 1),
        board.tile_at(tile.x    , tile.y + 2),
        board.tile_at(tile.x    , tile.y + 1),
      ];
    }
  }

}
