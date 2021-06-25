//
//  PizzaBotCallengeTests.swift
//  PizzaBotCallengeTests
//
//  Created by Andrés Rodríguez on 24/06/21.
//

import XCTest
@testable import PizzaBotChallenge

class DeliveryInfoTests: XCTestCase {

    let deliveryInfo = DeliveryInfo()

    func testValidInput() {
        let validStrings = "5x5 (1, 2) (2,3) (3,4)"
        XCTAssertNotNil(try deliveryInfo.getDeliveryInfo(from: validStrings))
    }

    func testNoGridSizeInputString() {
        let noGridSizeString = "(1,2)(2,3)(3,2)"
        XCTAssertThrowsError(try deliveryInfo.getDeliveryInfo(from: noGridSizeString))
    }

    func testNoValidPairInputString() {
        let notValidPair = "5x5 (1,1)(2 2)(3,3)"
        XCTAssertThrowsError(try deliveryInfo.getDeliveryInfo(from:notValidPair))
    }

    func testNoCoordinatesInputString() {
        let notCoordinates = "2x2"
        XCTAssertThrowsError(try deliveryInfo.getDeliveryInfo(from: notCoordinates))
    }

    func testGridOverflow() {
        let overFlow = "2x2(2,1)(3,2)"
        XCTAssertThrowsError(try deliveryInfo.getDeliveryInfo(from: overFlow))
    }

    func testRandomInputStrings() {
        XCTAssertThrowsError(try deliveryInfo.getDeliveryInfo(from:"2,3(3,2"))
        XCTAssertThrowsError(try deliveryInfo.getDeliveryInfo(from:"5XT(K,2)(2,),2"))
        XCTAssertThrowsError(try deliveryInfo.getDeliveryInfo(from:"5X52,2)(2,3)2,2)"))
        XCTAssertThrowsError(try deliveryInfo.getDeliveryInfo(from:"2x2(1,2)2,3(1,2)"))
        XCTAssertThrowsError(try deliveryInfo.getDeliveryInfo(from:"-5x-4(-1,3)"))
        XCTAssertThrowsError(try deliveryInfo.getDeliveryInfo(from:"5x5(1,)(,2)"))
    }
}
