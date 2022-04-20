//
//  ExchangeResponse.swift
//  CurrencyConverterExam
//
//  Created by Mahyar Jananeh on 4/20/22.
//

import Foundation

struct ExchangeResponse: Decodable {
    let amount: String
    let currency: String
}

