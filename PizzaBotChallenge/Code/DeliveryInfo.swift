//
//  DeliveryInfo.swift
//  PizzaBotChallenge
//
//  Created by Andrés Rodríguez on 24/06/21.
//

import Foundation

struct DeliveryInfo {
    var coordinates: [GridPoint]
    var grid: GridSize
    var isValidInput: Bool {
        return coordinates.map { $0.x <= grid.width && $0.y <= grid.height }.filter { $0 == false }.count == 0
    }
    
    init() {
        self.init(coordinates: [], grid: GridSize(width: 0, height: 0))
    }
    
    private init(coordinates: [GridPoint], grid: GridSize) {
        self.coordinates = coordinates
        self.grid = grid
    }
    
    func getDeliveryInfo(from plainText: String) throws -> DeliveryInfo? {
        if plainText.isEmpty { throw PizzaBotError.invalidInput }

        guard let splitedInput = try getSplitedInfoPairs(from: plainText),
              let gridSize = try parseGrid(from: splitedInput[0]),
              let gridPoints = try parseCoordinates(from: splitedInput)
        else { return nil }
        
        // add the start point
        var coordinates = [GridPoint(x: 0, y: 0)]
        coordinates.append(contentsOf: gridPoints)

        let info = DeliveryInfo(coordinates: coordinates, grid: gridSize)
        if !info.isValidInput {
            throw PizzaBotError.outOfRange
        }

        return info
    }
}

private extension DeliveryInfo {
    func getSplitedInfoPairs(from plainText: String) throws -> [String]? {
        // look form empty strings and clen them
        let noBlanksString = plainText.replacingOccurrences(of: " ", with: "")
        // then look for the closing ")" and replace them all
        let noClosingString = noBlanksString.replacingOccurrences(of: ")", with: "")
        // now use the opening "(" to split the string
        let splitedString = noClosingString.split(separator: "(").map(String.init)
        // validate the splited string
        if try !validateInputString(splitedString) { return nil }
        // return the array validated
        return splitedString
    }
    
    func validateInputString(_ values: [String]) throws -> Bool {
        // make sure the first input is for grid size
        let firstInputGridSize = values[0].contains("x") || values[0].contains("X")
        if !firstInputGridSize {
            throw PizzaBotError.nonGridSize
        }
        // make sure we have exact 1 grid size
        let exactOneGridSizeInput = values.filter { $0.contains("x") || $0.contains("X") }.count == 1
        if !exactOneGridSizeInput {
            throw PizzaBotError.ambiguosGridSize
        }
        // make sure we have at least one coordinate
        let atLeastOneCoordinate = values.filter { $0.contains(",") }.count > 0
        if !atLeastOneCoordinate {
            throw PizzaBotError.nonCoordinates
        }
        // make sure all values has one separator either "," or "x"
        let allPairsWithSeparator = values.map { $0.contains(",") || $0.contains("x") || $0.contains("X") }.filter { $0 == false }.count == 0
        if !allPairsWithSeparator {
            throw PizzaBotError.invalidInput
        }
        // validate non-negative values
        let nonNegative = values.filter { $0.contains("-") }.count == 0
        if !nonNegative {
            throw PizzaBotError.invalidInput
        }
        // combine these validations togeter to determine if the input is a valid one
        return firstInputGridSize && exactOneGridSizeInput && atLeastOneCoordinate && allPairsWithSeparator && nonNegative
    }
    
    func parseCoordinates(from entries: [String]) throws -> [GridPoint]? {
        let filtered = entries.filter { $0.contains(",") }
        let mapped = filtered.map { $0.split(separator: ",").map(String.init) }
        return try mapped.map { entry -> GridPoint in
            guard entry.count > 1,
                  let intX = Int(entry[0]),
                  let intY = Int(entry[1])
            else {
                throw PizzaBotError.invalidCoordinates
            }
            
            return GridPoint(x: intX, y: intY)
        }
    }
    
    func parseGrid(from plainText: String) throws -> GridSize? {
        let splited = plainText.components(separatedBy: CharacterSet.init(charactersIn: "xX"))
        guard splited.count > 1,
              let width = Int(splited[0]),
              let height = Int(splited[1])
        else {
            throw PizzaBotError.invalidGridSize
        }
        return GridSize(width: width, height: height)
    }
}
