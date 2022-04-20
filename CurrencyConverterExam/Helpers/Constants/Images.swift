//
//  Images.swift
//  CurrencyConverterExam
//
//  Created by Mahyar Jananeh on 4/20/22.
//

import Foundation

enum Icons {
    case download
    case upload
    case chevronDown
    
    func getStringValue() -> String {
        switch self {
        case .download:     return "download"
        case .upload:       return "uploading"
        case .chevronDown:  return "chevron.down"
        }
    }
}
