//
//  Picker.swift
//  PizzaCompany
//
//  Created by Bachapally Sai Vardhan REDDY on 15/02/26.
//

import SwiftUI

struct PickerView: View {
    @Binding var size: Size
    let sizes: [Size] = [.small, .medium, .large]
    
    var body: some View {
        Picker(selection: $size) {
            ForEach(sizes, id: \.self) { size in
                Text(size.formatted()).tag(size)
            }
        } label: {
            Text("Pizza size:")
        }
        .pickerStyle(.segmented)
        .background(Color("G1"))
        .cornerRadius(12)
        .font(.headline)
    }
}

#Preview {
    PickerView(size: .constant(.medium))
}
