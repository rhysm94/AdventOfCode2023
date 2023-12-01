//
//  Part1.swift
//  Day1
//
//  Created by Rhys Morgan on 01/12/2023.
//

import Foundation

public func part1(calibrationValues: some Collection<some StringProtocol>) -> Int {
  func allNumbers(from value: some StringProtocol) -> [Int] {
    value.filter { $0.isNumber }.compactMap { Int(String($0)) }
  }

  return calibrationValues
    .reduce(0) { acc, next in
      let numbers = allNumbers(from: next)
      guard
        let firstValue = numbers.first,
        let lastValue = numbers.last,
        let number = Int("\(firstValue)\(lastValue)")
      else {
        return acc
      }

      return acc + number
    }
}
