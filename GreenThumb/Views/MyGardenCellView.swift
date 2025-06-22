//
//  MyGardenCellView.swift
//  GreenThumb
//
//  Created by Sergio Altuzar on 10/06/25.
//

import SwiftUI
import SwiftData

struct MyGardenCellView: View {
    
    let myGardenVegetable: MyGardenVegetable
    
    var body: some View {
        HStack(alignment: .center, spacing: 16){
            AsyncImageCircle(imageURL: myGardenVegetable.vegetable.thumbnailImage)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(myGardenVegetable.vegetable.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                HStack {
                    Image(systemName: myGardenVegetable.plantOption.icon)
                        .foregroundColor(.green)
                    
                    if let notes = myGardenVegetable.notes {
                        if !notes.isEmpty {
                            Image(systemName:  "list.clipboard")
                                .foregroundColor(.green)
                        }
                    }
                }
            }
            Spacer()
            
            HarvestCountDownView(plantingData: myGardenVegetable.datePlanted, harvestingDays: myGardenVegetable.daysToHarvest)
            
        }
        .padding()
    }
}

#Preview {
    MyGardenCellView(myGardenVegetable: MyGardenVegetable(vegetable: PreviewData.loadVegetables()[0], plantOption: .seed))
}
