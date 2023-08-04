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
//    let isCompleted: Bool
//
//    init(title: String) {
//        self.title = title
//        self.date = Date()
//        self.isCompleted = false
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
        do {
            pendingTasks = try container.fetchTask(isCompleted: false)
        } catch {
            print("Error fetching \(error.localizedDescription)")
        }
    }
    
    func fetchCompletedTasks() {
        do {
            completedTasks = try container.fetchTask(isCompleted: true)
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
            task.timestamp = Date()
            saveData()
        }
    }
}

extension NSPersistentContainer {
    func fetchTask(isCompleted: Bool) throws -> [TaskEntity] {
        let predicate = NSPredicate(format: "isCompleted = %@", NSNumber(value: isCompleted))
        let request = NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
        let sectionSortDescriptor = NSSortDescriptor(key: "timestamp", ascending: false)
        let sortDescriptors = [sectionSortDescriptor]
        
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        
        return try self.viewContext.fetch(request)
    }
}
