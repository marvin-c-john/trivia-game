//
//  EndView.swift
//  Trivia
//
//  Created by Marvin John on 12.07.24.
//

import SwiftUI

struct EndView: View {
    @ObservedObject var vm: TriviaViewModel
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack{
            Color.cream.ignoresSafeArea()
            
            VStack(spacing: 40){
                Text(" THE END")
                    .font(.title)
                    .bold()
                    .foregroundStyle(colorScheme == .light ? .purple2 : .purple3)
                
          
                
                Text("Want to play again ?")
                    .foregroundStyle(colorScheme == .light ? .purple2.opacity(1.0) : .purple3.opacity(1.0))
                    .padding()
                
                NavigationLink() {
                    ContentView(vm: vm)
                } label: {
                    StartButtonView(title: "Start Over")
                    
                    }
                .padding()
                }
            }
        }
    }

#Preview {
    EndView(vm: TriviaViewModel())
}
