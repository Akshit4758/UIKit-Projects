//
//  Game.swift
//  ApplePie
//
//  Created by Akshit Goyal on 22/07/25.
//

import Foundation

struct Game {
    var Word: String
    var IncorrectMovesRemaining: Int
    
    var guessedLetters: [Character]
    
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !Word.contains(letter) {
            IncorrectMovesRemaining -= 1
        }
    }
    
    var formattedWord: String {
        var guessedWord: String = ""
        for letter in Word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
}
