//
//  Currency.swift
//  CurrencyConverterExam
//
//  Created by Mahyar Jananeh on 4/20/22.
//

import Foundation

enum Currency {
    
    case USD
    case EUR
    case JPY
    
    func getStringValue() -> String {
        switch self {
        case .USD: return "USD"
        case .EUR: return "EUR"
        case .JPY: return "JPY"
        }
    }
    
    static func getFromString(value: String) -> Currency {
        switch value {
        case "EUR": return .EUR
        case "USD": return .USD
        case "JPY": return .JPY
        default:
            return .EUR
        }
    }
}

