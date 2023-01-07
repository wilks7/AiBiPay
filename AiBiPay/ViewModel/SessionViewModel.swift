//
//  SessionViewModel.swift
//  AiBiPay
//
//  Created by Michael on 1/7/23.
//

import Foundation

class SessionViewModel: ObservableObject {
    
    @Published var wallets: [PaymentAccount] = [.account, .account2, .account3, .account4, .account5]
    @Published var receipts: [Receipt] = []
    
    @Published var selectedMethod: PaymentAccount = .account

    func add(receipt: Receipt){
        receipts.append(receipt)
        print("Saved Receipt")
    }
    
    func add(payment: PaymentAccount) {
        wallets.append(payment)
    }
}
