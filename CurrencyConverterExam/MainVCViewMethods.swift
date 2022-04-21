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
        if let value = sellTextField.text,
           let from = sellCurrencyButton.titleLabel?.text,
           let to = recieveCurrencyButton.titleLabel?.text {
            
            let fromCurrency = Currency.getFromString(value: from)
            let toCurrency = Currency.getFromString(value: to)
            if exchangePossibility(from: fromCurrency, amount: Double(value)!, to: toCurrency) {
                exchangeServiceCall(amount:         value,
                                    fromCurrency:   from,
                                    toCurrency:     to)
            } else {
                showAlert(alertTitle:   constants.alertFailedTitle,
                          alertMessage: nil,
                          okActionText: nil)
            }
            
        }
    }
    
    func exchangePossibility(from: Currency, amount: Double, to: Currency) -> Bool {
        
        switch (isCommissionFree, from, to) {
        case (_, .EUR, .EUR): return false
        case (_, .USD, .USD): return false
        case (_, .JPY, .JPY): return false
        
        case (true, .EUR, .USD),
             (true, .EUR, .JPY):
            return (eurAmountValue >= amount) ? true : false
            
        case (true, .USD, .EUR),
             (true, .USD, .JPY):
            return (usdAmountValue >= amount) ? true : false
            
        case (true, .JPY, .EUR),
             (true, .JPY, .USD):
            return (jpyAmountValue >= amount) ? true : false
            
        
        case (false, .EUR, .USD),
             (false, .EUR, .JPY):
            return ((eurAmountValue - (amount * 1.07)) >= 0) ? true : false
            
        case (false, .USD, .EUR),
             (false, .USD, .JPY):
            return ((usdAmountValue - (amount * 1.07)) >= 0) ? true : false
            
        case (false, .JPY, .EUR),
             (false, .JPY, .USD):
            return ((jpyAmountValue - (amount * 1.07)) >= 0) ? true : false
        }
        
    }
    
    func exchange(fromAmount: Double, from: String, toAmount: Double, to: String) {
        let fromCurrency = Currency.getFromString(value: from)
        let toCurrency = Currency.getFromString(value: to)
        commissionCount += 1
        let commisionFee = fromAmount * 0.07
        
        switch (fromCurrency) {
        case .EUR:
            eurAmountValue -=
                (isCommissionFree)
                ? (fromAmount)
                : (fromAmount + commisionFee)
            
            (toCurrency == .USD)
                ? (usdAmountValue += toAmount)
                : (jpyAmountValue += toAmount)
            
        case .USD:
            usdAmountValue -=
                (isCommissionFree)
                ? (fromAmount)
                : (fromAmount + commisionFee)
            
            (toCurrency == .EUR)
                ? (eurAmountValue += toAmount)
                : (jpyAmountValue += toAmount)
            
        case .JPY:
            jpyAmountValue -=
                (isCommissionFree)
                ? (fromAmount)
                : (fromAmount + commisionFee)
            
            (toCurrency == .EUR)
                ? (eurAmountValue += toAmount)
                : (usdAmountValue += toAmount)
        }
        
        recieveAmountValue = toAmount
    }
    
    
    func showAlert(alertTitle:   String?,
                   alertMessage: String?,
                   okActionText: String?) {
        stopIndicator()
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: okActionText ?? "Done", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
    
    
    /**
     add activity indicator to the view
     disable user interactions
     start animating the activity indicator
     */
    func startIndicator() {
        view.addSubview(activityIndicator)
        
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.widthAnchor.constraint(equalToConstant: 88).isActive = true
        activityIndicator.heightAnchor.constraint(equalToConstant: 88).isActive = true
        
        view.isUserInteractionEnabled = false
        activityIndicator.startAnimating()
    }
    
    /**
     remove activity indicator from the view
     enable user interactions
     */
    func stopIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
        view.isUserInteractionEnabled = true
    }
    
}
