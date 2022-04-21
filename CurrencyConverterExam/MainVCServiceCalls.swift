//
//  MainVCServiceCalls.swift
//  CurrencyConverterExam
//
//  Created by Mahyar Jananeh on 4/20/22.
//

import Foundation

extension MainViewController {
    
    func exchangeServiceCall(amount: String, fromCurrency: String, toCurrency: String) {
        
        DispatchQueue.main.async {
            self.stopIndicator()
            self.startIndicator()
        }
        
        Networking.sharedInstance.exchangeCurrency(fromCurrency: fromCurrency,
                                                   amount:      amount,
                                                   toCurrency:  toCurrency) { [weak self] (response, error) in
            guard let responseObject = response else {
                DispatchQueue.main.async {
                    self?.showAlert(alertTitle:   self?.constants.alertFailedTitle,
                                    alertMessage: "",
                                    okActionText: "OK")
                }
                
                return
            }
            self?.exchange(fromAmount:  Double(amount)!,
                           from:        fromCurrency,
                           toAmount:    Double(responseObject.amount)!,
                           to:          toCurrency)
            let title = self?.generateAlertTitle()
            let message = self?.generateAlertMessage(fromAmount:    amount,
                                                     fromCurrency:  fromCurrency,
                                                     toAmount:      responseObject.amount,
                                                     toCurrency:    responseObject.currency)
            
            DispatchQueue.main.async {
                self?.stopIndicator()
                self?.showAlert(alertTitle:   title,
                                alertMessage: message,
                                okActionText: "Done")
            }
            
        }
        
    }
    
    private func generateAlertTitle() -> String {
        let title = constants.alertAccessTitle
        return title
    }
    private func generateAlertMessage(fromAmount:   String,
                                      fromCurrency: String,
                                      toAmount:     String,
                                      toCurrency:   String) -> String {
        
        var message = constants.alertMessage
        message += " " + fromAmount
        message += " " + fromCurrency
        message += " " + "to"
        message += " " + toAmount
        message += " " + toCurrency
        message += "." + " "
        message += isCommissionFree ? constants.alertFreeCommissionFee : constants.alertCommissionFee
        
        return message
    }
    
}
