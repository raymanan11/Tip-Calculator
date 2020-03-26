//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Raymond An on 3/25/20.


import UIKit

class ResultViewController: UIViewController {
    
    var total: Double?
    var totalPeople: Int?
    var tipPercent: String?
    
    @IBOutlet weak var totalPerPerson: UILabel!
    @IBOutlet weak var tipInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalPerPerson.text = "$" + String(format: "%.2f", total ?? 0.0)
        tipInfo.text = "Split between \(totalPeople ?? 0) people, with \(tipPercent ?? "0%") tip"
    }
    
    @IBAction func recalculate(_ sender: UIButton) {
        // dismiss the screen
        self.dismiss(animated: true, completion: nil)
    }
    

}
