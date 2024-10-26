//
//  ProgressBarView.swift
//  Trivia
//
//  Created by Marvin John on 09.07.24.
//

import SwiftUI

struct ProgressBarView: View {
    @ObservedObject var vm: TriviaViewModel
    @Environment(\.colorScheme) var colorScheme

    var width: CGFloat = 200
    var percent: CGFloat = 100
    var height: CGFloat = 20
    
    var body: some View {
        
        let multiplier = width / 100
        
        ZStack(alignment: .leading){
            
            ZStack(alignment: .trailing){
                Capsule().fill(colorScheme == .light ?  Color.black.opacity(0.08) : Color.gray)
                    .frame(height: height)
                
                
            }
            
            Capsule()
                .fill( colorScheme == .light ? Color.purple2 : Color.purple3)
                .frame(width: percent * multiplier, height: height)
        }
        .padding()
        
    }
}

#Preview {
    ProgressBarView(vm: TriviaViewModel())
}
