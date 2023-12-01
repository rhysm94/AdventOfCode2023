//
//  Part1.swift
//  Day1
//
//  Created by Rhys Morgan on 01/12/2023.
//

import Foundation

public func part1(calibrationValues: some Collection<some StringProtocol>) -> Int {
  func firstNumber(from value: some Collection<Character>) -> String? {
    value.drop(while: { !$0.isNumber }).first.flatMap {
      String($0)
    }
  }

  return calibrationValues
    .reduce(0) { acc, next in
      guard
        let firstValue = firstNumber(from: next),
        let lastValue = firstNumber(from: next.reversed()),
        let number = Int("\(firstValue)\(lastValue)")
      else {
        return acc
      }

      return acc + number
    }
}
