//
//  Home.swift
//  Wallet
//
//  Created by Sarthak Aggarwal on 2/26/24.
//

import SwiftUI

struct Home: View {
    @ObservedObject var cards : cardData
    var body: some View {
        Text("Wallet")
            .font(.title)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
            .padding()
        List(cards.database, id: \.number) { card in
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
        }
    }
}
