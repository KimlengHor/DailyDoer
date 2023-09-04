//
//  SaveTaskView.swift
//  DailyDoer
//
//  Created by Kimleng Hor on 7/30/23.
//

import SwiftUI

struct SaveTaskView: View {
    
    @EnvironmentObject private var vm: TaskViewModel
    
    @FocusState var focusedField: FocusField?
    
    @State private var taskText: String = ""
    @Binding var showSaveTaskView: Bool
    
    var body: some View {
        VStack {
            header
            taskTextField
            saveButton
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(Color(uiColor: .secondarySystemGroupedBackground))
        .cornerRadius(5)
        .padding(24)
        .onAppear {
            focusedField = .focus
        }
    }
}

struct SaveTaskView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            VStack {
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            
            SaveTaskView(showSaveTaskView: .constant(true))
        }
        .environmentObject(TaskViewModel())
    }
}

extension SaveTaskView {
    private var header: some View {
        ZStack(alignment: .trailing) {
            Text("Save Task")
                .font(.title3)
                .bold()
                .frame(maxWidth: .infinity)
            
            NeubrutalismButton(width: 30, height: 30, backgroundColor: Color.theme.red, action: {
                withAnimation(.easeInOut(duration: 0.1)) {
                    showSaveTaskView = false
                }
            }, label: Image(systemName: "xmark"))
        }
        .padding(.bottom, 23)
    }
    
    private var taskTextField: some View {
        NeubrutalismTextField(placeholder: "Write down your task here", taskText: $taskText)
            .padding(.bottom, 21)
            .focused($focusedField, equals: .focus)
    }
    
    private var saveButton: some View {
        NeubrutalismButton(maxWidth: .infinity, height: 40, backgroundColor: Color.theme.accent, action: {
            vm.addTask(title: taskText)
            withAnimation(.easeInOut(duration: 0.1)) {
                showSaveTaskView = false
            }
        }, label: Text("Save")
            .font(.callout)
            .bold())
    }
}
