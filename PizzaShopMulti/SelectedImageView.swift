//
//  SelectedImageView.swift
//  PizzaCompany
//
//  Created by Bachapally Sai Vardhan REDDY on 09/02/26.
//

import SwiftUI

struct SelectedImageView: View {
    var image: String
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .cornerRadius(30)
            .shadow(color: .black, radius: 10, x: 5, y: 5)
    }
}

#Preview {
    SelectedImageView(image: "1_250w")
}
