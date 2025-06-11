//
//  VegetableCellView.swift
//  GreenThumb
//
//  Created by Sergio Altuzar on 09/06/25.
//

import SwiftUI

struct VegetableCellView: View {
    
    let vegetable: Vegetable
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            AsyncImageCircle(imageURL: vegetable.thumbnailImage)
            VStack(alignment: .leading, spacing: 4) {
                Text(vegetable.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(vegetable.body)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
        }
    }
}

#Preview {
    VegetableCellView(vegetable: PreviewData.loadVegetables()[0])
}
