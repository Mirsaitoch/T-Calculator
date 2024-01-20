//
//  ButtonType.swift
//  CalculatorTinkoff
//
//  Created by Мирсаит Сабирзянов on 20.01.2024.
//

import Foundation
import SwiftUI


enum ButtonType: Hashable, CustomStringConvertible {
    case digit(_ digit: Digit)
    case operation(_ operation: ArithmeticOperation)
    case decimal
    case equals
    case clear
    
    var description: String {
        switch self {
        case .digit(let digit):
            return digit.description
        case .operation(let operation):
            return operation.description
        case .decimal:
            return "."
        case .equals:
            return "="
        case .clear:
            return "C"
        }
    }
    
    var color: Color {
        switch self {
        case .digit(_), .decimal:
            return .secondary
        case .operation(_), .equals:
            return .blue
        case .clear:
            return .gray
        }
    }
}

enum ArithmeticOperation: CaseIterable, CustomStringConvertible {
    case addition, subtraction, multiplication, division
    
    var description: String {
        switch self {
        case .addition:
            return "+"
        case .subtraction:
            return "−"
        case .multiplication:
            return "×"
        case .division:
            return "÷"
        }
    }
}

enum Digit: Int, CaseIterable {
    case zero, one, two, three, four, five, six, seven, eight, nine
    
    var description: String {
        "\(rawValue)"
    }
}
