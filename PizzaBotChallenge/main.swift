//
//  main.swift
//  PizzaBotChallenge
//
//  Created by Andrés Rodríguez on 23/06/21.
//

import Foundation

let pizzabot = PizzaBot()

print("Please enter the grid size and coordinates with format \"WxH (X,Y)(X,Y)\": ")

if let input = readLine() {
    print("\nreading info...\n")
    print("calculating route...\n")
    print("route: \(pizzabot.getRoute(input))\n")
} else {
    print(PizzaBotError.invalidInput)
}

print("Program Finished!\n")



