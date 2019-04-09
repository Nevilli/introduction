//
//  ViewController.swift
//  Login
//
//  Created by Lliam on 4/8/19.
//  Copyright © 2019 Lliam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var forgotUserNameButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else {return}
        // Sets the sender to a UIButton which always succeeds.
        if sender == forgotPasswordButton {
            segue.destination.navigationItem.title = "Forgot Password"
        } else if sender == forgotUserNameButton {
            segue.destination.navigationItem.title = "Forgot Username"
        } else {
            segue.destination.navigationItem.title =
            username.text
        }
    }

    @IBAction func forgotUsername(_ sender: UIButton) {
        performSegue(withIdentifier: "toLandingScreen", sender: forgotUserNameButton)
        // This method triggers the forgot username or password buttons.
    }
    @IBAction func forgotPassword(_ sender: UIButton) {
        performSegue(withIdentifier: "toLandingScreen", sender: forgotPasswordButton)
    }
    
}

