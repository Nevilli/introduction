//
//  Goal.swift
//  WeightTracker3000
//
//  Created by Lliam on 5/13/19.
//  Copyright © 2019 Lliam. All rights reserved.
//

import Foundation

struct Goal: Codable {
    var goal: Int
    var current: Double

    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let saveURL = documentsDirectory.appendingPathExtension("Goal_file").appendingPathExtension("plist")
    
    static func saveToFile(weights: Goal) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedGoal = try? propertyListEncoder.encode(weights)
        try? encodedGoal?.write(to: saveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> Goal? {
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedGoal = try? Data(contentsOf:saveURL) {
            if let decodeGoal = try? propertyListDecoder.decode(Goal?.self, from: retrievedGoal) {
                return decodeGoal
            }
        }
        return nil
    }
}
