//
//  GreenThumbApp.swift
//  GreenThumb
//
//  Created by Sergio Altuzar on 07/06/25.
//

import SwiftUI

@main
struct GreenThumbApp: App {
    var body: some Scene {
        WindowGroup {
            VegetableTabBarScreen()
                .modelContainer(for: [Vegetable.self, MyGardenVegetable.self, Note.self])
        }
    }
}
