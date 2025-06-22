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
    @Environment(\.modelContext) private var context
    
    private func deleteMyGardenVegetable (at offsets: IndexSet) {
        offsets.forEach { index in
            let myGardenVegetable = myGardenVegetables[index]
            context.delete(myGardenVegetable)
            try? context.save()
        }
    }
    
    var body: some View {
        List {
            ForEach(myGardenVegetables) { myGardenVegetables in
                NavigationLink {
                    NoteListScreen(myGardenVegetable: myGardenVegetables)
                } label: {
                    MyGardenCellView(myGardenVegetable: myGardenVegetables)
                }
            }
            .onDelete(perform: deleteMyGardenVegetable)
        }
        .listStyle(.plain)
        .navigationTitle("My Garden")
    }
}

#Preview(traits: .sampleData) {
    NavigationStack {
        MyGardenScreen()
    }
}
