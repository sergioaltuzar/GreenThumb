//
//  MyGardenScreen.swift
//  GreenThumb
//
//  Created by Sergio Altuzar on 10/06/25.
//

import SwiftUI
import SwiftData

struct MyGardenScreen: View {
    
    @Query private var myGardenVegetables: [MyGardenVegetable]
    
    var body: some View {
        List(myGardenVegetables) { myGardenVegetables in
            Text(myGardenVegetables.vegetable.name)
            
        }
    }
}

#Preview {
    NavigationStack {
        MyGardenScreen()
    }
    .modelContainer(previewContainer)
}
