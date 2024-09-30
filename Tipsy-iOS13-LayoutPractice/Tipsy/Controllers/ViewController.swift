//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var splitCountLabel: UILabel!
    @IBOutlet weak var zeroTipBtn: UIButton!
    @IBOutlet weak var tenTipBtn: UIButton!
    @IBOutlet weak var twentyTipBtn: UIButton!
    @IBOutlet weak var calculateBtn: UIButton!
    
    var amountBrain = AmountBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        splitCountLabel.text = String(amountBrain.splitCount)
    }
    
    @IBAction func onTipRateSelected(_ sender: UIButton) {
        let btnTitle = sender.titleLabel?.text
        
        if (btnTitle == "0%") {
            amountBrain.tipRate = .zero_persent
            zeroTipBtn.isSelected = true
            tenTipBtn.isSelected = false
            twentyTipBtn.isSelected = false
        } else if (btnTitle == "10%") {
            amountBrain.tipRate = .ten_persent
            zeroTipBtn.isSelected = false
            tenTipBtn.isSelected = true
            twentyTipBtn.isSelected = false
        } else {
            amountBrain.tipRate = .twenty_persent
            zeroTipBtn.isSelected = false
            tenTipBtn.isSelected = false
            twentyTipBtn.isSelected = true
        }
    }
    
    @IBAction func onBillAmountChange(_ sender: UITextField) {
        print("Entered")
        let billAmount = Double(sender.text ?? "")
        calculateBtn.isEnabled = billAmount != nil
        
        if(calculateBtn.isEnabled) {
            calculateBtn.backgroundColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        } else {
            calculateBtn.backgroundColor = .systemGray2
        }
    }
    
    @IBAction func onSplitCountChange(_ sender: UIStepper) {
        amountBrain.splitCount = Int(sender.value)
        splitCountLabel.text = String(amountBrain.splitCount)
    }
    
    @IBAction func onCalculateTapped(_ sender: UIButton) {
        if billAmountField.text != nil && !billAmountField.text!.isEmpty {
            performSegue(withIdentifier: "goToResult", sender: self)
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueId = segue.identifier
        
        
        if(segueId == "goToResult") {
            let billAmout =  Double(billAmountField.text ?? "0")
            
            guard billAmout != nil else {
                print("Error happened while trying to prepare the result")
                return
            }
            
            
            let destination = segue.destination as! ResultViewController
            destination.totalPerPerson = amountBrain.calculateAmountPerPerson(billAmout: billAmout!)
        }
        
    }
}

