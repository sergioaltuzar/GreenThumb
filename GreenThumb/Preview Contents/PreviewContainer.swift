//
//  PreviewContainer.swift
//  GreenThumb
//
//  Created by Sergio Altuzar on 10/06/25.
//

import Foundation
import SwiftData
import SwiftUI

struct SampleData: PreviewModifier {
    static func makeSharedContext() throws -> ModelContainer {
        previewContainer
    }
    
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
}

extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var sampleData: Self = .modifier(SampleData())
}

@MainActor
let previewContainer: ModelContainer = {
    
    let container = try! ModelContainer(for: Vegetable.self, MyGardenVegetable.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    let vegetables = PreviewData.loadVegetables().prefix(5)
    
    let gardeningNotes = [
        Note(title: "Planting Shedule", body: "Tomatoes: Spring, Carrots: Eraly Summer, Spinach: Late Summer"),
        Note(title: "soil pH", body: "add lime"),
        Note(title: "drip irrigation", body: "every 2 days"),
        Note(title: "compost", body: "make compost")
    ]
    
    for vegetable in vegetables {
        container.mainContext.insert(vegetable)
    }
    
    for vegetable in vegetables {
        let myGardenVegetable = MyGardenVegetable(vegetable: vegetable, plantOption: .seed)
        
        let randomNumber = Int.random(in: 0...1)
        if randomNumber == 1 {
            myGardenVegetable.notes = gardeningNotes
        }
        
        let daysAgo =  Int.random(in: 0...50)
        myGardenVegetable.datePlanted = Date().daysAgo(daysAgo)
        container.mainContext.insert(myGardenVegetable)
        
        
        container.mainContext.insert(myGardenVegetable)
    }
    
    return container
}()
