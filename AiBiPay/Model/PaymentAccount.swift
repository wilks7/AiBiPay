//
//  PaymentAccount.swift
//  AiBiPay
//
//  Created by Michael on 1/7/23.
//

import Foundation

class PaymentAccount {
    let id = UUID().uuidString
    let name: String
    var amount: Double
    
    init(name: String, amount: Double) {
        self.name = name
        self.amount = amount
 
    }
}

extension PaymentAccount: Identifiable, Equatable {
    static func == (lhs: PaymentAccount, rhs: PaymentAccount) -> Bool {
        lhs.id == rhs.id
    }
}

extension PaymentAccount {
    static let account = PaymentAccount(name: "Chase", amount: 34546.42)
    static let account2 = PaymentAccount(name: "MasterCard", amount: 5000.00)
    static let account3 = PaymentAccount(name: "AiCoin", amount: 3641.76)
    static let account4 = PaymentAccount(name: "Ethereum", amount: 7546.32)
    static let account5 = PaymentAccount(name: "Bitcoin", amount: 2648.62)

}
