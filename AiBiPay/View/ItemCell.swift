//
//  ItemCell.swift
//  AiBiPay
//
//  Created by Michael on 1/7/23.
//

import SwiftUI

struct ItemCell: View {
    let item: Item
    
    init(_ item: Item){
        self.item = item
    }
    
    var body: some View {
        HStack {
            Text(item.name)
            Spacer()
            Text(item.price.priceString)
        }
    }
}

struct ItemCell_Previews: PreviewProvider {
    static var previews: some View {
        ItemCell(Item(name: "Coca-Cola", price: 1.99))
    }
}
