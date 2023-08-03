//
//  DailyDoerApp.swift
//  DailyDoer
//
//  Created by Kimleng Hor on 7/27/23.
//

import SwiftUI

@main
struct DailyDoerApp: App {
    
    @StateObject private var vm = TaskViewModel()

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            NavigationStack {
                TaskView()
            }
            .environmentObject(vm)
        }
    }
}
