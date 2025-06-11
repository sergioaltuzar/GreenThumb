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
        AsyncImageCircle(imageURL: myGardenVegetable.vegetable.thumbnailImage)
    }
}

#Preview {
    MyGardenCellView(myGardenVegetable: MyGardenVegetable(vegetable: PreviewData.loadVegetables()[0], plantOption: .seed))
}
