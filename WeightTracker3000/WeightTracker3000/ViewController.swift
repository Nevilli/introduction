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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func checkAndMoveOn(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Error In Entered Values", message: "Please make sure you are entering correct and healthy weight values", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Re-Enter", style: .cancel, handler: nil))
        if currentWeight = Double(self) {
            
            self.present(alert, animated: true)
            
        }
        // https://learnappmaking.com/uialertcontroller-alerts-swift-how-to/
    }


}

