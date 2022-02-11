//
//  Drink_CounterApp.swift
//  Drink Counter WatchKit Extension
//
//  Created by Vivek Bhookya on 11/4/21.
//

import SwiftUI

@main
struct Drink_CounterApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
