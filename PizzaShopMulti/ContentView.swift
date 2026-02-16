//
//  ContentView.swift
//  PizzaCompany
//
//  Created by Bachapally Sai Vardhan REDDY on 28/01/26.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var orderModel: OrderModel
    @State var isMenuDisplayed = true
    
    var body: some View {
        VStack(spacing: 0) {
//            ContentHeaderView()
//                .layoutPriority(2)
            Button(action: {
                self.isMenuDisplayed.toggle()
            }) {
                PageTitleView(title: "Order Pizza", isDisplayingOrders: isMenuDisplayed)
            }
            MenuListView(orderModel: orderModel)
                .layoutPriority(isMenuDisplayed ? 1.0 : 0.5)
            OrderListView(orderModel: orderModel)
                .layoutPriority(isMenuDisplayed ? 0.5 : 1.0)
                .animation(.spring)
        }
        .padding(.bottom)
    }
}

#Preview {
    Group {
        ContentView(orderModel: OrderModel())
            .environmentObject(UserPreferences())
    }
}

