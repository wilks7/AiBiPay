//
//  Double.swift
//  AiBiPay
//
//  Created by Michael on 1/7/23.
//

import Foundation

extension Double {
    var priceString: String {
        return String(format: "$%.02f", self)
    }
}
