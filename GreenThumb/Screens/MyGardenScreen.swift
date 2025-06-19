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
            NavigationLink {
                NoteListScreen(myGardenVegetable: myGardenVegetables)
            } label: {
                MyGardenCellView(myGardenVegetable: myGardenVegetables)
            }
        }
        .listStyle(.plain)
        .navigationTitle("My Garden")
    }
}

#Preview {
    NavigationStack {
        MyGardenScreen()
    }
    .modelContainer(previewContainer)
}
