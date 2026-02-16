//
//  Stepper.swift
//  PizzaCompany
//
//  Created by Bachapally Sai Vardhan REDDY on 15/02/26.
//

import SwiftUI

struct StepperView: View {
    @Binding var quantity: Int
    var body: some View {
        Stepper(value: $quantity, in: 1...10) {
            Text("Quantity: \(quantity)")
        }
    }
}

#Preview {
    StepperView(quantity: .constant(1))
}
