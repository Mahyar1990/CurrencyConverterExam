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
            
            exchangeServiceCall(amount:         value,
                                fromCurrency:   from,
                                toCurrency:     to)
        }
    }
    
    
    func showAlert(alertTitle:   String?,
                   alertMessage: String?,
                   okActionText: String?) {
        stopIndicator()
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: okActionText ?? "Done", style: .default, handler: { action in
            switch action.style{
            case .default: print("default")
            case .cancel: print("cancel")
            case .destructive: print("destructive")
            }
        }))
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
