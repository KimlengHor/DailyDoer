//
//  SaveTaskView.swift
//  DailyDoer
//
//  Created by Kimleng Hor on 7/30/23.
//

import SwiftUI

struct SaveTaskView: View {
    @State private var taskText: String = ""
    
    var body: some View {
        VStack {
            header
            taskTextField
            saveButton
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(.white)
        .cornerRadius(5)
        .padding(24)
       
    }
}

struct SaveTaskView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            VStack {
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            
            SaveTaskView()
        }
    }
}

extension SaveTaskView {
    private var header: some View {
        ZStack(alignment: .trailing) {
            Text("Save Task")
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
        TextField("Write down your task here", text: $taskText)
            .padding(.horizontal, 15)
            .withNeubrutalismDesign(maxWidth: .infinity, height: 48)
            .padding(.bottom, 21)
    }
    
    private var saveButton: some View {
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
