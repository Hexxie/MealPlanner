//
//  MealPlannerApp.swift
//  MealPlanner
//
//  Created by Анастасия Русакова on 11.08.2022.
//

import SwiftUI

@main
struct MealPlannerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
