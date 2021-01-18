//
//  Tip.swift
//  Tipsy
//
//  Created by Nikola Anastasovski on 18.1.21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Tip {
    
    var billAmount: Float
    var tipPercent: Float
    var splitBetween: Int
    
    mutating func calculateAmountToPay()  -> Float {
        return (billAmount + billAmount * tipPercent) / Float(splitBetween)
    }
}
