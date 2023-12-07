//
//  Day3.swift
//  Day3
//
//  Created by Rhys Morgan on 04/12/2023.
//

import Foundation

let sampleData = """
467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..
"""

@main
struct Day3 {
  static func main() throws {
    guard let data = Bundle.module.url(forResource: "input", withExtension: "txt") else {
      return
    }

    let input = try String(contentsOf: data)

    let part1Result = try part1(input: input)
    print(part1Result)
  }
}
