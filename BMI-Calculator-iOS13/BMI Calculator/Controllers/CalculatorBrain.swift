//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Mohammad Sobhy on 27/09/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var bmiValue: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmi = weight / pow(height, 2)
        let bmiFormatted = String(format: "%.1f", bmi)
        
        if bmi < 18.5 {
            bmiValue = BMI(value: bmiFormatted, advice: "Eat more pies!", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        } else if bmi <= 24.9 {
            bmiValue = BMI(value: bmiFormatted, advice: "Fir as a fiddle!", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        } else {
            bmiValue = BMI(value: bmiFormatted, advice: "Eat less pies!", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        }
    }
    
    func getBMIValue() -> BMI? {
        return bmiValue
    }
}
