//
//  ViewController.swift
//  WeightTracker3000
//
//  Created by Lliam on 5/13/19.
//  Copyright © 2019 Lliam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentWeight: UITextField!
    @IBOutlet weak var goalWeight: UITextField!
    
    var newGoal: Goal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let goal = Goal.loadFromFile() {
            newGoal = goal
            performSegue(withIdentifier: "CurrentWeight", sender: Any?.self)
        }
    }
    
    @IBAction func checkAndMoveOn(_ sender: UIButton) {
        
        
        if let current = Double(currentWeight.text!) {
            if let goalLbs = Int(goalWeight.text!) {
                newGoal = Goal(goal: goalLbs, current: current)
            } else {
                showAlert()
            }
        } else {
            showAlert()
        }
        //var newGoal = Goal(goal: Int((goalWeight?.text)!)!, current: Double(currentWeight.text)!)
    }
    
        func showAlert() {
            let alert = UIAlertController(title: "Error In Entered Values", message: "Please make sure you are entering correct and healthy weight values", preferredStyle: .alert)
        
            alert.addAction(UIAlertAction(title: "Re-Enter", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            // https://learnappmaking.com/uialertcontroller-alerts-swift-how-to/
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "CurrentWeight" {
            let destination = segue.destination as! CurrentWeightViewController
            destination.currentGoal = newGoal
        }
        
    }
    
}
        

    





