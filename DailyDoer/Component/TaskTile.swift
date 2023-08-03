//
//  TaskTile.swift
//  DailyDoer
//
//  Created by Kimleng Hor on 7/29/23.
//

import SwiftUI

struct TaskTile: View {
    
    let task: TaskEntity
    let completeAction: () -> Void
    let detailAction: () -> Void
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Button(action: detailAction, label: {
                HStack {
                    Text(task.title ?? "")
                        .font(.headline)
                        .fontWeight(.medium)
                    
                    Spacer()
                }
                .padding(.leading, 15)
                .withNeubrutalismDesign(maxWidth: .infinity, height: 48)
            })
            .withScalingPressableStyle()
            
            Button(action: completeAction, label: {
                VStack {
                    if task.isCompleted {
                        Image(systemName: "checkmark")
                    }
                }
                .withNeubrutalismDesign(width: 24, height: 24, backgroundColor: task.isCompleted ? Color.theme.green : Color.white, offsetVal: 2)
                .padding(.trailing, 15)
            })
            .withScalingPressableStyle()
        }
    }
}

struct TaskTile_Previews: PreviewProvider {
    
    static var previews: some View {
        TaskView()
    }
}
