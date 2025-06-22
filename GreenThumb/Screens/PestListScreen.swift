//
//  PestListScreen.swift
//  GreenThumb
//
//  Created by Sergio Altuzar on 21/06/25.
//

import SwiftUI

struct PestListScreen: View {
    
    let pests: [PestModel]
    @State private var search: String = ""
    
    private var filteredPest: [PestModel] {
        if search.isEmptyOrWhitespace {
            return pests
        } else {
            return pests.filter { $0.name.localizedCaseInsensitiveContains(search) }
        }
    }
    
    var body: some View {
        List(filteredPest) { pests in
            NavigationLink {
                PestDetailScreen(pest: pests)
            } label: {
                PestCellView(pest: pests)
            }
            
        }
        .searchable(text: $search)
        .listStyle(.plain)
        .navigationTitle("Pests")
    }
}

#Preview(traits: .sampleData) {
    NavigationStack {
        PestListScreen(pests: PreviewData.loadPests())
    }
}
