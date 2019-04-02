//  Game.swift
//  Apple Pie
//
//  Created by Lliam on 3/13/19.
//  Copyright © 2019 Lliam. All rights reserved.
//

import Foundation
struct Game {
    // This function keep track of the letters that have been guessed by the user.
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
    var formattedWord: String {
        // This variable hides the letters that have not been guessed yet from the user.
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
}



