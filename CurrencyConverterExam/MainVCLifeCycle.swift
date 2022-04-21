//
//  MainVCLifeCycle.swift
//  CurrencyConverterExam
//
//  Created by Mahyar Jananeh on 4/20/22.
//

import UIKit

extension MainViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        setupNavigationBar()
        setupView()
        
        sellTextField.delegate = self
        setupKeyboardObservers()
        
        setupPortfolio()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = .systemBlue
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                                   NSAttributedString.Key.font: UIFont.myBoldSystemFont(ofSize: 16)]
        navigationItem.title = constants.currencyConverter
    }
    
    private func setupKeyboardObservers() {
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    
    private func setupPortfolio() {
        if let eurAmountValue = UserDefaults().value(forKey: userDefaultConstants.eurAmountValue) as? Double {
            self.eurAmountValue = eurAmountValue
        } else {
            let value = 1000.00
            self.eurAmountValue = value
        }
        
        if let usdAmountValue = UserDefaults().value(forKey: userDefaultConstants.usdAmountValue) as? Double {
            self.usdAmountValue = usdAmountValue
        } else {
            let value = 0.00
            self.usdAmountValue = value
        }
        
        if let jpyAmountValue = UserDefaults().value(forKey: userDefaultConstants.jpyAmountValue) as? Double {
            self.jpyAmountValue = jpyAmountValue
        } else {
            let value = 0.00
            self.jpyAmountValue = value
        }
        
        
        if let commissionCount = UserDefaults().value(forKey: userDefaultConstants.commissionCount) as? Int {
            self.commissionCount = commissionCount
        } else {
            self.commissionCount = 0
            isCommissionFree = true
        }
    }
    
    
}
