//
//  ButtonView.swift
//  Trivia
//
//  Created by Marvin John on 08.07.24.
//

import SwiftUI


struct ButtonView: View {
    
    @ObservedObject var vm: TriviaViewModel
    @Environment(\.colorScheme) var colorScheme

    let title : String

    var body: some View {
        Button {
            
            vm.incrementCount()
         
                           
        } label: {

                ZStack{
                    Capsule()
                        .fill(colorScheme == .light ? .black.opacity(0.2) : Color.gray2)
                    Text(title)
                        .foregroundStyle(.white.opacity(0.7))
                        
                }
  

            
      
            
        }
        .frame(width:120 ,height: 60)
        .padding(.top)
    }
}

#Preview {
    ButtonView(vm: TriviaViewModel(), title: "Skip")
}
