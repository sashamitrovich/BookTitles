//
//  BookDetail.swift
//  ShareData
//
//  Created by Saša Mitrović on 03.10.20.
//

import SwiftUI

struct NoteEdit: View {
    @EnvironmentObject var data: DataManager
    @State var note: Note
    @Binding var showSheetView: Bool
    
    var noteIndex: Int {
        data.notes.firstIndex(where: { $0.id == note.id }) ?? Int.max
    }

    var body: some View {
        NavigationView {
           
            TextEditor(text: $note.content)
                .showIf(condition: noteIndex != Int.max)  // super ugly workaround, let's hope a user doesn't reach Int.max notes because that one will not be displayed
                    
                    .navigationBarItems(trailing:  Button(action: {
                        data.notes[noteIndex].content = note.content
                        updateNote()
    
                        
                    }) {
                        Text("Done").font(.title2).foregroundColor(Color(UIColor.systemOrange))
                    })
   
        }
    }
    
    func updateNote() {
        
        let documentURL = self.data.notes[noteIndex].url
        
        do {
            try self.data.notes[noteIndex].content.write(to: documentURL, atomically:true, encoding:String.Encoding.utf8)
        }
        catch {
            // failed
            print("Unexpected error, failed to update note: \(error).")
        }
        self.showSheetView = false
    }
}

struct NoteDetail_Previews: PreviewProvider {
    static var previews: some View {        
        NoteEdit(note: Note.sampleNote1, showSheetView: .constant(true) ).environmentObject(DataManager.sampleDataManager())
    }
}
