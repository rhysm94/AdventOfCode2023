//
//  Day1.swift
//  Day1
//
//  Created by Rhys Morgan on 01/12/2023.
//

import Foundation

@main
public struct Day1 {
  static let sampleData = [
    "1abc2",
    "pqr3stu8vwx",
    "a1b2c3d4e5f",
    "treb7uchet"
  ]

  static func main() throws {
    guard let data = Bundle.module.url(forResource: "input", withExtension: "txt") else {
      return
    }

    let input = try String(contentsOf: data)
      .split { $0.isWhitespace }

    let part1Results = part1(calibrationValues: input)
    print("Part 1 results: \(part1Results)")
  }
}

