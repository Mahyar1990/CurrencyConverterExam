//
//  MainVCViewMethods.swift
//  CurrencyConverterExam
//
//  Created by Mahyar Jananeh on 4/20/22.
//

import UIKit

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
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.bottomButtonConstraint.constant -= keyboardSize.height - 18
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.bottomButtonConstraint.constant = -24
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}
