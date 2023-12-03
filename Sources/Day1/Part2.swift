//
//  Part2.swift
//  Day1
//
//  Created by Rhys Morgan on 01/12/2023.
//

import Foundation
import RegexBuilder

let dict = [
  "one": 1,
  "two": 2,
  "three": 3,
  "four": 4,
  "five": 5,
  "six": 6,
  "seven": 7,
  "eight": 8,
  "nine": 9
]

let regex = Capture {
  ChoiceOf {
    .digit
    "one"
    "two"
    "three"
    "four"
    "five"
    "six"
    "seven"
    "eight"
    "nine"
  }
} transform: { output in
  dict[String(output)] ?? Int(output)
}

func allNumbers(from value: String) -> [Int] {
  value.indices.reduce(into: []) { partialResult, nextIndex in
    if let match = value[nextIndex ..< value.endIndex].prefixMatch(of: regex)?.output.1 {
      partialResult.append(match)
    }
  }
}

public func part2(calibrationValues: some Collection<some StringProtocol>) -> Int {
  sumCalibrationValues(
    calibrationValues
      .map { String($0) }
      .map(allNumbers)
  )
}
