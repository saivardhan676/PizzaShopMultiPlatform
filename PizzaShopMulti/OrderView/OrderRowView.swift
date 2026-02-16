//
//  OrderRowView.swift
//  PizzaCompany
//
//  Created by Bachapally Sai Vardhan REDDY on 01/02/26.
//

import SwiftUI

struct OrderRowView: View {
    var orderItem: OrderItem
    var body: some View {
        VStack {
            HStack(alignment: .firstTextBaseline) {
                Image(systemName: "\(orderItem.id + 1).square")
                Text(orderItem.description)
                    .font(.headline)
                Spacer()
                Text(orderItem.formattedExtendedPrice)
                    .bold()
            }
            Text(orderItem.comments.isEmpty ? "" : "Order Instructions: \(orderItem.comments)")
        }
        .animation(.none)
    }
}

#Preview {
    OrderRowView(orderItem: testOrderItem)
}
