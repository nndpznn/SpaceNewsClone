//
//  ReportsArticlesHomeView.swift
//  generic-api-backed
//
//  Created by Nolan Nguyen on 2/14/24.
//

import SwiftUI

struct ReportsArticlesHomeView: View {
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
    ReportsArticlesHomeView()
}
