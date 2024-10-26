//
//  TriviaViewModel.swift
//  Trivia
//
//  Created by Marvin John on 08.07.24.
//
import SwiftUI
import Foundation
import AudioToolbox

class TriviaViewModel: ObservableObject{
    @Published var selectedAnswer: Answer = Answer(text: "", isCorrect: false)
    @Published var count: Int = 0
    @Published var count2: Int = 9
    @Published var color: Color = .green
    @Published var text: String = ""
    @Published var percent: CGFloat = 0
    @Published var isVibrating = false
    @Published var trivia : [Trivia] = [
        
        Trivia(count: 1,
               question: "Welches Jahr markiert den Beginn des Zweiten Weltkriegs?",
               answers: [
                Answer(text: "1938", isCorrect: false),
                Answer(text: "1939", isCorrect: false),
                Answer(text: "1940", isCorrect: false),
                Answer(text: "1941", isCorrect: false),
               ],
               correctAnswer: "1939"),
        
        Trivia(count: 2,
               question: "Welches ist das größte Land der Welt nach Fläche?",
               answers: [
                Answer(text: "Kanada", isCorrect: false),
                Answer(text: "China", isCorrect: false),
                Answer(text: "Russland", isCorrect: false),
                Answer(text: "USA", isCorrect: false),
               ],
               correctAnswer: "Russland"),
        
        Trivia(count: 3,
               question: "Was ist die chemische Formel für Wasser?",
               answers: [
                Answer(text: "CO2", isCorrect: false),
                Answer(text: "H2O", isCorrect: false),
                Answer(text: "O2", isCorrect: false),
                Answer(text: "H2SO4", isCorrect: false),
               ],
               correctAnswer: "H2O"),
        
        Trivia(count: 4,
               question: "Wer schrieb den Roman \"1984\"?",
               answers: [
                Answer(text: "Aldous Huxley", isCorrect: false),
                Answer(text: "George Orwell", isCorrect: false),
                Answer(text: "J.K. Rowling", isCorrect: false),
                Answer(text: "Ernest Hemingway", isCorrect: false),
               ],
               correctAnswer: "George Orwell"),
        
        Trivia(count: 5,
               question: "Welches Land hat die meisten FIFA-Weltmeisterschaften gewonnen?",
               answers: [
                Answer(text: "Deutschland", isCorrect: false),
                Answer(text: "Italien", isCorrect: false),
                Answer(text: "Argentinien", isCorrect: false),
                Answer(text: "Brasilien", isCorrect: false),
               ],
               correctAnswer: "Brasilien"),
        
        
        Trivia(count: 6,
               question: "Wer malte die \"Mona Lisa\"?",
               answers: [
                Answer(text: "Pablo Picasso", isCorrect: false),
                Answer(text: "Vincent van Gogh", isCorrect: false),
                Answer(text: "Michelangelo", isCorrect: false),
                Answer(text: "Leonardo da Vinci", isCorrect: false),
               ],
               correctAnswer: "Leonardo da Vinci"),
        
        Trivia(count: 7,
               question: "Welche Band wurde durch das Album \"Sgt. Pepper's Lonely Hearts Club Band\" weltberühmt?",
               answers: [
                Answer(text: "The Rolling Stones", isCorrect: false),
                Answer(text: "The Beatles", isCorrect: false),
                Answer(text: "Pink Floyd", isCorrect: false),
                Answer(text: "Led Zeppelin", isCorrect: false),
               ],
               correctAnswer: "The Beatles"),
        
        Trivia(count: 8,
               question: "Welches Unternehmen brachte das erste Smartphone mit Touchscreen auf den Markt?",
               answers: [
                Answer(text: "Nokia", isCorrect: false),
                Answer(text: "Samsung", isCorrect: false),
                Answer(text: "Apple", isCorrect: false),
                Answer(text: "Blackberry", isCorrect: false),
               ],
               correctAnswer: "Apple"),
        
        Trivia(count: 9,
               question: "Welcher Film gewann den Oscar für den besten Film im Jahr 2020?",
               answers: [
                Answer(text: "1917", isCorrect: false),
                Answer(text: "Joker", isCorrect: false),
                Answer(text: "Once Upon a Time in Hollywood", isCorrect: false),
                Answer(text: "Parasite", isCorrect: false),
               ],
               correctAnswer: "Parasite"),
        
        Trivia(count: 10,
               question: "Welcher Feiertag wird in den USA am vierten Donnerstag im November gefeiert?",
               answers: [
                Answer(text: "Unabhängigkeitstag", isCorrect: false),
                Answer(text: "Weihnachten", isCorrect: false),
                Answer(text: "Thanksgiving", isCorrect: false),
                Answer(text: "Halloween", isCorrect: false),
               ],
               correctAnswer: "Thanksgiving"),
    ]
    
    
    func checkAnswer(answer: String){
        
        if answer == trivia[count].correctAnswer{
            //Ausgewählte Antwort gleich Anwort gesetzt
            selectedAnswer.text = answer
            //Ausgewählte Anwtwort ist wahr
            selectedAnswer.isCorrect = true
            //Nächste Frage nach 3 sekunden
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                    self.selectedAnswer.isCorrect = false
               
                withAnimation {
                    self.incrementCount()
                }
            }
            
        } else {
            selectedAnswer.text = answer
        }
    }
    
    func incrementCount(){
        withAnimation {
            count += 1
        }
            
    }
    
    func vibrate(){
        AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) {}
    }
}
