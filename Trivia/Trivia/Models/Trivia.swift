//
//  Trivia.swift
//  Trivia
//
//  Created by Marvin John on 08.07.24.
//

import Foundation

struct Trivia: Identifiable, Hashable{
    let id = UUID()
    let count: Int
    let question: String
    var answers: [Answer]
    let correctAnswer: String
}
