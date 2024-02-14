//
//  ArticleListView.swift
//  generic-api-backed
//
//  Created by Nolan Nguyen on 2/13/24.
//

import SwiftUI

struct ArticleListView: View {
    @State var articles: [SpaceFlightArticle] = []
    @State var loading = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Recent Articles")
                    .font(.title)
                    .bold()
                ScrollView {
                    ForEach(articles) { article in
                        NavigationLink {
                            ArticleDetailView(article: article)
                        } label: {
                            ArticleItemView(article: article)
                        }
                    }
                }
                .task {
                    await loadArticles()
                }
            }
            .background(Color.gray)
        }
    }
    
    func loadArticles() async {
        loading = true
        do {
            let loadedArticles = try await getArticles()
            loading = false
            articles = loadedArticles.results
        } catch {
            // No-op: we’ll try again.
        }
    }
}

#Preview {
    ArticleListView()
}
