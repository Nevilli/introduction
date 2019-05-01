//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Lliam on 4/18/19.
//  Copyright © 2019 Lliam. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var responses: [Answer]!

    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true

    }
    
    func calculatePersonalityResult() {
        // This stores the answers from the quiz and determines which animal type the user is.
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        let responseTypes = responses.map { $0.type}
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
            let frequentAnswersSorted =
                // This sorts the value pairs into separate arrays.
                frequencyOfAnswers.sorted(by: { (pair1, pair2) -> Bool in
                return pair1.value > pair2.value
            })
            
            let mostCommonAnswer = frequentAnswersSorted.first!.key
            
            
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }


}
