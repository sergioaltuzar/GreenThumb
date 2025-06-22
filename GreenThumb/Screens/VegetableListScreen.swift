//
//  ContentView.swift
//  GreenThumb
//
//  Created by Sergio Altuzar on 07/06/25.
//

import SwiftUI

struct VegetableListScreen: View {
    
    var vegetables: [Vegetable]
    
    var body: some View {
        List(vegetables) { vegetable in
            NavigationLink {
                VegetableDetailScreen(vegetable: vegetable)
            } label: {
                VegetableCellView(vegetable: vegetable)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Vegetables")
    }
}

#Preview {
    NavigationStack {
        VegetableListScreen(vegetables: PreviewData.loadVegetables())
    }
}
