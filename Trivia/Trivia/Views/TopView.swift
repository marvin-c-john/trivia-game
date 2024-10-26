//
//  TopView.swift
//  Trivia
//
//  Created by Marvin John on 08.07.24.
//

import SwiftUI

struct TopView: View {
    @Environment(\.colorScheme) var colorScheme
    let count: Int
    var body: some View {
        HStack{
            Text("Trivia Game")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .foregroundStyle(colorScheme == .light ? .purple2 : .purple3)
            
            Spacer()
            
            Text("\(count + 1) out of 10")
                .bold()
            
        }
        .padding(.bottom, 30)
    }
}

#Preview {
    TopView(count: 1)
}
