//
//  InformationView.swift
//  DailyDoer
//
//  Created by Kimleng Hor on 7/30/23.
//

import SwiftUI

struct InformationView: View {
    var body: some View {
        VStack(alignment: .leading) {
            header
            Text("APP EXPERIENCE")
                .font(.footnote)
                .bold()
                .foregroundColor(Color.gray)
                .padding(.bottom, 10)
            VStack(spacing: 17) {
                Button {
                    
                } label: {
                    HStack {
                        Text("Give Feedbacks")
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
                    HStack {
                        Text("Suggest Features")
                            .font(.headline)
                            .fontWeight(.medium)
                        
                        Spacer()
                    }
                    .padding(.leading, 15)
                    .withNeubrutalismDesign(maxWidth: .infinity, height: 48)
                }
                .withScalingPressableStyle()
            }
            
            Text("MORE")
                .font(.footnote)
                .bold()
                .foregroundColor(Color.gray)
                .padding(.bottom, 10)
                .padding(.top, 30)
            
            VStack(spacing: 17) {
                Button {
                    
                } label: {
                    HStack {
                        Text("Terms and condition")
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
                    HStack {
                        Text("Privacy Policy")
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
                    HStack {
                        Text("About me")
                            .font(.headline)
                            .fontWeight(.medium)
                        
                        Spacer()
                    }
                    .padding(.leading, 15)
                    .withNeubrutalismDesign(maxWidth: .infinity, height: 48)
                }
                .withScalingPressableStyle()
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

            Button {

            } label: {
                Image(systemName: "xmark")
                    .withNeubrutalismDesign(
                        width: 40,
                        height: 40,
                        backgroundColor: Color.theme.red)
            }
            .withScalingPressableStyle()
        }
        .padding(.bottom, 35)
    }
}
