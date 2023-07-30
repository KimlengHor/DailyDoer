//
//  NeubrutalismPicker.swift
//  DailyDoer
//
//  Created by Kimleng Hor on 7/29/23.
//

import SwiftUI

enum PickerOption: String, CaseIterable, Identifiable {
    case first, second
    var id: Self { self }
}

struct NeubrutalismPicker: View {
    
    let firstOption: String
    let secondOption: String
    
    @Binding var selection: PickerOption
    
    var body: some View {
        ZStack(alignment: selection == .first ? .leading : .trailing) {
            VStack{}
            .frame(width: 267 / 2)
            .frame(maxHeight: .infinity)
            .background(Color.theme.blue)
            
            HStack(spacing: 0) {
                Button {
                    withAnimation(.easeInOut) {
                        selection = .first
                    }
                } label: {
                    if selection == .first {
                        selectedPickerButton(text: firstOption)
                    } else {
                        unselectedPickerButton(text: firstOption)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Button {
                    withAnimation(.easeInOut) {
                        selection = .second
                    }
                } label: {
                    if selection == .first {
                        unselectedPickerButton(text: secondOption)
                    } else {
                        selectedPickerButton(text: secondOption)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .padding(4)
        .withNeubrutalismDesign(width: 267, height: 48)
    }
    
    private func selectedPickerButton(text: String) -> some View {
        Text(text)
            .font(.callout)
            .bold()
    }
    
    private func unselectedPickerButton(text: String) -> some View {
        Text(text)
            .font(.callout)
            .foregroundColor(Color.gray)
    }
}

struct NeubrutalismPicker_Previews: PreviewProvider {
    
    static var previews: some View {
        NeubrutalismPicker(firstOption: "First", secondOption: "Second", selection: .constant(PickerOption.first))
    }
}
