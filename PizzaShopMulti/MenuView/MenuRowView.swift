//
//  MenuRowView.swift
//  PizzaCompany
//
//  Created by Bachapally Sai Vardhan REDDY on 01/02/26.
//

import SwiftUI

struct MenuRowView: View {
    var menuItem: MenuItem = testMenuItem
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 15) {
                Image("\(menuItem.id)_100w")
                    .clipShape(Capsule())
                    .shadow(color: .black.opacity(0.5), radius: 5, x: 5, y: 5)
                VStack(alignment: .leading) {
                    Text(menuItem.name)
                        .font(.title)
                        .fontWeight(.light)
                    RatingsView(count: menuItem.rating)
                }
            }
            Text(menuItem.description)
        }
    }
}

#Preview {
    MenuRowView()
}
