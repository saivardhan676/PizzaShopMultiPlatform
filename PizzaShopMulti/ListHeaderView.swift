//
//  ListHeaderView.swift
//  PizzaCompany
//
//  Created by Bachapally Sai Vardhan REDDY on 01/02/26.
//

import SwiftUI

struct ListHeaderView: View {
    @ObservedObject var orderModel: OrderModel
    var text: String
    
    var body: some View {
        HStack {
            HStack {
                Text(text)
                    .padding([.leading, .top, .bottom], 5)
                    .foregroundColor(Color("G1"))
                    .fontWeight(.heavy)
                Spacer()
                Text(orderModel.formattedTotal)
                    .fontWeight(.heavy)
                    .padding(.trailing, 5)
            }
            .foregroundColor(Color("IP"))
            .font(.headline)
            .padding([.top, .bottom, .leading, .trailing], 5)
        }
        .background(Color("G4"))
    }
}

#Preview {
    ListHeaderView(orderModel: OrderModel(), text: "Menu")
}
