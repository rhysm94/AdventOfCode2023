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
  turn.reduce(.zero) { partialResult, next in
    partialResult.merge(with: total(for: next))
  }
}

func minimums(for turns: [Turn]) -> Totals {
  turns.reduce(.zero) { partialResult, revelations in
    partialResult.merge(with: minimums(for: revelations))
  }
}

func power(of totals: Totals) -> Int {
  totals.red * totals.green * totals.blue
}

func part2(input: String) throws -> Int {
  let games = try GamesParser().parse(input)

  return games.lazy
    .map(\.turns)
    .map(minimums(for:))
    .map(power(of:))
    .reduce(0, +)
}
