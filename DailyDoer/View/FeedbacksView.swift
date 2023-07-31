//
//  FeedbackView.swift
//  DailyDoer
//
//  Created by Kimleng Hor on 7/30/23.
//

import SwiftUI

struct FeedbacksView: View {
    @State private var taskText: String = ""
    
    var body: some View {
        VStack {
            header
            feedbacksTextField
            submitButton
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(.white)
        .cornerRadius(5)
        .padding(24)
       
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            VStack {
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            
            FeedbacksView()
        }
    }
}

extension FeedbacksView {
    private var header: some View {
        ZStack(alignment: .trailing) {
            Text("Feedbacks")
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
    
    private var feedbacksTextField: some View {
        NeubrutalismTextField(placeholder: "Write down your feedbacks here", taskText: $taskText)
            .padding(.bottom, 21)
    }
    
    private var submitButton: some View {
        Button {
            
        } label: {
            Text("Submit")
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

