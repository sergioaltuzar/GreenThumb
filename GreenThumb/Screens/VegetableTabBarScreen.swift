//
//  VegetableTabBarScreen.swift
//  GreenThumb
//
//  Created by Sergio Altuzar on 09/06/25.
//

import SwiftUI

struct VegetableTabBarScreen: View {
    var body: some View {
        TabView {
            NavigationStack {
                VegetableListScreen()
            }.tabItem {
                Image(systemName: "leaf")
                Text("Vegetables")
            }
            NavigationStack {
                Text("MyGardenScreen")
            }.tabItem {
                Image(systemName: "house")
                Text("My Garden")
            }
            NavigationStack {
                Text("Pests")
            }.tabItem {
                Image(systemName: "ladybug")
                Text("Pest")
            }
        }
    }
}

#Preview {
    VegetableTabBarScreen()
}
