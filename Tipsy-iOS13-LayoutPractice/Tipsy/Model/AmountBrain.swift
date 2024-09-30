//
//  AmountBrain.swift
//  Tipsy
//
//  Created by Mohammad Sobhy on 30/09/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

enum TipRate {
    case zero_persent, ten_persent, twenty_persent
}

struct AmountBrain {
    var tipRate: TipRate = .ten_persent
    var splitCount = 2
    
    func calculateAmountPerPerson(billAmout: Double) -> Amount {
        let tipAmount: Double;
        
        switch(tipRate) {
        case .zero_persent:
            tipAmount = 0
        case .ten_persent:
            tipAmount = billAmout * 0.1
        case .twenty_persent:
            tipAmount = billAmout * 0.2
        }
        
        let totalAmount = billAmout + tipAmount
        let totalPerPerson = totalAmount / Double(splitCount)
        
        let tipValue: String
        
        switch tipRate {
        case .zero_persent:
            tipValue = "0%"
        case .ten_persent:
            tipValue = "10%"
        case .twenty_persent:
            tipValue = "20%"
        }
        
        return Amount(value: totalPerPerson, splitCount: splitCount, tipValue: tipValue)
    }
}
