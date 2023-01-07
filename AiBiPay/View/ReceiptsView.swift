//
//  ReceiptsView.swift
//  AiBiPay
//
//  Created by Michael on 1/7/23.
//

import SwiftUI

struct ReceiptsView: View {
    @EnvironmentObject var session: SessionViewModel
        
    var body: some View {
        NavigationStack {
            List {
                ForEach(session.receipts) { receipt in
                    NavigationLink(value: receipt) {
                        ReceiptCell(receipt: receipt)
                    }
                }
            }
            .navigationDestination(for: Receipt.self) { receipt in
                ViewReceiptView(receipt: receipt)
            }
            .navigationTitle("Receipts")
        }
    }

    struct ReceiptCell: View {
        let receipt: Receipt
        
        var body: some View {
            HStack {
                Text(receipt.company)
                Spacer()
                VStack(alignment: .trailing) {
                    Text(receipt.total.priceString)
                    Text(receipt.paid.formatted(date: .numeric, time: .shortened))
                        .font(.caption.weight(.semibold))
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct ViewReceiptView: View {
    let receipt: Receipt
    var body: some View {
        List {
            Section {
                Text(receipt.payment.name)
                Text(receipt.total.priceString)
                Text(receipt.paid.formatted(date: .abbreviated, time: .shortened))
            } header: {
                Text("Payment")
            }
            
            Section {
                ForEach(receipt.items){ item in
                    ItemCell(item)
                }
            } header: {
                Text("Items")
            }
        }
        .navigationTitle(receipt.company)
    }
}

struct ReceiptsView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiptsView()
            .environmentObject(SessionViewModel())
    }
}
