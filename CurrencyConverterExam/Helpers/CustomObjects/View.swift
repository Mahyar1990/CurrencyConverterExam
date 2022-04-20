//
//  ViewExtension.swift
//  CurrencyConverterExam
//
//  Created by Mahyar Jananeh on 4/20/22.
//

import UIKit

class View: UIView {
    func setupMyCustomStyle() {
        setupMyCustomStyle(viewBackgroundColor: nil)
    }
    func setupMyCustomStyle(viewBackgroundColor: UIColor?) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = viewBackgroundColor ?? UIColor.white
    }
}

