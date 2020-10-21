//
//  NewFolderView.swift
//  purenote
//
//  Created by Saša Mitrović on 19.10.20.
//

import SwiftUI

struct NewFolderView: View {
    @EnvironmentObject var data: DataManager
    @State private var folderName: String = ""
    @Binding var showSheetView: Bool

    var url: URL
    var body: some View {
        
        NavigationView {
                TextField("Enter a name for your new folder", text: $folderName)
                    .foregroundColor(Color(UIColor.label))

            .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topLeading)
            .padding(EdgeInsets(top: 25, leading: 5, bottom: 5, trailing: 5))
            
            .navigationBarTitle(Text("Create New Folder"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                print ("creating new folder at:"+url.path)
                let newUrl = url.appendingPathComponent(folderName)
                do {
                    try FileManager.default.createDirectory(at: newUrl, withIntermediateDirectories: false)
                }
                catch {
                    // failed
                    print("Failed to create directory: \(error).")
                }
                
                data.refresh(url: url)
                self.showSheetView = false
                
            }) {
                Text("Save").bold()
            })
        }

        
    }
}

struct NewFolderView_Previews: PreviewProvider {
    static var previews: some View {
        NewFolderView(showSheetView: .constant(false), url: URL(fileURLWithPath: "/new/path")).environmentObject(DataManager.sampleDataManager())
    }
}