//
//  NoteListScreen.swift
//  GreenThumb
//
//  Created by Sergio Altuzar on 16/06/25.
//

import SwiftUI
import SwiftData

struct NoteListScreen: View {
    
    let myGardenVegetable: MyGardenVegetable
    @State private var addNotePresented: Bool = false
    
    var body: some View {
        List(myGardenVegetable.notes ?? []) { note in
            Text(note.title)
            
        }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button ("Add Note") {
                        addNotePresented = true
                    }
                }
            }.sheet(isPresented: $addNotePresented) {
                
                NavigationStack {
                    AddNoteScreen(myGardenVegetable: myGardenVegetable)
                }
            }
    }
}

#Preview(traits: .sampleData) {
    
    @Previewable @Query var myGardenVegetables: [MyGardenVegetable]
    
    NavigationStack {
        NoteListScreen(myGardenVegetable: myGardenVegetables[0])
    }
}
