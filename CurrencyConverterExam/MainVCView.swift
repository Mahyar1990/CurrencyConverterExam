//
//  MainVCView.swift
//  CurrencyConverterExam
//
//  Created by Mahyar Jananeh on 4/20/22.
//

import UIKit

extension MainViewController {
    
    func setupView() {
        setupObjectsStyles()
    }
    
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
        let image = UIImage(systemName: "chevron.down")?.withRenderingMode(.alwaysOriginal)
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
        
        recieveCurrencyButton.setupMyCustomStyle(contentMode: nil, fontSize: 16, fontColor: nil)
        recieveCurrencyButton.setTitle(Currency.USD.getStringValue(), for: .normal)
        recieveCurrencyButton.setTitleColor(.black, for: .normal)
        let image = UIImage(systemName: "chevron.down")?.withRenderingMode(.alwaysOriginal)
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
    
    
}
