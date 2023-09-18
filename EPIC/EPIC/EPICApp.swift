//
//  EPICApp.swift
//  EPIC
//
//  Created by dante canizo on 18/09/2023.
//

import SwiftUI

@main
struct EPICApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
