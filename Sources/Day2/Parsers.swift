//
//  Parsers.swift
//  Day2
//
//  Created by Rhys Morgan on 03/12/2023.
//

import Foundation
import Parsing

struct Revelation: Hashable {
  let count: Int
  let cube: Cube
}

enum Cube: String {
  case red, blue, green
}

struct RevelationParser: Parser {
  var body: some Parser<Substring, Revelation> {
    Parse {
      Digits()

      Whitespace()

      OneOf {
        Cube.red.rawValue.map { Cube.red }
        Cube.blue.rawValue.map { .blue }
        Cube.green.rawValue.map { .green }
      }
    }
    .map { count, cube in
      Revelation(count: count, cube: cube)
    }
  }
}

typealias Turn = [Revelation]

struct TurnParser: Parser {
  var body: some Parser<Substring, Turn> {
    Many {
      Whitespace()
      RevelationParser()
    } separator: {
      ","
    }
  }
}

struct Game: Equatable {
  let id: Int
  let turns: [Turn]
}

struct GameParser: Parser {
  var body: some Parser<Substring, Game> {
    Parse {
      Skip {
        "Game "
      }

      Digits()

      Skip {
        ": "
      }

      Many {
        TurnParser()
      } separator: {
        ";"
      }
    }
    .map(Game.init)
  }
}

struct GamesParser: Parser {
  var body: some Parser<Substring, [Game]> {
    Many {
      GameParser()
    } separator: {
      Whitespace()
    }

    Skip {
      Optionally {
        Whitespace()
      }
    }
  }
}
