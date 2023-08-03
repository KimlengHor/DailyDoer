//
//  TaskViewModel.swift
//  DailyDoer
//
//  Created by Kimleng Hor on 8/1/23.
//

import Foundation
import CoreData
import SwiftUI

//struct Task {
//    let title: String
//    let date: Date
//
//    init(title: String) {
//        self.title = title
//        self.date = Date()
//    }
//}

class TaskViewModel: ObservableObject {
    let container: NSPersistentContainer
    
    @Published var pendingTasks: [TaskEntity] = []
    @Published var completedTasks: [TaskEntity] = []
    
    var selectedTask: TaskEntity?
    
    init() {
        container = NSPersistentContainer(name: "DailyDoer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                
            }
        }
        
        fetchTasks()
    }
    
    private func getSortDescriptors() -> [NSSortDescriptor] {
        let sectionSortDescriptor = NSSortDescriptor(key: "timestamp", ascending: false)
        let sortDescriptors = [sectionSortDescriptor]
        return sortDescriptors
    }
    
    func fetchTasks() {
        fetchPendingTasks()
        fetchCompletedTasks()
    }
    
    func fetchPendingTasks() {
        let predicate = NSPredicate(format: "isCompleted = %@", NSNumber(value: false))
        let request = NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
        
        request.predicate = predicate
        request.sortDescriptors = getSortDescriptors()
        
        do {
            pendingTasks = try container.viewContext.fetch(request)
        } catch {
            print("Error fetching \(error.localizedDescription)")
        }
    }
    
    func fetchCompletedTasks() {
        let predicate = NSPredicate(format: "isCompleted = %@", NSNumber(value: true))
        let request = NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
        
        request.predicate = predicate
        request.sortDescriptors = getSortDescriptors()
        
        do {
            completedTasks = try container.viewContext.fetch(request)
        } catch {
            print("Error fetching \(error.localizedDescription)")
        }
    }
    
    func addTask(title: String) {
        let newTask = TaskEntity(context: container.viewContext)
        newTask.title = title
        newTask.timestamp = Date()
        newTask.isCompleted = false
        saveData()
    }
    
    func editTask(title: String) {
        guard let task = selectedTask else { return }
        task.title = title
        saveData()
    }
    
    func saveData(isCompleted: Bool = false) {
        do {
            try container.viewContext.save()
            fetchTasks()
        } catch {
            print("Error saving \(error.localizedDescription)")
        }
    }
    
    func completeTask(task: TaskEntity) {
        withAnimation(.easeInOut) {
            task.isCompleted = true
            saveData()
        }
    }
}
