//
//  Navigation.swift
//  Wallet
//
//  Created by Sarthak Aggarwal on 2/11/24.
//

import SwiftUI

struct Navigation: View {
    @ObservedObject var cardList : cardData
    @State var card = CardDetails()
    let cardtypes = ["VISA", "Mastercard", "AMEX", "Discover"]
    let colortypes = ["blue", "pink", "teal", "yellow"]
    @State private var isShowingSheet = false
    
    var body: some View {
        Text("Add Card")
            .font(.title)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
            .padding()
        
        Form{
            Section(header: Text("SIGNATURE")){
                
                TextField("Cardholder Name", text: $card.holderName)
                TextField("Bank", text: $card.bank )
                Picker("Card Type", selection: $card.type) {
                    ForEach(cardtypes, id: \.self) { style in
                        Text(style)
                        // you don't need .tag(style) as the type matches
                    }
                }
                .pickerStyle(.menu)}
            Section(header: Text("DETAILS")){
                TextField("Card Number", text: $card.number )
                TextField("Secure Code", text: $card.secureCode )
                DatePicker(
                    "Valid Thru",
                    selection: $card.validity,
                    displayedComponents: [.date]
                )
                .datePickerStyle(CompactDatePickerStyle())
                .frame(maxHeight: 400)
                // Change the style here (e.g., .compact, .graphical)
                
            }
            Section(header: Text("CARD COLOR")){
                ColorPicker("Color: ", selection: $card.color)
            }
            
            Section(){
                Button("Add Card to Wallet"){
                    isShowingSheet.toggle()
                    cardList.addtodata(deets: card)
                }
                .sheet(isPresented: $isShowingSheet) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(card.color)
                            .frame(width: 550, height: 300)
                            .cornerRadius(15)
                        VStack{
                            HStack{
                                Spacer()
                                Text(card.bank)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(Color.white)
                                Spacer()
                                Spacer()
                                Spacer()
                                Text(card.type.rawValue)
                                    .font(.body)
                                    .fontWeight(.regular)
                                    .multilineTextAlignment(.trailing)
                                    .foregroundColor(Color.white)
                                Spacer()
                            }
                            Text("")
                            Text("")
                            Text("")
                            Text("")
                            HStack{
                                Spacer()
                                Text(card.holderName)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                            }
                            Text("")
                            HStack{
                                Spacer()
                                Text("Valid Thru:")
                                    .foregroundColor(Color.white)
                                Text(card.formattedValidity)
                                    .foregroundColor(Color.white)
                                Spacer()
                                Text("Secure Code:")
                                    .foregroundColor(Color.white)
                                Text(card.secureCode)
                                    .foregroundColor(Color.white)
                                Spacer()
                            }
                            Text("")
                            HStack{
                                Spacer()
                                Text(card.number)
                                    .fontWeight(.bold)
                                    .font(.system(size: 24))
                                    .foregroundColor(Color.white)
                                Spacer()
                                Spacer()
                                Spacer()
                            }
                            
                        }
                    }
                    .presentationDetents([.medium, .large])
                    Text("")
                    Text("")
                    Text("")
                    Text("")
                    Text("")
                    Button("Close"){
                        isShowingSheet = false
                    }
                }
            }
        }
        
    }
}


struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

