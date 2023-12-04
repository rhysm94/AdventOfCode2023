//
//  Part1.swift
//  Day2
//
//  Created by Rhys Morgan on 03/12/2023.
//

import Foundation

struct Totals: Equatable {
  var red: Int
  var green: Int
  var blue: Int

  static let zero = Self(red: 0, green: 0, blue: 0)

  func total(for cube: Cube) -> Int {
    switch cube {
    case .red: red
    case .blue: blue
    case .green: green
    }
  }
}

func revelationCounts(_ revelations: Turn, cube: Cube) -> Int {
  revelations.lazy
    .filter { $0.cube == cube }
    .reduce(0) { $0 + $1.count }
}

func isGameValid(game: Game, maximum: Totals) -> Bool {
  game.turns
    .reduce(true) { partialResult, revelations in
      partialResult && revelations.reduce(true) { partialResult, revelation in
        partialResult && revelationAllowed(revelation, maximum: maximum)
      }
    }
}

func revelationAllowed(_ revelation: Revelation, maximum: Totals) -> Bool {

  revelation.count <= maximum.total(for: revelation.cube)
}

extension Totals {
  static let possible = Totals(red: 12, green: 13, blue: 14)
}

func part1(input: String) throws -> Int {
  let games = try GamesParser().parse(input)

  return games.lazy
    .filter {
      isGameValid(game: $0, maximum: .possible)
    }
    .reduce(0, { acc, game in acc + game.id })
}
