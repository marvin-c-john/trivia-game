//
//  WelcomeView.swift
//  Trivia
//
//  Created by Marvin John on 12.07.24.
//

import SwiftUI

struct WelcomeView: View {
    @ObservedObject var vm: TriviaViewModel
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        NavigationView {
            ZStack{
                Color(colorScheme ==  .light ? .cream : .dark).ignoresSafeArea()
                
                VStack(spacing: 40){
                    Text("Trivia Game")
                        .font(.title)
                        .bold()
                        .foregroundStyle(colorScheme == .light ? Color.purple2 : Color.purple3)
                    
                    Text("Ready to test out your trivia skills ?")
                        .foregroundStyle(colorScheme == .light ?  .purple2.opacity(1.0)  :  Color.purple3)
                        .padding()
                    
                    NavigationLink() {
                        ContentView(vm: vm)
                    } label: {
                        StartButtonView(title: "Let's go")
                           
                    }
                    
                }
            }
            .navigationBarBackButtonHidden(true)
            .onAppear{
                vm.trivia[vm.count].answers.shuffle()
            }
        }
    }
}

#Preview {
    WelcomeView(vm: TriviaViewModel())
}
