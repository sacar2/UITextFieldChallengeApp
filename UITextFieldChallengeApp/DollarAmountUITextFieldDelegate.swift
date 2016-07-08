//
//  DollarAmountUITextFieldDelegate.swift
//  UITextFieldChallengeApp
//
//  Created by selin acar on 2016-07-07.
//  Copyright © 2016 selin acar. All rights reserved.
//

import Foundation
import UIKit

class DollarAmountUITextFieldDelegate: NSObject, UITextFieldDelegate{
    var dollarAmount:String = "0"
    var firstCentAmount = "0"
    var secondCentAmount = "0"
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        if Int(string) != nil{
            
            if Int(dollarAmount) == 0{
                if Int(firstCentAmount) == 0 {
                    dollarAmount = "0"
                }else{
                    dollarAmount = firstCentAmount
                }
            }else {
                dollarAmount += firstCentAmount
            }
            firstCentAmount = secondCentAmount
            secondCentAmount = string
            textField.text = "$" + dollarAmount + "." + firstCentAmount
            return true
        }
        if string == "" && (dollarAmount != "0" || firstCentAmount != "0" || secondCentAmount != "0"){
            secondCentAmount = firstCentAmount
            firstCentAmount = dollarAmount.substringFromIndex(dollarAmount.endIndex.predecessor())
            dollarAmount = dollarAmount.substringToIndex(dollarAmount.endIndex.predecessor())
            if firstCentAmount == ""{
                firstCentAmount = "0"
            }
            if secondCentAmount == ""{
                secondCentAmount = "0"
            }
            if dollarAmount == ""{
                dollarAmount = "0"
            }
            textField.text = "$" + dollarAmount + "." + firstCentAmount + secondCentAmount
            return false
        }
        return false
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if ((textField.text?.isEmpty) != nil){ textField.text = "$0.00"
        }
    }
}