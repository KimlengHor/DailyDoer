//
//  EditTaskView.swift
//  DailyDoer
//
//  Created by Kimleng Hor on 7/30/23.
//

import SwiftUI

struct EditTaskView: View {
    
    @EnvironmentObject private var vm: TaskViewModel
    
    @State var taskText: String
    @Binding var showEditTaskView: Bool
    
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

//struct EditTaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack {
//            VStack {
//
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(.black)
//
//            EditTaskView()
//        }
//    }
//}

extension EditTaskView {
    private var header: some View {
        ZStack(alignment: .trailing) {
            Text("Edit Task")
                .font(.title3)
                .bold()
                .frame(maxWidth: .infinity)
            
            NeubrutalismButton(width: 30, height: 30, backgroundColor: Color.theme.red, action: {
                withAnimation(.easeInOut(duration: 0.1)) {
                    showEditTaskView = false
                }
            }, label: Image(systemName: "xmark"))
        }
        .padding(.bottom, 23)
    }
    
    private var taskTextField: some View {
        NeubrutalismTextField(placeholder: "Write down your task here", taskText: $taskText)
            .padding(.bottom, 21)
    }
    
    private var buttons: some View {
        HStack(spacing: 8) {
            
            NeubrutalismButton(width: 80, height: 40, backgroundColor: Color.theme.red, action: {
                
            }, label: Text("Delete")
                .font(.callout)
                .bold())
            
            NeubrutalismButton(maxWidth: .infinity, height: 40, backgroundColor: Color.theme.accent, action: {
                vm.editTask(title: taskText)
                withAnimation(.easeInOut(duration: 0.1)) {
                    showEditTaskView = false
                }
            }, label: Text("Save")
                .font(.callout)
                .bold())
        }
    }
}
