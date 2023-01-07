//
//  AddPaymentAccountView.swift
//  AiBiPay
//
//  Created by Michael on 1/7/23.
//

import SwiftUI

struct AddPaymentAccountView: View {
    @Environment(\.dismiss) var dismiss

    enum PaymentType { case card, bank, crypto}
    
    @State var showAlert = false
    
    @State var name = ""
    @State var type: PaymentType = .card
    
    // Credit Card
    @State var cardnumber: String = ""
    @State var cardCvv: String = ""
    
    // Bank
    @State var routingNumber: String = ""
    @State var accountNumber: String = ""
    
    // Crypto
    @State var privateKey: String = ""
    @State var crypto = 0
    
    var newPaymentAccount: (_ account: PaymentAccount) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("", selection: $type) {
                    Text("Credit Card").tag(PaymentType.card)
                    Text("Bank Account").tag(PaymentType.bank)
                    Text("Crypto").tag(PaymentType.crypto)
                }
                .pickerStyle(.segmented)
                Section {
                    TextField("Name", text: $name)
                }
                switch type {
                case .card:
                    TextField("Card Number", text: $cardnumber)
                    TextField("CVV", text: $cardCvv)
                case .bank:
                    TextField("Routing Number", text: $routingNumber)
                    TextField("Account Number", text: $accountNumber)
                case .crypto:
                    VStack {
                        Picker("", selection: $crypto) {
                            Text("AI Coin").tag(0)
                            Text("Bitcoin").tag(1)
                            Text("Ethereum").tag(2)
                        }
                        .pickerStyle(.segmented)
                        .padding(.bottom)
                        TextField("Private Key", text: $privateKey)
                    }
                }
            
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addTapped) {
                        Text("Add")
                            .fontWeight(.bold)
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {dismiss()}) {
                        Text("Cancel")
                    }
                }
            }
            .alert("Error", isPresented: $showAlert, actions: {
                Button("Ok", action: {})
            }, message: {
                Text("Please enter a name and fill in the fields")
            })
        }
    }
    
    private func addTapped(){
        guard !name.isEmpty else { showAlert = true; return}
        let paymentAccount = PaymentAccount(name: name, amount: 5489.58)
        newPaymentAccount(paymentAccount)
        dismiss()
    }
}


struct AddPaymentAccountView_Previews: PreviewProvider {
    static var previews: some View {
        AddPaymentAccountView { account in
            
        }
    }
}
