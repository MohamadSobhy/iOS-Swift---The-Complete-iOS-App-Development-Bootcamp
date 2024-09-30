//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Mohammad Sobhy on 30/09/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    @IBOutlet weak var splitInfoLabel: UILabel!
    
    var totalPerPerson: Amount?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalPerPersonLabel.text = String(format: "%.2f",totalPerPerson?.value ?? 0.0)
        splitInfoLabel.text = "Split between \(totalPerPerson?.splitCount ?? 0) people, with \(totalPerPerson?.tipValue ?? "0%") tip."
    }
    

    @IBAction func onRecalculateTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
