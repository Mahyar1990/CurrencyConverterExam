//
//  ImageViewExtension.swift
//  CurrencyConverterExam
//
//  Created by Mahyar Jananeh on 4/20/22.
//

import UIKit

class ImageView: UIImageView {
    func setupMyCustomStyle() {
        setupMyCustomStyle(contentMode: nil, tintColor: nil)
    }
    func setupMyCustomStyle(contentMode: UIView.ContentMode?,
                            tintColor: UIColor?) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = contentMode ?? .scaleAspectFit
        self.tintColor = tintColor ?? UIColor.darkGray
    }
}

