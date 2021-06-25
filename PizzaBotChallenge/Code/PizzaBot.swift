//
//  PizzaBot.swift
//  PizzaBotChallenge
//
//  Created by Andrés Rodríguez on 23/06/21.
//

import Foundation

struct PizzaBot {
    func getRoute(_ inputString: String) -> String {
        do {
            if let deliveryInfo = try DeliveryInfo().getDeliveryInfo(from: inputString) {
                var route = ""
                for i in 1..<deliveryInfo.coordinates.count {
                    route += navigate(from: deliveryInfo.coordinates[i-1], end: deliveryInfo.coordinates[i])
                }
                return route
            } else {
                throw PizzaBotError.unexpected(message: "not delivery info found")
            }
        } catch (let error){
            return error.localizedDescription
        }
    }
}

private extension PizzaBot {
    func navigate(from start: GridPoint, end: GridPoint) -> String {
        let xSteps = abs(end.x - start.x)
        let xDirection = end.x > start.x ? "E" : "W"

        let ySteps = abs(end.y - start.y)
        let yDirection = end.y > start.y ? "N" : "S"

        let route = (0..<xSteps).map { _ in xDirection } + (0..<ySteps).map { _ in yDirection }

        return route.joined() + "D"
    }
}
