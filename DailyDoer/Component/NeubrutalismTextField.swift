//
//  NeubrutalismTextField.swift
//  DailyDoer
//
//  Created by Kimleng Hor on 7/31/23.
//

import SwiftUI

struct NeubrutalismTextField: View {
    
    let placeholder: String
    @Binding var taskText: String
    
    var body: some View {
        VStack {
            TextField(placeholder, text: $taskText)
                .padding(.horizontal, 15)
                .withNeubrutalismDesign(maxWidth: .infinity, height: 48)
        }
    }
}

struct NeubrutalismTextField_Previews: PreviewProvider {
    static var previews: some View {
        NeubrutalismTextField(placeholder: "Hello", taskText: .constant("Love"))
    }
}
