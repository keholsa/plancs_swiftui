//
//  PlanCSApp.swift
//  PlanCS
//
//  Created by user234326 on 4/18/23.
//

import SwiftUI

@main
struct PlanCSApp: App {
    @StateObject var appEvents = CalendarFunctions(preview: true)

    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(UserModel())
                .environmentObject(appEvents) // projects appEvents

        }
    }
}
