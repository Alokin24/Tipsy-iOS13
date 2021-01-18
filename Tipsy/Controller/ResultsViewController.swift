//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Nikola Anastasovski on 18.1.21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var amountToPay: Float?
    var splitMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(self.amountToPay!)
        settingsLabel.text = splitMessage!
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }

}
