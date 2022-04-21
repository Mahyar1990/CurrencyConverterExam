//
//  SERVICES_PATH.swift
//  CurrencyConverterExam
//
//  Created by Mahyar Jananeh on 4/20/22.
//

import Foundation

enum SERVICES_PATH {
    case exchange
    case latest
    
    func getStringValue() -> String {
        switch self {
        case .exchange: return "/currency/commercial/exchange"
        case .latest:   return "/latest"
        }
    }
}

