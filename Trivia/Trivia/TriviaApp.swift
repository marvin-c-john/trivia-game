//
//  TriviaApp.swift
//  Trivia
//
//  Created by Marvin John on 08.07.24.
//

import SwiftUI

@main
struct TriviaApp: App {
    
    @StateObject private var vm = TriviaViewModel()
    
    var body: some Scene {
        WindowGroup {
            WelcomeView(vm: vm)
              
        }
    }
}
