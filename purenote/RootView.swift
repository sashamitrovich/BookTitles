//
//  RootView.swift
//  purenote
//
//  Created by Saša Mitrović on 15.10.20.
//

import SwiftUI
import SwiftUIRefresh

struct RootView: View {
    var  data: DataManager
    @EnvironmentObject var index:SearchIndex
    
    var body: some View {
        NavigationView {
//            VStack {
                MenuView()
                    .environmentObject(index)
                    .environmentObject(data)
//            }
                   
        }
    }
    
    private var profileButton: some View {
        Button(action: { }) {
            Image(systemName: "person.crop.circle")
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(data: DataManager.sampleDataManager()).environmentObject(DataManager(url: URL(fileURLWithPath: "/")))
    }
}
