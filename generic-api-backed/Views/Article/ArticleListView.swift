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
    @State private var searchText: String = ""
    
    var body: some View {
            // Your existing view hierarchy
        NavigationStack {
            ZStack {
                ForEach(0..<200) { _ in // Adjust the number of stars as needed
                    StarView()
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        
                        Image(systemName: "moon.stars.fill")
                            .foregroundStyle(.white)
                        
                        Text("Trending Articles")
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
                    } .task {
                        await loadSearchArticles(text: searchText)
                    }
//                    .onAppear {
//                        withAnimation(.easeInOut) {
//                            // Perform any animations here if needed
//                        }
//                    }
                    .animation(.default)
                    Divider()
                }
                .padding()
            }
            .background(.black)
//            .navigationTitle("Trending Articles")
            .searchable(text: $searchText, prompt: "Search Articles")
            .onChange(of: searchText) {
                Task {
                    await loadSearchArticles(text: searchText)
                }
            }
        }

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
    
    func loadSearchArticles(text: String) async {
        errorOccurred = false
        loading = true
        
        do {
            let loadedArticles = try await getArticlesSearch(query: text )
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
