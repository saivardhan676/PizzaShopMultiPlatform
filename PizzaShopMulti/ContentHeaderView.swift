//
//  ContentHeaderView.swift
//  PizzaCompany
//
//  Created by Bachapally Sai Vardhan REDDY on 01/02/26.
//

import SwiftUI

struct ContentHeaderView: View {
    var body: some View {
        VStack {
            ZStack {
                Image("Surf Board")
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 300, idealWidth: 500, maxWidth: 600, minHeight: 75, idealHeight: 143, maxHeight: 150, alignment: .center)
                Text("The Pizza Company")
                    .offset(x: -20, y: 30)
                    .font(Font.custom("Avinir-Black", size: 18))
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    ContentHeaderView()
}
