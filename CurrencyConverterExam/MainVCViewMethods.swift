//
//  MainVCViewMethods.swift
//  CurrencyConverterExam
//
//  Created by Mahyar Jananeh on 4/20/22.
//

import Foundation

extension MainViewController {
    
    @objc func dropSellCurrencyDownButtonDidSelected() {
        sellCurrencyDropDown.show()
    }
    
    @objc func dropRecieveCurrencyDownButtonDidSelected() {
        recieveCurrencyDropDown.show()
    }
    
    @objc func submitButtonDidSelected() {
        // call network
    }
    
}
