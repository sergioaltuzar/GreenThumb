//
//  PreviewContainer.swift
//  GreenThumb
//
//  Created by Sergio Altuzar on 10/06/25.
//

import Foundation
import SwiftData

let previewContainer: ModelContainer = {
    
    let container = try! ModelContainer(for: Vegetable.self, MyGardenVegetable.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    return container
}()
