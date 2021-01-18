//
//  TipBrain.swift
//  Tipsy
//
//  Created by Nikola Anastasovski on 18.1.21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

class TipBrain {
    
    var tip: Tip?
    
    func getAmountToPay() -> Float {
        return tip?.calculateAmountToPay() ?? 0.0
    }
    
    func getTipPercent() -> String {
        return String(Int((tip?.tipPercent ?? 0.0) * 100))
    }
    
    func getNumberOfPeopleThatSplit() -> Int {
        return tip?.splitBetween ?? 2
    }
}
