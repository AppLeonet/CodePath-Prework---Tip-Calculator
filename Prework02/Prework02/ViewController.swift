//
//  ViewController.swift
//  Prework02
//
//  Created by Man deng Ho on 8/22/22.
//

import UIKit

class ViewController : UIViewController, UITextFieldDelegate {

  
    
    
    @IBOutlet weak var billAmountTField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
   @IBOutlet weak var tipP: UILabel!
    
    @IBAction func TipSlideChange(_ sender: UISlider) {
        let bill = Double(billAmountTField.text!) ?? 0
        let text01 = "Tip Percentage "
        let character = " %"
        let tipSlideNum = Int(sender.value)
        tipP.text = text01 + String(tipSlideNum) + character
      
        let tipSlideDecimalNum = Double(tipSlideNum) / 100
        
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let tip02 = bill * tipSlideDecimalNum
        let total = bill + tip
       let total02 = bill + tip02
     
        //update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        tipAmountLabel.text = String(format: "$%.2f", tip02)
        
        //update total amount
        totalLabel.text = String(format: "$%.2f", total)
        totalLabel.text = String(format: "$%.2f", total02)
        
       }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        billAmountTField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
       view.addGestureRecognizer(tap)
        
        billAmountTField.delegate = self
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        // get bill amount from text field input
        let bill = Double(billAmountTField.text!) ?? 0
        
        // total cost calculation
        
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        //update total amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    
}

