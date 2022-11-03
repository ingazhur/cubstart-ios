//
//  ContentView.swift
//  Shopping List
//
//  Created by Tony Hong on 3/11/22.
//

import SwiftUI

class Items:Identifiable {
    let imageName: String
    let itemName: String
    let quantity: Int
    
    init (imageName: String, itemName: String, quantity: Int) {
        self.imageName = imageName
        self.itemName = itemName
        self.quantity = quantity
    }
}

struct ContentView: View {
    var fruit_list = [
        Items(imageName: "banana", itemName: "Bananas", quantity: 3),
        Items(imageName: "apple", itemName: "Apples", quantity: 4)
    ]
    
    var vegetable_list = [
        Items(imageName: "broccoli", itemName: "Broccoli", quantity: 1),
        Items(imageName: "tomato", itemName: "Tomato", quantity: 5),
        Items(imageName: "lettuce", itemName: "Lettuce", quantity: 1),
    ]
    
    var other_list = [
        Items(imageName: "eggs", itemName: "Eggs", quantity: 12),
        Items(imageName: "eggs", itemName: "Eggs", quantity: 12),
        Items(imageName: "eggs", itemName: "Eggs", quantity: 12)
    ]
    
    var body: some View {
        NavigationView {
            
            List {
                Section(header: Text("Fruits")) {
                    ForEach(fruit_list) { i in
                        CustomCell(imageName: i.imageName, itemName: i.itemName, quantity: i.quantity)
                    }
                }
                Section(header: Text("Vegetables")) {
                    ForEach(vegetable_list) { i in
                        CustomCell(imageName: i.imageName, itemName: i.itemName, quantity: i.quantity)
                    }
                }
                Section(header: Text("Other")) {
                    ForEach(other_list) { i in
                        CustomCell(imageName: i.imageName, itemName: i.itemName, quantity: i.quantity)
                    }
                }
            }
            
        }
    }
}
