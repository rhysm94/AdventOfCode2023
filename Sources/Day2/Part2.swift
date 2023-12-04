//
//  Part2.swift
//  Day2
//
//  Created by Rhys Morgan on 04/12/2023.
//

import Foundation

extension Totals {
  func merge(with other: Totals) -> Self {
    Totals(
      red: max(self.red, other.red),
      green: max(self.green, other.green),
      blue: max(self.blue, other.blue)
    )
  }
}

func total(for revelation: Revelation) -> Totals {
  Totals(
    red: revelation.cube == .red ? revelation.count : 0,
    green: revelation.cube == .green ? revelation.count : 0,
    blue: revelation.cube == .blue ? revelation.count : 0
  )
}

func minimums(for turn: Turn) -> Totals {
  turn.reduce(Totals.zero) { partialResult, next in
    partialResult.merge(with: total(for: next))
  }
}

func part2(input: String) throws -> Int {
  let games = try GamesParser().parse(input)
  let minimums = games.lazy
    .map { game in
      
    }
}
