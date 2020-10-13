//
//  Note.swift
//  ShareData
//
//  Created by Saša Mitrović on 08.10.20.
//

import Foundation


struct Note: Identifiable, Equatable, Item {
    var type: ItemType
    
    static func == (lhs: Note, rhs: Note) -> Bool {
        return lhs.content == rhs.content
    }
    
    var id: String
    var content: String
    var date: Date
    var isLocal: Bool = true
    var url: URL
    var isDownloading = false
    var label = ""
    
    init(type: ItemType) {
        self.id=String(Date().currentTimeMillis())
        self.content=""
        self.date=Date()
        self.isLocal=true
        self.url=URL(fileURLWithPath: "")
        self.type = type
    }
    
    init(content:String, date:Date, path:String, isLocal:Bool?, url: URL, type: ItemType, label: String! = "") {
        self.id=path
        self.content=content
        self.date=date
        self.isLocal=isLocal ?? true
        self.url = url
        self.type = type
        
        if (id.contains(".icloud")) {
            self.label = self.id
            self.label.removeFirst()
            self.label.removeLast(7)
        }
        
    }
    
}
