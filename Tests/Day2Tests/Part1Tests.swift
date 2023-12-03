//
//  Part1Tests.swift
//  Day2Tests
//
//  Created by Rhys Morgan on 03/12/2023.
//

import XCTest
@testable import Day2

final class Part1Tests: XCTestCase {
  func testRevelationCounts() {
    let turns = [
      [
        Revelation(count: 3, cube: .blue),
        Revelation(count: 4, cube: .red)
      ],
      [
        Revelation(count: 1, cube: .red),
        Revelation(count: 2, cube: .green),
        Revelation(count: 6, cube: .blue)
      ],
      [
        Revelation(count: 2, cube: .green)
      ]
    ]

    let expected = Totals(red: 5, green: 4, blue: 9)
    let actual = totals(turns)

    XCTAssertEqual(actual, expected)
  }
}
