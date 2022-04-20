//
//  MainVCDelegates.swift
//  CurrencyConverterExam
//
//  Created by Mahyar Jananeh on 4/20/22.
//

import UIKit

extension MainViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let stringValue = textField.text,
           let value = Double(stringValue) {
            let integerValue = Int(value)
            let decimalValue = Int((value.truncatingRemainder(dividingBy: 1) * 100).rounded())
            let finalValue: Double = Double(integerValue) + (Double(decimalValue) / 100)
            cellAmountValue = finalValue
        }
    }
    
}

