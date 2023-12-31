//
//  TaskView.swift
//  DailyDoer
//
//  Created by Kimleng Hor on 7/27/23.
//

import SwiftUI

struct TaskView: View {
    
    @EnvironmentObject private var vm: TaskViewModel
    
    @State private var selection: PickerOption = .first
    
    @State private var showSaveTaskView = false
    @State private var showEditTaskView = false
    
    @State private var showInformationView = false
    
    var body: some View {
        ZStack {
            VStack {
                taskLargeTitle
                
                NeubrutalismPicker(firstOption: "Pending", secondOption: "Completed", selection: $selection)
                
                taskList
                
                addTaskButton
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
            
            saveTaskView
            
            editTaskView
        }
        .navigationTitle("DailyDoer")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                trailingToolbarItem
            }
        }
        .sheet(isPresented: $showInformationView) {
            InformationView()
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TaskView()
        }
        .environmentObject(TaskViewModel())
    }
}

extension TaskView {
    private var taskList: some View {
        VStack {
            if selection == .first {
                List {
                    pendingTaskList
                }
                .transition(.move(edge: .leading))
            } else {
                List {
                    completedTaskList
                        
                }
                .transition(.move(edge: .trailing))
            }
        }
        .listStyle(.plain)
        .padding(.horizontal, 12)
    }
    
    private var taskLargeTitle: some View {
        HStack {
            Text("Tasks")
                .font(.largeTitle)
                .bold()
            
            Spacer()
        }
        .padding(24)
    }
    
    private var trailingToolbarItem: some View {
        NeubrutalismButton(width: 40, height: 40, backgroundColor: Color.theme.orange, action: {
            showInformationView.toggle()
        }, label: Image(systemName: "info"))
    }
    
    private var addTaskButton: some View {
        NeubrutalismButton(width: 50, height: 50, backgroundColor: Color.theme.accent, action: {
            withAnimation(.easeInOut(duration: 0.1)) {
                showSaveTaskView = true
            }
        }, label: Image(systemName: "plus"))
    }
    
    private var pendingTaskList: some View {
        ForEach(vm.pendingTasks) { task in
            TaskTile(task: task) {
                vm.completeTask(task: task)
            } detailAction: {
                vm.selectedTask = task
                withAnimation(.easeInOut(duration: 0.1)) {
                    showEditTaskView = true
                }
            }
        }
    }
    
    private var completedTaskList: some View {
        ForEach(vm.completedTasks) { task in
            TaskTile(task: task) {
                
            } detailAction: {
                
            }
        }
    }
    
    private var saveTaskView: some View {
        VStack {
            if showSaveTaskView {
                SaveTaskView(showSaveTaskView: $showSaveTaskView)
                    .shadow(radius: 100)
                    .transition(.scale(scale: 1.2))
            }
        }
    }
    
    private var editTaskView: some View {
        VStack {
            if showEditTaskView {
                EditTaskView(taskText: vm.selectedTask?.title ?? "", showEditTaskView: $showEditTaskView)
                    .shadow(radius: 100)
                    .transition(.scale(scale: 1.2))
            }
        }
    }
}
