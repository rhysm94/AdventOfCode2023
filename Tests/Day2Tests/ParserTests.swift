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
}
