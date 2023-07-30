//
//  TaskTile.swift
//  DailyDoer
//
//  Created by Kimleng Hor on 7/29/23.
//

import SwiftUI

struct TaskTile: View {
    
    let taskText: String
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Button {
                
            } label: {
                HStack {
                    Text(taskText)
                        .font(.headline)
                        .fontWeight(.medium)
                    
                    Spacer()
                }
                .padding(.leading, 15)
                .withNeubrutalismDesign(maxWidth: .infinity, height: 48)
            }
            .withScalingPressableStyle()
            
            Button {
                
            } label: {
                VStack {
                    
                }
                .withNeubrutalismDesign(width: 24, height: 24, offsetVal: 2)
                .padding(.trailing, 15)
            }
            .withScalingPressableStyle()
        }
    }
}

struct TaskTile_Previews: PreviewProvider {
    static var previews: some View {
        TaskTile(taskText: "Do my homework")
            .padding(24)
    }
}
