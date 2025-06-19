//
//  AddNoteScreen.swift
//  GreenThumb
//
//  Created by Sergio Altuzar on 16/06/25.
//

import SwiftUI
import SwiftData
import PhotosUI

struct AddNoteScreen: View {
    
    let myGardenVegetable: MyGardenVegetable
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var noteTitle: String = ""
    @State private var noteBody: String = ""
    @State private var selectedPhotoItem: PhotosPickerItem? = nil
    @State private var uiImage: UIImage?
    @State private var imageData: Data?
    
    private func saveNote() {
        let note = Note(title: noteTitle, body: noteBody)
        note.photo = imageData
        myGardenVegetable.notes?.append(note)
        try? context.save()
        dismiss()
    }
    
    var body: some View {
        Form {
            TextField("Title", text: $noteTitle)
            TextEditor(text: $noteBody)
                .frame(minHeight: 200)
            
            HStack(spacing: 20) {
                PhotosPicker(selection: $selectedPhotoItem, matching: .images, photoLibrary: .shared()) {
                    ZStack {
                        Circle()
                            .fill(Color.blue.opacity(0.2))
                            .frame(width: 40, height: 40)
                        Image(systemName: "photo.on.rectangle")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                }
            }.buttonStyle(.borderless)
            if let uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .frame(maxWidth: 300, maxHeight: 300)
                    .shadow(color: .gray.opacity(0.5), radius: 10, x:0, y:5)
                    .padding()
            }
        }
        .task(id: selectedPhotoItem) {
            if let selectedPhotoItem {
                do{
                    if let data = try await selectedPhotoItem.loadTransferable(type: Data.self){
                        uiImage = UIImage(data: data)
                        imageData = data
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    saveNote()
                }
                
            }
        }
    }
}

#Preview(traits: .sampleData) {
    
    @Previewable @Query var myGardenVegetable:[MyGardenVegetable]
    
    NavigationStack {
        AddNoteScreen(myGardenVegetable: myGardenVegetable[0])
    }
}
