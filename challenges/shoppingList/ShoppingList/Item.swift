//
//  Item.swift
//  ShoppingList
//
//  Created by gülçin çetin on 29.10.2025.
//

import Foundation
import SwiftData

@Model
class Item {
    var name: String
    var price: Double
    var purchased: Bool
    
    init(name: String, price: Double, purchased: Bool) {
        self.name = name
        self.price = price
        self.purchased = purchased
    }
}
