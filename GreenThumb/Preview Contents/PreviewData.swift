//
//  PreviewData.swift
//  GreenThumb
//
//  Created by Sergio Altuzar on 09/06/25.
//

import Foundation

struct PreviewData {
    
    static func loadPests() -> [PestModel] {
        let vegetables = loadVegetables()
        let allPest = vegetables.flatMap { $0.pests ?? [] }
        
        return Array (Set(allPest.map { $0.name.lowercased() }))
            .compactMap { name in
                allPest.first { $0.name.lowercased() == name }
            }
    }
    
    static func loadVegetables() -> [Vegetable] {
        
        guard let url = Bundle.main.url(forResource: "vegetables", withExtension: "json") else {
            return []
        }
        do {
            let data = try Data(contentsOf: url)
            let vegetables = try JSONDecoder().decode([Vegetable].self, from: data)
            return vegetables
        } catch {
            return []
        }
    }
}
