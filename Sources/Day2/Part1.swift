//
//  Part1.swift
//  Day2
//
//  Created by Rhys Morgan on 03/12/2023.
//

import Foundation

struct Totals: Equatable {
  var red: Int = 0
  var green: Int = 0
  var blue: Int = 0
}

func revelationCounts(_ revelations: Turn, cube: Cube) -> Int {
  revelations.lazy
    .filter { $0.cube == cube }
    .reduce(0) { $0 + $1.count }
}

func totals(_ input: [Turn]) -> Totals {
  input
    .reduce(into: Totals()) { acc, revelations in
      acc.red += revelationCounts(revelations, cube: .red)
      acc.green += revelationCounts(revelations, cube: .green)
      acc.blue += revelationCounts(revelations, cube: .blue)
    }
}

func isGameValid(turns: [Turn], maximum: Totals) -> Bool {
  let totals = totals(turns)
  let redValid = totals.red <= maximum.red
  let greenValid = totals.green <= maximum.green
  let blueValid = totals.blue <= maximum.blue
  return redValid && greenValid && blueValid
}
