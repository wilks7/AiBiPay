//
//  BillView.swift
//  AiBiPay
//
//  Created by Michael on 1/7/23.
//

import SwiftUI

struct BillView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var session: SessionViewModel
    
    let bill = Bill(company: "Walmart", items: Item.items)
    
    var qrCode: UIImage { QrGenerator.generateQRCode(from: bill.company) }
    
    var paid: (_ receipt: Receipt) -> Void
    
    @State var showQR = false
    var body: some View {
        NavigationStack {
            List {
                HStack {
                    Spacer()
                    Image(uiImage: qrCode)
                        .interpolation(.none)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    Spacer()
                }
                .onTapGesture {
                    showQR = true
                }
                Section {
                    Text(bill.company)
                } header: {
                    Text("Company")
                }
                
                Section {
                    ForEach(bill.items){ item in
                        ItemCell(item)
                    }
                } header: {
                    Text("Items")
                }
            }
            .navigationTitle(bill.total.priceString)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: paidTapped) {
                        Text("PAID")
                    }
                }
            }
            .sheet(isPresented: $showQR) {
                Image(uiImage: qrCode)
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            }
        }
    }
    
    func paidTapped(){
        let receipt = Receipt(bill: bill, paid: .now, payment: session.selectedMethod)
        paid(receipt)
        dismiss()
    }
}

struct BillView_Previews: PreviewProvider {
    static var previews: some View {
        BillView { receipt in
            
        }
        .environmentObject(SessionViewModel())
    }
}
