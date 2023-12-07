//
//  Part1.swift
//  Day3
//
//  Created by Rhys Morgan on 04/12/2023.
//

import Foundation
import Parsing
import RegexBuilder

struct NumberOccurrence: Hashable {
  let line: Array.Index
  let startIndex: String.Index
  let endIndex: String.Index
  let number: Int
}

func numberOccurrences(line: Array.Index, in string: String) -> [NumberOccurrence] {
  let scanner = Scanner(string: string)

  var occurrences: [NumberOccurrence] = []

  while scanner.currentIndex != string.endIndex {
    _ = scanner.scanUpToCharacters(from: .decimalDigits)

    let startIndex = scanner.currentIndex
    guard let number = scanner.scanInt() else {
      break
    }

    let endIndex = scanner.currentIndex

    occurrences.append(
      NumberOccurrence(line: line, startIndex: startIndex, endIndex: endIndex, number: number)
    )
  }

  return occurrences
}

func numberOccurrences(in strings: [String]) -> [NumberOccurrence] {
  zip(strings.indices, strings).flatMap(numberOccurrences)
}

func part1(input: String) throws -> Int {
  let split = input.split(separator: "\n").drop(while: \.isEmpty).map(String.init)
  let numberOccurrences = numberOccurrences(in: split)

  return numberOccurrences.reduce(into: [Int]()) { partNumbers, next in
    let line = split[next.line]

    let indexBefore = line.index(next.startIndex, offsetBy: -1, limitedBy: line.startIndex) ?? next.startIndex
    let indexAfter = line.index(next.endIndex, offsetBy: 1, limitedBy: line.endIndex) ?? next.endIndex

    let range = indexBefore ..< indexAfter

    if line[range].contains(where: \.isDay3Symbol) {
      partNumbers.append(next.number)
      return
    }

    if let splitBefore = split.index(next.line, offsetBy: -1, limitedBy: split.startIndex) {
      if split[splitBefore][range].contains(where: \.isDay3Symbol) {
        partNumbers.append(next.number)
        return
      }
    }

    if let splitAfter = split.index(next.line, offsetBy: 1, limitedBy: split.endIndex) {
      guard split.indices.contains(splitAfter) else {
        return
      }

      if split[splitAfter][range].contains(where: \.isDay3Symbol) {
        partNumbers.append(next.number)
        return
      }
    }
  }
  .reduce(0, +)
}

extension Character {
  var isDay3Symbol: Bool {
    !self.isNumber && !self.isLetter && self != "."
  }
}
