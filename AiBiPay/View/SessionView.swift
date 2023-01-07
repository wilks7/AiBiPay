//
//  ContentView.swift
//  AiBiPay
//
//  Created by Michael on 12/28/22.
//

import SwiftUI

struct SessionView: View {
    
    var body: some View {
        TabView {
            PaymentView()
                .tabItem {
                    Image(systemName: "mic.fill")
                    Text("Payment")
                }
            ReceiptsView()
                .tabItem {
                    Image(systemName: "doc.text")
                    Text("Receipts")
                }
            WalletView()
                .tabItem {
                    Image(systemName: "wallet.pass.fill")
                    Text("Wallets")
                }
        }

//        .alert(model.alert.title,
//               isPresented: $model.showAlert,
//               actions: {buttons},
//               message: {Text(model.alert.message)}
//        )

    }

}

struct SessionView_Previews: PreviewProvider {
    static var previews: some View {
        SessionView()
    }
}
