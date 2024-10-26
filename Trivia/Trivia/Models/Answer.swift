//
//  Answer.swift
//  Trivia
//
//  Created by Marvin John on 08.07.24.
//
import SwiftUI
import Foundation

struct Answer: Identifiable, Hashable{
    let id = UUID()
    var text: String
    var isCorrect: Bool
}
