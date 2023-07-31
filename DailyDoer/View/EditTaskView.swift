//
//  EditTaskView.swift
//  DailyDoer
//
//  Created by Kimleng Hor on 7/30/23.
//

import SwiftUI

struct EditTaskView: View {
    
    @State private var taskText: String = ""
    
    var body: some View {
        VStack {
            header
            taskTextField
            buttons
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(.white)
        .cornerRadius(5)
        .padding(24)
       
    }
}

struct EditTaskView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            VStack {
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            
            EditTaskView()
        }
    }
}

extension EditTaskView {
    private var header: some View {
        ZStack(alignment: .trailing) {
            Text("Edit Task")
                .font(.title3)
                .bold()
                .frame(maxWidth: .infinity)
            
            Button {
                
            } label: {
                Image(systemName: "xmark")
                    .withNeubrutalismDesign(
                        width: 30,
                        height: 30,
                        backgroundColor: Color.theme.red)
            }
            .withScalingPressableStyle()
        }
        .padding(.bottom, 23)
    }
    
    private var taskTextField: some View {
        NeubrutalismTextField(placeholder: "Write down your task here", taskText: $taskText)
            .padding(.bottom, 21)
    }
    
    private var buttons: some View {
        HStack(spacing: 8) {
            Button {
                
            } label: {
                Text("Delete")
                    .font(.callout)
                    .bold()
                    .withNeubrutalismDesign(
                        width: 80,
                        height: 40,
                        backgroundColor: Color.theme.red)
            }
            .withScalingPressableStyle()
            
            Button {
                
            } label: {
                Text("Save")
                    .font(.callout)
                    .bold()
                    .withNeubrutalismDesign(
                        maxWidth: .infinity,
                        height: 40,
                        backgroundColor: Color.theme.accent)
            }
            .withScalingPressableStyle()
        }
    }
}
