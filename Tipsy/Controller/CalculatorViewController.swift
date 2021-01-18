//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var pctButton: UIButton?
    var tipBrain = TipBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        deselectPctButtons()
        
        sender.isSelected = true
        pctButton = sender
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    override func viewDidLoad() {
        pctButton = tenPctButton
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let tipPercent = getPctButtonDecimalValue()
        let splitBetween = Int(splitNumberLabel.text!)!
        let billAmount = Float(billTextField.text!)!
        
        tipBrain.tip = Tip(billAmount: billAmount, tipPercent: tipPercent, splitBetween: splitBetween)
        
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.amountToPay = tipBrain.getAmountToPay()
            destinationVC.splitMessage = "Split between \(tipBrain.getNumberOfPeopleThatSplit()) people with \(tipBrain.getTipPercent())% tip"
        }
    }
    
    func deselectPctButtons() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    func getPctButtonDecimalValue() -> Float {
        if let strValue = pctButton?.currentTitle {
            let index = strValue.index(strValue.startIndex, offsetBy: strValue.count-1)
            
            let decimalPart = strValue.prefix(upTo: index)
            
            let decimalValue = Float(decimalPart)! / 100.0
            
            return decimalValue
        }
        return -1
    }
    
}

