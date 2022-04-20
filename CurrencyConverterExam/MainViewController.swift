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
    
    let currencies = [Currency.EUR.getStringValue(), Currency.USD.getStringValue(), Currency.JPY.getStringValue()]
    
    
    // MARK: - UI Elements
    
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

