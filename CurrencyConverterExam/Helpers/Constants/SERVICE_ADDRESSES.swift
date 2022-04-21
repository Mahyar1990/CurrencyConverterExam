//
//  SERVICE_ADDRESSES.swift
//  CurrencyConverterExam
//
//  Created by Mahyar Jananeh on 4/20/22.
//

import Foundation

enum SERVICE_ADDRESSES {
    case address
    
    func getStringValue() -> String {
        switch self {
        case .address: return "http://api.evp.lt"
        }
    }
}

