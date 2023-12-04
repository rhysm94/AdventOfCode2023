//
//  ParserTests.swift
//  Day2Tests
//
//  Created by Rhys Morgan on 03/12/2023.
//

import XCTest
@testable import Day2

final class ParserTests: XCTestCase {
  func testSimpleRevelationParser() throws {
    let expected = Revelation(count: 5, cube: .red)
    let actual = try RevelationParser().parse("5 red")

    XCTAssertEqual(actual, expected)
  }

  func testLargeNumberRevelationParser() throws {
    let expected = Revelation(count: 1_000_000, cube: .green)
    let actual = try RevelationParser().parse("1000000 green")

    XCTAssertEqual(actual, expected)
  }

  func testTurnParser() throws {
    let expected = [
      Revelation(count: 5, cube: .red),
      Revelation(count: 10, cube: .green),
      Revelation(count: 40, cube: .blue)
    ]

    let actual = try TurnParser().parse("5 red, 10 green, 40 blue")

    XCTAssertEqual(actual, expected)
  }

  func testTurnParser_LeadingWhitespace() throws {
    let expected = [
      Revelation(count: 10, cube: .green),
      Revelation(count: 1, cube: .blue),
      Revelation(count: 90, cube: .red)
    ]

    let actual = try TurnParser().parse(" 10 green, 1 blue, 90 red")

    XCTAssertEqual(actual, expected)
  }

  func testGameParser() throws {
    let expected = Game(
      id: 1,
      turns: [
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
    )

    let actual = try GameParser().parse("Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green")

    XCTAssertEqual(expected, actual)
  }
}
