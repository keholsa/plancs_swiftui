//
//  PlanCSApp.swift
//  PlanCS
//
//  Created by user234326 on 4/18/23.
//

import SwiftUI

@main
struct PlanCSApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(UserModel())

        }
    }
}
