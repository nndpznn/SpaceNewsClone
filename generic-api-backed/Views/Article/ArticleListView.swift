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
    @State var errorOccurred = false
    
    var body: some View {
//        if loading {
//            ProgressView()
//        } else if errorOccurred {
//            Text("Sorry, something went wrong.")
//        } else {
                NavigationStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "moon.stars.fill")
                                .foregroundStyle(.white)
                            Text("Recent Articles")
                                .font(.title)
                                .foregroundStyle(.white)
                            .bold()
                        }
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
                        Divider()
                    } .animation(.smooth)
                    
                    .padding()
                    .background(Color.gray)
                }
//        }
    }
    
    func loadArticles() async {
        errorOccurred = false
        loading = true
        
        do {
            let loadedArticles = try await getArticles()
            loading = false
            articles = loadedArticles.results
        } catch {
            errorOccurred = true
        }
        loading = false
    }
}

#Preview {
    ArticleListView()
}
