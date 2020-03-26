//
//  ViewController.swift
//  Tipsy
//

import UIKit

class CalculateTipViewController: UIViewController {

    
    @IBOutlet weak var billAmount: UITextField!
    
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var fifteenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    
    @IBOutlet weak var numPeople: UILabel!
    
    var money = 0.00
    var numberPeople = 2
    var decimalTip = 0.00
    var perPerson = 0.00
    var percentTip = "0%"
    
    let tipBrain = TipBrain()
    
    @IBAction func tipPressed(_ sender: UIButton) {
        // when pressing a tip button, number pad for tip input goes away
        billAmount.endEditing(true)
        // get the amount entered
        money = Double(billAmount.text ?? "0.00") ?? 0.0
        
        // border which shows which tip button is selected goes away for all buttons
        tenPercentButton.isSelected = false
        fifteenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
        
        // whatever button user chooses shows the border
        sender.isSelected = true
        
        // get the percentage
        percentTip = sender.currentTitle!
        // get the number from percentage and change to a decimal
        let numTip = percentTip.dropLast()
        decimalTip = (Double(numTip) ?? 0.0) / 100
    }
    
    @IBAction func updatePeople(_ sender: UIStepper) {
        // updates the number of people when pressing + or -
        numPeople.text = String(format: "%.0f", sender.value)
        numberPeople = Int(sender.value)
    }
    
    @IBAction func calculateTip(_ sender: UIButton) {
        perPerson = tipBrain.calculatePerPerson(money, decimalTip, numberPeople)
        // after calculating tip, go to next screen
        performSegue(withIdentifier: "goToTotal", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTotal" {
            let totalTipVC = segue.destination as! ResultViewController
            totalTipVC.total = perPerson
            totalTipVC.totalPeople = numberPeople
            totalTipVC.tipPercent = percentTip
        }
        else {
            print("NO SUCH SEGUE")
        }
    }
}

