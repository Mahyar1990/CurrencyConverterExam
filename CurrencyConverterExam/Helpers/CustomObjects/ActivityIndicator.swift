//
//  ActivityIndicator.swift
//  CurrencyConverterExam
//
//  Created by Mahyar Jananeh on 4/20/22.
//

import UIKit
import MaterialComponents.MaterialActivityIndicator


class ActivityIndicator: MDCActivityIndicator {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    private func commonInit() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.sizeToFit()
        self.strokeWidth = 3
        self.radius = 24
        self.cycleColors = [UIColor.blue]
        
    }
    override func startAnimating() {
        super.startAnimating()
        self.backgroundColor = UIColor(white: 0.5, alpha: 0.4)
    }
    override func stopAnimating() {
        super.stopAnimating()
        self.backgroundColor = .clear
    }
}
