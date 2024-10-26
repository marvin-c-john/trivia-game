//
//  AnswerView.swift
//  Trivia
//
//  Created by Marvin John on 08.07.24.
//

import SwiftUI

struct AnswerView: View {
    @ObservedObject var vm: TriviaViewModel
    @Environment(\.colorScheme) var colorScheme
    @State var answer: String
    var color: Color
    var body: some View {
        
        ZStack(alignment: .leading){
            
            RoundedRectangle(cornerRadius: 20)
                .fill(colorScheme == .light ? .white : .gray2  )
                .frame(height: 70)
                .shadow(radius: 3)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(color)
                        .frame(height: 70)
                        .blur(radius: 1.0)
                }
            
            
            
            HStack(spacing: 20) {
                
                Image(systemName: "circle.fill")
                    .foregroundStyle(colorScheme == .light ? .purple2 : .purple3)
                
                Text("\(answer)")
                    .foregroundStyle(colorScheme == .light ? .purple2 : .white)
                    .bold()
            }
            .padding(.leading, 20)
        }
        .padding(.bottom, 15)
    }
}

#Preview {
    AnswerView(vm: TriviaViewModel(), answer: "Heute", color: .clear)
}
