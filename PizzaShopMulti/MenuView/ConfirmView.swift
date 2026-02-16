//
//  ConfirmView.swift
// 

import SwiftUI

struct ConfirmView: View {
    var menuID: Int
    let sizes: [Size] = [.small, .medium, .large]
    @Binding var isPresented: Bool
    @Binding var quantity: Int
    @Binding var size: Size
    @ObservedObject var orderModel: OrderModel
    @State var comments: String = ""
    
    ///extracts the menu item name based on `menuID`
    var name:String{
        orderModel.menu(menuID)?.name ?? ""
    }
    
    func addItem(){
        orderModel.add(menuID: menuID, size: size, quantity: quantity, comments: comments)
        isPresented = false
    }
    
    func dismiss() {
        isPresented = false
    }
    
    var body: some View {
        VStack{
            Text("Confirm Order")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding([.leading, .top])
            Divider()
            SelectedImageView(image: "\(menuID)_250w")
                .padding(10)
                .gesture(
                    TapGesture(count: 2)
                        .onEnded{
                            isPresented = false
                        }
                )
            Divider()
            Text("Confirm your order of \(quantity) \(size.formatted()) \(name) pizza")
                .font(.headline)
            TextField("Add Order Instructions (optional)", text: $comments)
                .padding()
                .textFieldStyle(.roundedBorder)
                .foregroundStyle(Color(.black))
            Divider()
            PickerView(size: $size)
                .padding()
            Divider()
            StepperView(quantity: $quantity)
                .padding()
            Spacer()
            HStack {
                Button(action: addItem) {
                    Text("Add")
                        .font(.title)
                        .padding(12)
                        .background(Color("G4"))
                        .cornerRadius(10)
                }
                Spacer()
                Button(action: dismiss) {
                    Text("Cancel")
                        .font(.title)
                        .padding(12)
                        .background(Color("G4"))
                        .cornerRadius(10)
                }
            }
            .padding(20)
            .padding(.bottom, 20)
        }
        .background(Color("G3"))
        .foregroundColor(Color("IP"))
        .cornerRadius(20)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    ConfirmView(menuID: 0, isPresented: .constant(false), quantity: .constant(0), size: .constant(.medium), orderModel: OrderModel())
}
