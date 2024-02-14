//
//  ContentView.swift
//  generic-api-backed
//
//  Created by Nolan Nguyen on 2/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            ReportListView()
                .tabItem {
                    Label("Reports", systemImage: "note.text")
                }
            ArticleListView()
                .tabItem {
                    Label("Articles", systemImage: "doc.append")
                }

        }
    }
}

#Preview {
    ContentView()
}
