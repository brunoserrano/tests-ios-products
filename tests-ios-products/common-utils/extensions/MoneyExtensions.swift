//
//  MoneyExtensions.swift
//  tests-ios-products
//
//  Created by Bruno Serrano dos Santos on 20/02/20.
//  Copyright © 2020 EagleSoft. All rights reserved.
//

import UIKit

extension NSNumber {
    func toCurrencyString(currencySymbol: String) -> String? {
        let formatter = NumberFormatter()
        formatter.alwaysShowsDecimalSeparator = true
        formatter.decimalSeparator = "."
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.currencySymbol = currencySymbol
        formatter.currencyDecimalSeparator = "."
        formatter.currencyGroupingSeparator = ","
        formatter.locale = Locale(identifier: "en_US")
        
        formatter.numberStyle = .currency
        
        return formatter.string(from: self)
    }
}
