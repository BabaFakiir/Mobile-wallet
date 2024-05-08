//
//  Data.swift
//  Wallet
//
//  Created by Sarthak Aggarwal on 2/11/24.
//

import Foundation

class cardData:ObservableObject{
    @Published var database: [CardDetails] = []
    
    func addtodata(deets: CardDetails){
        database.append(deets)
        objectWillChange.send()
    }
}

