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

func part1(input: String) throws -> Int {
  let split = input.split(separator: "\n").map(String.init)
  let data = zip(split.indices, split)
  let numberOccurrences = data.flatMap(numberOccurrences)

  var partNumbers: [Int] = []
  for numberOccurrence in numberOccurrences {
    let line = split[numberOccurrence.line]

    let indexBefore = line.index(numberOccurrence.startIndex, offsetBy: -1, limitedBy: line.startIndex) ?? numberOccurrence.startIndex
    let indexAfter = line.index(numberOccurrence.endIndex, offsetBy: 1, limitedBy: line.endIndex) ?? numberOccurrence.endIndex

    let range = indexBefore ..< indexAfter

    if line[range].contains(where: \.isDay3Symbol) {
      partNumbers.append(numberOccurrence.number)
      continue
    }

    if let splitBefore = split.index(numberOccurrence.line, offsetBy: -1, limitedBy: split.startIndex) {
      if split[splitBefore][range].contains(where: \.isDay3Symbol) {
        partNumbers.append(numberOccurrence.number)
        continue
      }
    }

    if let splitAfter = split.index(numberOccurrence.line, offsetBy: 1, limitedBy: split.endIndex) {
      guard split.indices.contains(splitAfter) else {
        continue
      }

      guard !split.isEmpty else { break }
      if split[splitAfter][range].contains(where: \.isDay3Symbol) {
        partNumbers.append(numberOccurrence.number)
        continue
      }
    }
  }
  
  return partNumbers.reduce(0, +)
}

extension Character {
  var isDay3Symbol: Bool {
    !self.isNumber && !self.isLetter && self != "."
  }
}
