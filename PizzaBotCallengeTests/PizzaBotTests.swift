//
//  PizzaBotTests.swift
//  PizzaBotCallengeTests
//
//  Created by Andrés Rodríguez on 24/06/21.
//

import XCTest

class PizzaBotTests: XCTestCase {

    private var pizzaBot = PizzaBot()

    func testValidInputs() {
        XCTAssertEqual(pizzaBot.getRoute("5x5(1,3)(4,4)"), "ENNNDEEEND")

        XCTAssertEqual(pizzaBot.getRoute("5x5 (0, 0) (1, 3) (4,4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3) (4, 1)"), "DENNNDEEENDSSDDWWWWSDEEENDWNDEESSD")

        XCTAssertEqual(pizzaBot.getRoute("2X2 (2, 1) (1, 2)"), "EENDWND")
    }

    func testInvalidInputs() {
        XCTAssertEqual(pizzaBot.getRoute(""), PizzaBotError.invalidInput.description)

        XCTAssertEqual(pizzaBot.getRoute("5x5"), PizzaBotError.nonCoordinates.description)

        XCTAssertEqual(pizzaBot.getRoute("(1,2)(3,2"), PizzaBotError.nonGridSize.description)

        XCTAssertEqual(pizzaBot.getRoute("5x5(1,)(,3)"), PizzaBotError.invalidCoordinates.description)

        XCTAssertEqual(pizzaBot.getRoute("x3()(0,2)"), PizzaBotError.invalidGridSize.description)

        XCTAssertEqual(pizzaBot.getRoute("2x3(-1,-3)"), PizzaBotError.invalidInput.description)

        XCTAssertEqual(pizzaBot.getRoute("3x3(4,5)(5,6)"), PizzaBotError.outOfRange.description)

        XCTAssertEqual(pizzaBot.getRoute("2x2(4,5(2,2)(3,c)"), PizzaBotError.invalidCoordinates.description)

        XCTAssertEqual(pizzaBot.getRoute("2X2 2,2"), PizzaBotError.invalidGridSize.description)
    }

}
