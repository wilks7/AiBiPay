//
//  Receipt.swift
//  AiBiPay
//
//  Created by Michael on 1/7/23.
//

import Foundation

class Receipt: Bill {
    let paid: Date
    let payment: PaymentAccount
    
    init(bill: Bill, paid: Date, payment: PaymentAccount) {
        self.paid = paid
        self.payment = payment
        super.init(company: bill.company, items: bill.items)
    }
    
}

extension Receipt: Hashable, Equatable {
    static func == (lhs: Receipt, rhs: Receipt) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
