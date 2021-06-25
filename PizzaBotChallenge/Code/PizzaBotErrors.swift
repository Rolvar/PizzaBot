//
//  PizzaBotErrors.swift
//  PizzaBotChallenge
//
//  Created by Andrés Rodríguez on 25/06/21.
//

import Foundation

enum PizzaBotError: Error {
    case invalidInput
    case nonGridSize
    case nonCoordinates
    case invalidCoordinates
    case invalidGridSize
    case ambiguosGridSize
    case outOfRange
    case unexpected(message: String)
}

extension PizzaBotError: CustomStringConvertible {
    var description: String {
        switch self {
        case .invalidInput:
            return "Invalid Input"
        case .nonGridSize:
            return "Grid Size not provided"
        case .nonCoordinates:
            return "Coordinates not provided"
        case .invalidCoordinates:
            return "Not valid coordinates provided"
        case .invalidGridSize:
            return "Not valid grid size provided"
        case .ambiguosGridSize:
            return "Ambiguous grid size, please provide only 1 grid size value"
        case .outOfRange:
            return "Coordinates out of range"
        case .unexpected(let message):
            return "Unexpected error: \(message)"
        }
    }
}

extension PizzaBotError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidInput:
            return NSLocalizedString("Invalid Input", comment: "Invalid Input")
        case .nonGridSize:
            return NSLocalizedString("Grid Size not provided", comment: "Non Grid Size")
        case .nonCoordinates:
            return NSLocalizedString("Coordinates not provided", comment: "Non Coordinates")
        case .invalidCoordinates:
            return NSLocalizedString("Not valid coordinates provided", comment: "Invalid Coordinates")
        case .invalidGridSize:
            return NSLocalizedString("Not valid grid size provided", comment: "Invalid Grid Size")
        case .ambiguosGridSize:
            return NSLocalizedString("Ambiguous grid size, please provide only 1 grid size value", comment: "Ambiguous Grid Size")
        case .outOfRange:
            return NSLocalizedString("Coordinates out of range", comment: "Out of Range")
        case .unexpected(let message):
            return NSLocalizedString("Unexpected error: \(message)", comment: "Unexpected Error")
        }
    }
}
