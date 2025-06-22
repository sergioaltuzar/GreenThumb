//
//  PestListScreen.swift
//  GreenThumb
//
//  Created by Sergio Altuzar on 21/06/25.
//

import SwiftUI

struct PestListScreen: View {
    
    let pests: [PestModel]
    
    var body: some View {
        List(pests) { pests in
            PestCellView(pest: pests)
        }
        .listStyle(.plain)
        .navigationTitle("Pests")
    }
}

#Preview(traits: .sampleData) {
    NavigationStack {
        PestListScreen(pests: PreviewData.loadPests())
    }
}
