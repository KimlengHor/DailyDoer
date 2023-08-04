//
//  InformationView.swift
//  DailyDoer
//
//  Created by Kimleng Hor on 7/30/23.
//

import SwiftUI

struct InformationView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            header
            Text("APP EXPERIENCE")
                .font(.footnote)
                .bold()
                .foregroundColor(Color.gray)
                .padding(.bottom, 10)
            VStack(spacing: 17) {
                
                NeubrutalismButton(maxWidth: .infinity, height: 48, action: {
                    
                }, label: informationButton(text: "Give Feedbacks"))
                
                NeubrutalismButton(maxWidth: .infinity, height: 48, action: {
                    
                }, label: informationButton(text: "Suggest Features"))
            }
            
            Text("MORE")
                .font(.footnote)
                .bold()
                .foregroundColor(Color.gray)
                .padding(.bottom, 10)
                .padding(.top, 30)
            
            VStack(spacing: 17) {
                
                NeubrutalismButton(maxWidth: .infinity, height: 48, action: {
                    
                }, label: informationButton(text: "Terms and condition"))
                
                
                NeubrutalismButton(maxWidth: .infinity, height: 48, action: {
                    
                }, label: informationButton(text: "Privacy Policy"))
                
                NeubrutalismButton(maxWidth: .infinity, height: 48, action: {
                    
                }, label: informationButton(text: "About Me"))
            }
            
            Spacer()
        }
        .padding(24)
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}

extension InformationView {
    private var header: some View {
        ZStack(alignment: .trailing) {
            Text("Information")
                .font(.title3)
                .bold()
                .frame(maxWidth: .infinity)

            NeubrutalismButton(width: 40, height: 40, backgroundColor: Color.theme.red, action: {
                dismiss()
            }, label: Image(systemName: "xmark"))
        }
        .padding(.bottom, 35)
    }
    
    private func informationButton(text: String) -> some View {
        HStack {
            Text(text)
                .font(.headline)
                .fontWeight(.medium)
            
            Spacer()
        }
        .padding(.leading, 15)
    }
}
