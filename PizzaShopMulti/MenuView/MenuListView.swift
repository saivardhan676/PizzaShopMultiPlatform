//
//  SwiftUIView.swift
//  PizzaCompany
//
//  Created by Bachapally Sai Vardhan REDDY on 01/02/26.
//

import SwiftUI

struct MenuListView: View {
    @ObservedObject var orderModel: OrderModel
    @State private var selectedItem: MenuItem?
    var menuList = MenuModel().menu
    
    var body: some View {
        VStack {
            ListHeaderView(orderModel: orderModel, text: "Menu")
            NavigationStack {
                #if os(macOS)
                List(menuList, children: \.children) { item in
                    if item.type != .title {
                        Button(action: {
                            selectedItem = item
                        }){
                            MenuRowView(menuItem: item)
                                .listRowInsets(EdgeInsets())
                        }
                        .foregroundColor(.primary)
                    } else {
                        Text(item.name)
                    }
                }
                .listStyle(.plain)
                .navigationDestination(item: $selectedItem) { item in
                    MenuDetailView(orderModel: self.orderModel, menuItem: item)
                }
                #else
                List {
                    OutlineGroup(menuList, children: \.children) { item in
                        if item.type != .title {
                            Button(action: {
                                selectedItem = item
                            }){
                                MenuRowView(menuItem: item)
                                    .listRowInsets(EdgeInsets())
                            }
                            .foregroundColor(.primary)
                        } else {
                            Text(item.name)
                        }
                    }
                }
                .listStyle(.plain)
                .navigationDestination(item: $selectedItem) { item in
                    MenuDetailView(orderModel: self.orderModel, menuItem: item)
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Pizza Company")
                #endif
            }
        }
    }
}

#Preview {
    MenuListView(orderModel: OrderModel())
        .environmentObject(UserPreferences())
}
