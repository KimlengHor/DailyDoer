//
//  NeubrutalismViewModifier.swift
//  DailyDoer
//
//  Created by Kimleng Hor on 7/27/23.
//

import Foundation
import SwiftUI

struct NeubrutalismViewModifier: ViewModifier {
    
    let maxWidth: CGFloat?
    let width: CGFloat?
    let height: CGFloat
    let backgroundColor: Color
    let offsetVal: CGFloat
    
    func body(content: Content) -> some View {
        ZStack {
            VStack {}
                .frame(maxWidth: maxWidth)
                .frame(width: width, height: height)
                .background(Color(uiColor: .label))
                .cornerRadius(2)
                .offset(x: offsetVal, y: offsetVal)
            
            content
                .foregroundColor(Color(uiColor: .label))
                .frame(maxWidth: maxWidth)
                .frame(width: width, height: height)
                .background(backgroundColor)
                .border(Color(uiColor: .label), width: 2)
                .cornerRadius(2)
        }
    }
}

extension View {
    func withNeubrutalismDesign(maxWidth: CGFloat? = nil, width: CGFloat? = nil, height: CGFloat, backgroundColor: Color = Color(uiColor: .systemBackground), offsetVal: CGFloat = 4) -> some View {
        modifier(NeubrutalismViewModifier(maxWidth: maxWidth, width: width, height: height, backgroundColor: backgroundColor, offsetVal: offsetVal))
    }
}
