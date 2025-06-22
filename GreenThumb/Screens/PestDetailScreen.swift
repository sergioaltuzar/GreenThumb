//
//  PestDetailScreen.swift
//  GreenThumb
//
//  Created by Sergio Altuzar on 22/06/25.
//

import SwiftUI

struct PestDetailScreen: View {
    
    let pest: PestModel
    
    var body: some View {
        ScrollView {
            AsyncImage(url: pest.photo) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 250)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            } placeholder: {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: 250)
            }
            SectionView(
                iconName: "info.circle",
                title: "Description",
                content: pest.body
            )
            
            SectionView(
                iconName: "exclamationmark.triangle",
                title: "Symptoms",
                content: pest.symptoms
            )
            
            SectionView(
                iconName: "bandage",
                title: "Treatment",
                content: pest.treatment
            )
        }
        .padding()
        .navigationTitle(pest.name)
    }
}


struct SectionView: View {
    
    let iconName: String
    let title: String
    let content: String
    
    var body : some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: iconName)
                    .foregroundColor(.blue)
                    .font(.title2)
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            Text(content)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
        }
        .padding(.vertical, 8)
    }
    
}

#Preview(traits: .sampleData) {
    NavigationStack {
        PestDetailScreen(pest: PreviewData.loadPests()[0])
    }
}
