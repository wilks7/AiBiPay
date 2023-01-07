//
//  WalletView.swift
//  AiBiPay
//
//  Created by Michael on 1/7/23.
//

import SwiftUI

struct WalletView: View {
    @EnvironmentObject var session: SessionViewModel
    
    @State var showNewPayment = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(session.wallets) { wallet in
                        HStack{
                            Image(systemName: "checkmark")
                                .opacity(wallet == session.selectedMethod ? 1.0 : 0.0)
                                .foregroundColor(.blue)
                            Text(wallet.name)
                            Spacer()
                            Text(wallet.amount.priceString)
                                .fontWeight(.bold)
                        }
                        .onTapGesture {
                            tapped(wallet)
                        }
                    }
                } header: {
                    Text("Default Payment")
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addTapped) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showNewPayment) {
                AddPaymentAccountView { account in
                    session.add(payment: account)
                }
            }
            .navigationTitle("Accounts")
        }
    }
    
    func tapped(_ wallet: PaymentAccount) -> Void {
        session.selectedMethod = wallet
    }
    
    func addTapped(){
        showNewPayment = true
    }
}



struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
            .environmentObject(SessionViewModel())
    }
}
