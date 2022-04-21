//
//  MainVCView.swift
//  CurrencyConverterExam
//
//  Created by Mahyar Jananeh on 4/20/22.
//

import UIKit
import DropDown

extension MainViewController {
    
    func setupView() {
        setupObjectsStyles()
        setupDropDownMenu()
        setupViewLayouts()
    }
    
    
    // MARK: - setup Objects Styles
    private func setupObjectsStyles() {
        setupHeadLineLables()
        setupUserPorfolioLabels()
        
        setupSellSectionElements()
        setupRecieveSectionElements()
        
        setupSubmitButton()
    }
    
    private func setupHeadLineLables() {
        myBalanceLabel.setupMyCustomStyle(textColor:        .darkGray,
                                          fontSize:         12,
                                          adjustFontSize:   true)
        myBalanceLabel.text = constants.myBalances
        
        currencyExchangeLabel.setupMyCustomStyle(textColor:         .darkGray,
                                                 fontSize:          12,
                                                 adjustFontSize:    true)
        currencyExchangeLabel.text = constants.currencyExchange
    }
    
    private func setupUserPorfolioLabels() {
        eurLabel.setupMyCustomStyle(textColor: nil, fontSize: 14, adjustFontSize: true)
        eurLabel.text = "1000.00 " + Currency.EUR.getStringValue()
        eurLabel.textAlignment = NSTextAlignment.center
        
        usdLabel.setupMyCustomStyle(textColor: nil, fontSize: 14, adjustFontSize: true)
        usdLabel.text = "0.00 " + Currency.USD.getStringValue()
        usdLabel.textAlignment = NSTextAlignment.center
        
        jpyLabel.setupMyCustomStyle(textColor: nil, fontSize: 14, adjustFontSize: true)
        jpyLabel.text = "0.00 " + Currency.JPY.getStringValue()
        jpyLabel.textAlignment = NSTextAlignment.center
    }
    
    private func setupSellSectionElements() {
        sellImageView.setupMyCustomStyle()
        sellLabel.setupMyCustomStyle(textColor: nil, fontSize: 16, adjustFontSize: true)
        sellLabel.text = constants.sell
        
        sellTextField.setupMyCustomStyle(textColor: nil, fontSize: 16, adjustFontSize: true)
        sellTextField.text = "100.00"
        sellTextField.keyboardType = UIKeyboardType.numberPad
        
        sellCurrencyButton.setupMyCustomStyle(contentMode: nil, fontSize: 16, fontColor: nil)
        sellCurrencyButton.setTitle(Currency.EUR.getStringValue(), for: .normal)
        sellCurrencyButton.setTitleColor(.black, for: .normal)
        let image = UIImage(systemName: Icons.chevronDown.getStringValue())?.withRenderingMode(.alwaysOriginal)
        image?.withTintColor(.black)
        sellCurrencyButton.setImage(image,
                                    for: .normal)
        sellCurrencyButton.semanticContentAttribute = .forceRightToLeft
        sellCurrencyButton.addTarget(self,
                                     action: #selector(dropSellCurrencyDownButtonDidSelected),
                                     for: UIControl.Event.touchUpInside)
        
        devider1.setupMyCustomStyle(viewBackgroundColor: UIColor(white: 0.8, alpha: 0.5))
    }
    
    private func setupRecieveSectionElements() {
        recieveImageView.setupMyCustomStyle()
        
        recieveLabel.setupMyCustomStyle(textColor: nil, fontSize: 16, adjustFontSize: true)
        recieveLabel.text = constants.recieve
        
        recieveAmountLabel.setupMyCustomStyle(textColor: nil, fontSize: 16, adjustFontSize: true)
        recieveAmountLabel.text = ""
        recieveAmountLabel.textColor = .green
        
        recieveCurrencyButton.setupMyCustomStyle(contentMode: nil, fontSize: 16, fontColor: nil)
        recieveCurrencyButton.setTitle(Currency.USD.getStringValue(), for: .normal)
        recieveCurrencyButton.setTitleColor(.black, for: .normal)
        let image = UIImage(systemName: Icons.chevronDown.getStringValue())?.withRenderingMode(.alwaysOriginal)
        image?.withTintColor(.black)
        recieveCurrencyButton.setImage(image,
                                    for: .normal)
        recieveCurrencyButton.semanticContentAttribute = .forceRightToLeft
        recieveCurrencyButton.addTarget(self,
                                     action: #selector(dropRecieveCurrencyDownButtonDidSelected),
                                     for: UIControl.Event.touchUpInside)
        devider2.setupMyCustomStyle(viewBackgroundColor: UIColor(white: 0.8, alpha: 0.5))
    }
    
    private func setupSubmitButton() {
        submitButton.setupMyCustomStyle()
        submitButton.backgroundColor = UIColor.systemBlue
        submitButton.setTitle(constants.submit, for: .normal)
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.layer.cornerRadius = 22
        submitButton.addTarget(self,
                               action: #selector(submitButtonDidSelected),
                               for: .touchUpInside)
    }
    
    // MARK: setup DropDown Menu
    private func setupDropDownMenu() {
        DropDown.setupDefaultAppearance()
        
        setupDropDownMenu(withDropDown: sellCurrencyDropDown, andButton: sellCurrencyButton)
        setupDropDownMenu(withDropDown: recieveCurrencyDropDown, andButton: recieveCurrencyButton)
    }
    
    private func setupDropDownMenu(withDropDown dropDown: DropDown, andButton button: Button) {
        dropDown.dataSource = currencies
        
        dropDown.dismissMode = .onTap
        dropDown.direction = .any
        
        dropDown.anchorView = button
        dropDown.bottomOffset = CGPoint(x: 0,
                                        y: button.bounds.height + 32)
        dropDown.selectionAction = { (index, item) in
            button.setTitle(item, for: .normal)
        }
    }
    
    
    
    // MARK: - setup View Layouts
    private func setupViewLayouts() {
        addMyBalanceLabelToView()
        addUserPortfolioElementsToView()
        addCurrencyExchangeLabelToView()
        addSellElementsToView()
        addRecieveElementsToView()
        addSubmitButtonToView()
    }
    
    private func addMyBalanceLabelToView() {
        view.addSubview(myBalanceLabel)
        
        myBalanceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        myBalanceLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 12).isActive = true
        myBalanceLabel.widthAnchor.constraint(equalToConstant: 198).isActive = true
        myBalanceLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    private func addUserPortfolioElementsToView() {
        view.addSubview(eurLabel)
        view.addSubview(usdLabel)
        view.addSubview(jpyLabel)
        
        let width = (view.bounds.width - (4 * 12) ) / 3
        eurLabel.topAnchor.constraint(equalTo: myBalanceLabel.bottomAnchor, constant: 8).isActive = true
        eurLabel.leftAnchor.constraint(equalTo: myBalanceLabel.leftAnchor).isActive = true
        eurLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
        eurLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        usdLabel.topAnchor.constraint(equalTo: eurLabel.topAnchor).isActive = true
        usdLabel.leftAnchor.constraint(equalTo: eurLabel.rightAnchor, constant: 12).isActive = true
        usdLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
        usdLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        jpyLabel.topAnchor.constraint(equalTo: eurLabel.topAnchor).isActive = true
        jpyLabel.leftAnchor.constraint(equalTo: usdLabel.rightAnchor, constant: 12).isActive = true
        jpyLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -12).isActive = true
        jpyLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    private func addCurrencyExchangeLabelToView() {
        view.addSubview(currencyExchangeLabel)
        
        currencyExchangeLabel.topAnchor.constraint(equalTo: eurLabel.bottomAnchor, constant: 12).isActive = true
        currencyExchangeLabel.leftAnchor.constraint(equalTo: myBalanceLabel.leftAnchor).isActive = true
        currencyExchangeLabel.widthAnchor.constraint(equalToConstant: 128).isActive = true
        currencyExchangeLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    private func addSellElementsToView() {
        view.addSubview(sellImageView)
        view.addSubview(sellLabel)
        view.addSubview(sellTextField)
        view.addSubview(sellCurrencyButton)
        view.addSubview(devider1)
        
        sellImageView.topAnchor.constraint(equalTo: currencyExchangeLabel.bottomAnchor, constant: 8).isActive = true
        sellImageView.leftAnchor.constraint(equalTo: myBalanceLabel.leftAnchor).isActive = true
        sellImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        sellImageView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        
        sellLabel.centerYAnchor.constraint(equalTo: sellImageView.centerYAnchor).isActive = true
        sellLabel.leftAnchor.constraint(equalTo: sellImageView.rightAnchor, constant: 12).isActive = true
        sellLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -12).isActive = true
        sellLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        sellCurrencyButton.centerYAnchor.constraint(equalTo: sellImageView.centerYAnchor).isActive = true
        sellCurrencyButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -12).isActive = true
        sellCurrencyButton.widthAnchor.constraint(equalToConstant: 64).isActive = true
        sellCurrencyButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        sellTextField.centerYAnchor.constraint(equalTo: sellImageView.centerYAnchor).isActive = true
        sellTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        sellTextField.rightAnchor.constraint(equalTo: sellCurrencyButton.leftAnchor, constant: -8).isActive = true
        sellTextField.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        devider1.topAnchor.constraint(equalTo: sellImageView.bottomAnchor, constant: 4).isActive = true
        devider1.leftAnchor.constraint(equalTo: sellLabel.leftAnchor).isActive = true
        devider1.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        devider1.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    private func addRecieveElementsToView() {
        view.addSubview(recieveImageView)
        view.addSubview(recieveLabel)
        view.addSubview(recieveAmountLabel)
        view.addSubview(recieveCurrencyButton)
        view.addSubview(devider2)
        
        recieveImageView.topAnchor.constraint(equalTo: devider1.bottomAnchor, constant: 4).isActive = true
        recieveImageView.leftAnchor.constraint(equalTo: sellImageView.leftAnchor).isActive = true
        recieveImageView.rightAnchor.constraint(equalTo: sellImageView.rightAnchor).isActive = true
        recieveImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        recieveLabel.centerYAnchor.constraint(equalTo: recieveImageView.centerYAnchor).isActive = true
        recieveLabel.leftAnchor.constraint(equalTo: sellLabel.leftAnchor).isActive = true
        recieveLabel.rightAnchor.constraint(equalTo: sellLabel.rightAnchor).isActive = true
        recieveLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        recieveAmountLabel.centerYAnchor.constraint(equalTo: recieveImageView.centerYAnchor).isActive = true
        recieveAmountLabel.leftAnchor.constraint(equalTo: sellTextField.leftAnchor).isActive = true
        recieveAmountLabel.rightAnchor.constraint(equalTo: sellTextField.rightAnchor).isActive = true
        recieveAmountLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        recieveCurrencyButton.centerYAnchor.constraint(equalTo: recieveImageView.centerYAnchor).isActive = true
        recieveCurrencyButton.leftAnchor.constraint(equalTo: sellCurrencyButton.leftAnchor).isActive = true
        recieveCurrencyButton.rightAnchor.constraint(equalTo: sellCurrencyButton.rightAnchor).isActive = true
        recieveCurrencyButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        devider2.topAnchor.constraint(equalTo: recieveImageView.bottomAnchor, constant: 4).isActive = true
        devider2.leftAnchor.constraint(equalTo: devider1.leftAnchor).isActive = true
        devider2.rightAnchor.constraint(equalTo: devider1.rightAnchor).isActive = true
        devider2.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    private func addSubmitButtonToView() {
        view.addSubview(submitButton)
        
        bottomButtonConstraint = submitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24)
        bottomButtonConstraint.isActive = true
        submitButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -24).isActive = true
        submitButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 24).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
}
