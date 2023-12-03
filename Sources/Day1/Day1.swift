//
//  Day1.swift
//  Day1
//
//  Created by Rhys Morgan on 01/12/2023.
//

import Foundation

@main
public struct Day1 {
  static func main() throws {
    guard let data = Bundle.module.url(forResource: "input", withExtension: "txt") else {
      return
    }

    let input = try String(contentsOf: data)
      .split { $0.isWhitespace }

    let part1Results = part1(calibrationValues: input)
    print("Part 1 results: \(part1Results)")

    let part2Results = part2(calibrationValues: input)
    print("Part 2 results: \(part2Results)")
  }
}

func sumCalibrationValues(_ calibrationValues: some Collection<[Int]>) -> Int {
  calibrationValues.reduce(0) { partialResult, next in
    guard
      let firstValue = next.first,
      let lastValue = next.last,
      let number = Int("\(firstValue)\(lastValue)")
    else {
      return partialResult
    }

    return partialResult + number
  }
}
