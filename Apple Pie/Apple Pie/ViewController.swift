//
//  ViewController.swift
//  Apple Pie
//
//  Created by Lliam on 3/11/19.
//  Copyright © 2019 Lliam. All rights reserved.
//  This file creates a word guessing game called apple pie.

import UIKit

class ViewController: UIViewController {
    
    var currentGame: Game!
    
    var listOfWords = ["horse", "ball"]
    
let incorrectMovesAllowed = 7
    
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    func newRound() {
        // This function re-enables all of the buttons at the start of a new round and then disables them when there are no more words to be guessed.
        if !listOfWords.isEmpty {
        
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } else {
        enableLetterButtons(false)
        }
    }
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    
}
    
    func updateUI() {
        // This function addes spaces between the letters in order to make it easier to understand for the user.
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        
    }

    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    @IBAction func buttonPressed(_ sender: UIButton) {
        // This function disables the buttons after the user presses them in a round.
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    func updateGameState() {
        // This function determines if the user has won or lost the round and then starts a new one.
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        } else {
            updateUI()
        }
    }
}

