//
//  Bill.swift
//  AiBiPay
//
//  Created by Michael on 1/7/23.
//

import Foundation

class Bill {
    let id = UUID().uuidString
    let company: String
    let items: [Item]
    
    var total: Double {
        var _total: Double = 0.0
        for i in items {
            _total += i.price
        }
        return _total
    }
    
    init(company: String, items: [Item]) {
        self.company = company
        self.items = items
    }
}

struct Item {
    let id = UUID().uuidString
    let name: String
    let price: Double
}

extension Bill: Identifiable {}
extension Item: Identifiable {}


extension Item {
    static var items: [Item] = [
        Item(name: "Fruit Basket", price: 11.99),
        Item(name: "Tide Pods", price: 49.99),
        Item(name: "Ground Beef 4lbs", price: 19.99),
        Item(name: "Blue Jeans", price: 9.99),
        Item(name: "Samsung Smart TV", price: 499.99),
        Item(name: "iTunes Gift Card", price: 99.99),
        Item(name: "Dyson Vaccuum", price: 79.99),
        Item(name: "Chocolate Bar", price: 5.50),
        Item(name: "Coffee Pods", price: 24.99),
//        Item(name: "Fruit Basket", price: 11.99),

    ]
}
