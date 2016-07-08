//
//  ViewController.swift
//  UITextFieldChallengeApp
//
//  Created by selin acar on 2016-07-06.
//  Copyright © 2016 selin acar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var zipcodeField: UITextField!
    @IBOutlet weak var cashField: UITextField!
    @IBOutlet weak var switchField: UITextField!
    @IBOutlet weak var textSwitch: UISwitch!
    
    var ZipCodeDelegate = ZipCodeUITextFieldDelegate()
    var DollarAmountDelegate = DollarAmountUITextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.zipcodeField.delegate = ZipCodeDelegate
        self.zipcodeField.keyboardType = UIKeyboardType.NumberPad
        
        self.cashField.delegate = DollarAmountDelegate
        self.cashField.keyboardType = UIKeyboardType.NumberPad
        
        self.switchField.delegate = self
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        if textSwitch.on{
            return true
        }else {
          return false
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func endTextEditingWhenSwitchIsOff(sender: AnyObject) {
        switchField.resignFirstResponder()
        
    }

}

