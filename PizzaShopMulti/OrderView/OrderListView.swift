//
//  orderListView.swift
//  PizzaCompany
//
//  Created by Bachapally Sai Vardhan REDDY on 01/02/26.
//

import SwiftUI

struct OrderListView: View {
    @ObservedObject var orderModel: OrderModel
    var body: some View {
        VStack {
            List {
                Section(
                    header: ListHeaderView(orderModel: orderModel, text: "Your order")
                ) {
                    ForEach(orderModel.orders) { item in
                        OrderRowView(orderItem: item)
                    }
                    .onDelete(perform: deleteItem)
                }
            }
            .listStyle(.plain)
        }
    }
    
    private func deleteItem(offsets: IndexSet) {
        orderModel.orders.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderListView(orderModel: OrderModel())
}
