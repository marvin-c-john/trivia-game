//
//  ContentView.swift
//  Trivia
//
//  Created by Marvin John on 08.07.24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm: TriviaViewModel
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.colorScheme) var colorScheme
    @State var attempts: Int = 0
    
    var body: some View {
        
        //Light and Darkmode
        ZStack {
            Color(colorScheme == .light ? "cream" : "dark").ignoresSafeArea()
            
            
            VStack() {
                //Top Section
                TopView(count: vm.count)
                
                
                //ProgressBar
                ProgressBarView(vm: vm, percent: CGFloat(vm.count  ) / CGFloat(vm.trivia.count + 1) * 200)
                
                Spacer()
                
                //Question
                question
                
                //Answers
                
                ForEach(vm.trivia[vm.count].answers) { answer in
                    Button {
                        vm.checkAnswer(answer: answer.text)
                        withAnimation(.default) {
                            self.attempts += 1
                        }
                        if vm.selectedAnswer.isCorrect == false {
                            vm.vibrate()
                        }
                    } label: {
                        AnswerView(
                            vm: vm,
                            answer: answer.text,
                            color: vm.selectedAnswer.text == answer.text ?
                            (vm.selectedAnswer.isCorrect ? Color.lime : Color.clear) : Color.clear)
                        // shakes when question is wrong
                        .modifier(vm.selectedAnswer.text == answer.text ?(
                            vm.selectedAnswer.isCorrect ? Shake(animatableData: CGFloat(0)) : Shake(animatableData: CGFloat(attempts))) : Shake(animatableData: 0))
                        
                    }
                    .onAppear{
                        vm.trivia[vm.count].answers.shuffle()
                    }
                }
                .padding(.top, 5)
          
                //Button
                ButtonView(vm: vm, title: "Skip")
                
                Spacer()
            }
            .padding(25)
            
            //            .scaleEffect(horizontalSizeClass == .compact ? 0.85 : 1.0)
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

extension ContentView {
    var question: some View{
        Text(vm.trivia[vm.count].question)
            .font(.title3)
            .bold()
            .foregroundStyle(colorScheme == .light ? .gray : .white)
            .frame(height: 80)
    }
}


#Preview {
    ContentView(vm: TriviaViewModel())

}
