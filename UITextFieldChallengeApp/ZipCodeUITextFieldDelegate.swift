//
//  ZipCodeUITextFieldDelegate.swift
//  UITextFieldChallengeApp
//
//  Created by selin acar on 2016-07-07.
//  Copyright © 2016 selin acar. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeUITextFieldDelegate: NSObject, UITextFieldDelegate{
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if (Int(string) != nil && textField.text?.characters.count < 5) || string  == "" {
            return true
        }else{
            return false
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}