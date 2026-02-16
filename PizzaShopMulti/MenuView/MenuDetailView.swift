//
//  MenuDetailView.swift
//  Pizza
//  

import SwiftUI
///A `View`for entering in an order. Takes basic information about the order from `menuItem`

var size:Size = .medium

struct MenuDetailView: View {
    @EnvironmentObject var settings:UserPreferences
    @ObservedObject var orderModel:OrderModel
    @State var didOrder: Bool = false
    @State var quantity: Int = 1
    
    var menuItem:MenuItem
    var formattedPrice:String{
        String(format:"%3.2f",menuItem.price * Double(quantity) * size.rawValue)
    }
    func addItem(){
        didOrder = true
    }
    
    func isCompactPortrait(geo:GeometryProxy)->Bool{
        return geo.size.height <= 414
    }
    
    func titleView()->some View{
        return
        GeometryReader { geo in
            HStack{
                SelectedImageView(image: "\(self.menuItem.id)_250w")
                    .padding(5)
                Text(self.menuItem.description)
                    .padding()
                    .font(geo.size.height > 200 ? .body : .caption)
                    .frame(width: geo.size.width * 2/5)
            }
        }
    }
    
    func menuOptionsView()-> some View{
        return  VStack{
            PickerView(size:$settings.size)
                .padding()
            StepperView(quantity:$quantity)
                .padding()
            PageTitleView(title: "Order:  \(formattedPrice)")
            Spacer()
        }
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                backButtonView()
                HStack{
                    PageTitleView(title: self.menuItem.name)
                    Button(action: self.addItem) {
                        Text("Add to order")
                            .padding([.leading, .trailing])
                            .font(isCompactPortrait(geo: geo) ? staticFont : .title)
                            .fontWeight(.bold)
                            .background(Color("G3"))
                            .foregroundColor(Color("IP"))
                            .cornerRadius(5)
                    }
                    .sheet(isPresented: self.$didOrder){
                        ConfirmView(menuID: self.menuItem.id, isPresented: self.$didOrder, quantity: self.$quantity, size: self.$settings.size, orderModel: self.orderModel)
                    }
                }
                if isCompactPortrait(geo: geo) {
                    HStack{
                        self.titleView()
                        self.menuOptionsView()
                    }
                } else {
                    VStack{
                        self.titleView()
                        self.menuOptionsView()
                    }
                }
            }
            .padding(.top, 5)
            .navigationBarHidden(true)
            #if os(macOS)
            #else
            
            #endif
        }
    }
}

#Preview {
    MenuDetailView(orderModel:OrderModel(),menuItem: testMenuItem)
        .environmentObject(UserPreferences())
}

struct QuantityStepperView: View {
    @Binding var quantity:Int
    var body: some View {
        Stepper(value: $quantity, in: 1...10){
            Text("Quantity \(quantity)")
        }
        .padding()
    }
}

struct SizePickerView: View {
    
    @Binding var size:Size
    let sizes:[Size] = [.small,.medium,.large]
    var body: some View {
        Picker(selection:$size, label:Text("Pizza Size")){
            ForEach(sizes, id:\.self){ size in
                Text(size.formatted()).tag(size)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .font(.headline)
    }
}

