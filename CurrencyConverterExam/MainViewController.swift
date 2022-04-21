//
//  ViewController.swift
//  CurrencyConverterExam
//
//  Created by Mahyar Jananeh on 4/20/22.
//

import UIKit
import DropDown

class MainViewController: UIViewController {
    
    // global access to Constants
    let constants = Constants()
    var userDefaultConstants = UserDefaultConstants()
    
    let currencies = [Currency.EUR.getStringValue(), Currency.USD.getStringValue(), Currency.JPY.getStringValue()]
    
    
    // MARK: - Properties
    var eurAmountValue: Double = 1000.00 {
        didSet {
            UserDefaults().setValue(eurAmountValue, forKey: userDefaultConstants.eurAmountValue)
            DispatchQueue.main.async {
                self.eurLabel.text = String(format: "%.2f", self.eurAmountValue) + " " + Currency.EUR.getStringValue()
            }
        }
    }
    var usdAmountValue: Double = 0.00 {
        didSet {
            UserDefaults().setValue(usdAmountValue, forKey: userDefaultConstants.usdAmountValue)
            DispatchQueue.main.async {
                self.usdLabel.text = String(format: "%.2f", self.usdAmountValue) + " " + Currency.USD.getStringValue()
            }
        }
    }
    var jpyAmountValue: Double = 0.00 {
        didSet {
            UserDefaults().setValue(jpyAmountValue, forKey: userDefaultConstants.jpyAmountValue)
            DispatchQueue.main.async {
                self.jpyLabel.text = String(format: "%.2f", self.jpyAmountValue) + " " + Currency.JPY.getStringValue()
            }
        }
    }
    var commissionCount: Int = 0 {
        didSet {
            UserDefaults().setValue(commissionCount, forKey: userDefaultConstants.commissionCount)
            isCommissionFree = (commissionCount > 5) ? false : true
        }
    }
    var isCommissionFree: Bool = true {
        didSet {
            UserDefaults().setValue(isCommissionFree, forKey: userDefaultConstants.isCommissionFree)
        }
    }
    
    
    var sellAmountValue: Double = 100.00 {
        didSet {
            print("sellAmountValue = \(sellAmountValue)")
            DispatchQueue.main.async {
                self.sellTextField.text = String(format: "%.2f", self.sellAmountValue)
            }
        }
    }
    
    var recieveAmountValue: Double = 100.00 {
        didSet {
            print("recieveAmountValue = \(recieveAmountValue)")
            DispatchQueue.main.async {
                self.recieveAmountLabel.text = "+ " + String(format: "%.2f", self.recieveAmountValue)
            }
        }
    }
    
    
    
    
    // MARK: - UI Elements
    
    var activityIndicator = ActivityIndicator()
    
    
    // headline labels
    let myBalanceLabel = Label()
    let currencyExchangeLabel = Label()
    
    // user portfolio
    let eurLabel = Label()
    let usdLabel = Label()
    let jpyLabel = Label()
    
    // sell section ui items
    let sellImageView = ImageView(image: UIImage(named: Icons.upload.getStringValue()))
    let sellLabel = Label()
    let sellTextField = TextField()
    let sellCurrencyButton = Button()
    let sellCurrencyDropDown = DropDown()
    let devider1 = View()
    
    // reciece section ui items
    let recieveImageView = ImageView(image: UIImage(named: Icons.download.getStringValue()))
    let recieveLabel = Label()
    let recieveAmountLabel = Label()
    let recieveCurrencyButton = Button()
    let recieveCurrencyDropDown = DropDown()
    let devider2 = View()
    
    // do exchange button
    let submitButton = Button()
    
    
    
    var bottomButtonConstraint = NSLayoutConstraint()
    
}

