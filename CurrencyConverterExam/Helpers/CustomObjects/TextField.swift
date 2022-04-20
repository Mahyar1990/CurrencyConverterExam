//
//  TextField.swift
//  CurrencyConverterExam
//
//  Created by Mahyar Jananeh on 4/20/22.
//

import UIKit

class TextField: UITextField {
    func setupMyCustomStyle() {
        setupMyCustomStyle(textColor: nil, fontSize: nil, adjustFontSize: nil)
    }
    func setupMyCustomStyle(textColor: UIColor?) {
        setupMyCustomStyle(textColor: textColor, fontSize: nil, adjustFontSize: nil)
    }
    func setupMyCustomStyle(textColor: UIColor?,
                            fontSize: CGFloat?,
                            adjustFontSize: Bool?) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = textColor ?? UIColor.black
        self.font = UIFont.mySystemFont(ofSize: fontSize ?? 18)
        self.adjustsFontSizeToFitWidth = adjustFontSize ?? true
    }
}

