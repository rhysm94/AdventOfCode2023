//
//  Part1Tests.swift
//  Day2Tests
//
//  Created by Rhys Morgan on 03/12/2023.
//

import XCTest
@testable import Day2

final class Part1Tests: XCTestCase {
  private let sampleGame = Game(
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

  let sampleMaximum = Totals(red: 12, green: 13, blue: 15)

  func testRevelationCounts() {
    let expected = Totals(red: 5, green: 4, blue: 9)
    let actual = totals(sampleGame.turns)

    XCTAssertEqual(actual, expected)
  }

  func testGameValid_ExpectedValid() {
    let result = isGameValid(turns: sampleGame.turns, maximum: sampleMaximum)
    XCTAssertTrue(result)
  }

  func testGameValid_ExpectedInvalid() throws {
    let string = "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red"
    let game = try GameParser().parse(string)
    let result = isGameValid(turns: game.turns, maximum: sampleMaximum)
    XCTAssertFalse(result)
  }
}
