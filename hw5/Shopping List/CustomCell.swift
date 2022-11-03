//
//  CustomCell.swift
//  Shopping List
//
//  Created by Tony Hong on 3/12/22.
//

import SwiftUI

struct CustomCell: View {
    var imageName: String
    var itemName: String
    var quantity: Int
    
    var body: some View {
        HStack {
            HStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 35, height: 35)
                    .padding()
                Text(itemName)
            }
            
            Spacer()
            
            Text(String(quantity))
        }
        .frame(maxWidth: .infinity, maxHeight: 50)
    }
}

