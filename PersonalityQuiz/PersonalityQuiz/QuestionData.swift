//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Lliam on 4/22/19.
//  Copyright © 2019 Lliam. All rights reserved.
//

import Foundation

struct Question {
    // This is the struct which houses the questions asked in the quiz.
    var text: String
    var type: ResponseType
    var answers: [Answer]
}
enum ResponseType {
    case single, multiple, ranged
}
struct Answer {
    // This keeps track of the answers submitted.
    var text: String
    var type: AnimalType
}
enum AnimalType: Character {
    case sheep = "🐑", monkey = "🐵", whale = "🐳", chicken = "🐓"
    
    var definition: String {
        switch self {
        case .sheep:
            return "You stick close to your peers when eating and become agitated when separated from the group."
        case .monkey:
            return "You're very agile and enjoy picking stuff from the hair of others."
        case .whale:
            return "You're the biggest animal on Earth and eat lots of krill."
        case .chicken:
            return "You make Chick-fil-a very happy."
        }
    }
}

