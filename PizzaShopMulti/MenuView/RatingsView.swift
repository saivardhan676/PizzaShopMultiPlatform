//
//  RatingsView.swift
//  PizzaCompany
//
//  Created by Bachapally Sai Vardhan REDDY on 01/02/26.
//

import SwiftUI

struct RatingsView: View {
    var count: Int = 4
    var rating: [String] {
        let symboleName = "\(count).circle.fill"
        return Array(repeating: symboleName, count: count)
    }
    
    var body: some View {
        HStack {
            ForEach(rating, id: \.self) { item in
                Image(systemName: item)
                    .font( .headline)
                    .foregroundColor(Color("G4"))
            }
        }
    }
}

#Preview {
    RatingsView(count: 5)
}
