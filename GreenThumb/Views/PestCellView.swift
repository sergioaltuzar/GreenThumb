//
//  PestCellView.swift
//  GreenThumb
//
//  Created by Sergio Altuzar on 22/06/25.
//

import SwiftUI

struct PestCellView: View {
    
    let pest: PestModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            AsyncImage(url: pest.photo) { image in
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [.green, .blue.opacity(0.3)]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 85, height: 85)
                        .shadow(color: .black.opacity(0.1), radius: 6, x:0, y:4)
                    
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 75, height: 75)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x:0, y:2)
                }
            } placeholder: {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [.green, .blue.opacity(0.3)]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 85, height: 85)
                        .shadow(color: .black.opacity(0.1), radius: 6, x:0, y:4)
                    
                    ProgressView()
                        .scaleEffect(1.2)
                        .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                }
            }
            VStack(alignment: .leading, spacing: 4)
            {
                Text(pest.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(pest.body)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
        }
    }
}

#Preview(traits: .sampleData) {
    PestCellView(pest: PreviewData.loadPests()[0])
}
