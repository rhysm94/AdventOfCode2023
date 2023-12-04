//
//  Day2.swift
//  Day2
//
//  Created by Rhys Morgan on 03/12/2023.
//

import Foundation

@main
public struct Day2 {
  static let part1Sample = """
  Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
  Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
  Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
  Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
  Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green

  """

  static func main() throws {
    guard let data = Bundle.module.url(forResource: "input", withExtension: "txt") else {
      return
    }

    let input = try String(contentsOf: data)

    let part1Result = try part1(input: input)
    print("Part 1 Result: \(part1Result)")

    let part2Result = try part2(input: input)
    print("Part 2 Result: \(part2Result)")
  }
}
