//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Mohammad Sobhy on 27/09/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    var bmi: BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiLabel.text = bmi?.value
        adviceLabel.text = bmi?.advice
        
        if bmi?.color != nil {
            view.backgroundColor = bmi?.color
        }
    }
    
    @IBAction func onRecalculateBMITapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
