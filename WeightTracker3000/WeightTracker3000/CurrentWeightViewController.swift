//
//  CurrentWeightViewController.swift
//  WeightTracker3000
//
//  Created by Lliam on 5/16/19.
//  Copyright © 2019 Lliam. All rights reserved.
//

import UIKit

class CurrentWeightViewController: UIViewController {
    @IBOutlet weak var currentWeight: UITextField!
    @IBAction func saveCurrentWeight(_ sender: UIButton) {
        if let current = Double(currentWeight.text!) {
            currentGoal!.weights.append(current)
        }
    Goal.saveToFile(values: currentGoal!)
        
        
    }
    
    
    var currentGoal: Goal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(currentGoal!.goal)

        // Do any additional setup after loading the view.
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
