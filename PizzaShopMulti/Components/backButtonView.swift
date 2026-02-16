//
//  backButtonView.swift
//  PizzaCompany
//
//  Created by Bachapally Sai Vardhan REDDY on 16/02/26.
//

import SwiftUI

struct backButtonView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack {
            Button(action: {
                dismiss()
            }) {
                HStack(spacing: 5) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16, weight: .semibold))
                    Text("Back")
                }
                .foregroundColor(Color("G4"))
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .frame(height: 24)
        #if os(macOS)
        .background(Color(.windowBackgroundColor))
        #else
        .background(Color(.systemBackground))
        #endif
    }
}

#Preview {
    backButtonView()
}
