//
//  LearningApp.swift
//  Learning
//
//  Created by Baptiste Chachura on 03/05/2026.
//

import SwiftUI
import SwiftData

@main
struct LearningApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup{
            NavigationStack {
                VStack {
                    NavigationLink("Content View") { ContentView()}
                    NavigationLink("Notification"){NotificationView()}
                    NavigationLink("test storyboard"){story()}
                }
            }}.modelContainer(sharedModelContainer)
    }
}
