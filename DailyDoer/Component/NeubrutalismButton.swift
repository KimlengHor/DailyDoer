//
//  NeubrutalismButton.swift
//  DailyDoer
//
//  Created by Kimleng Hor on 7/31/23.
//

import SwiftUI

struct NeubrutalismButton<Label: View>: View {
    
    let maxWidth: CGFloat?
    let width: CGFloat?
    let height: CGFloat
    let backgroundColor: Color
    let offsetVal: CGFloat
    let action: () -> Void
    let label: Label
    
    init(maxWidth: CGFloat? = nil, width: CGFloat? = nil, height: CGFloat, backgroundColor: Color = .white, offsetVal: CGFloat = 4, action: @escaping () -> Void, label: Label) {
        self.maxWidth = maxWidth
        self.width = width
        self.height = height
        self.backgroundColor = backgroundColor
        self.offsetVal = offsetVal
        self.action = action
        self.label = label
    }
    
    var body: some View {
        Button(action: action, label: {
            label
                .withNeubrutalismDesign(
                    maxWidth: maxWidth,
                    width: width,
                    height: height,
                    backgroundColor: backgroundColor,
                    offsetVal: offsetVal
                )
        })
        .withScalingPressableStyle()
    }
}

struct NeubrutalismButton_Previews: PreviewProvider {
    static var previews: some View {
        NeubrutalismButton(maxWidth: .infinity, height: 40, backgroundColor: Color.theme.accent, action: {
            
        }, label: Text("Save")
            .font(.callout)
            .bold())
        .padding()
    }
}
