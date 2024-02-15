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
                        
                        Text("Latest Reports")
                            .font(.title)
                            .foregroundStyle(.white)
                            .bold()
//                        Button("LAUNCH!") {
//                            Task {
//                                await loadReports()
//                            }
//                        }
//                        .frame(width: 100, height: 15)
//                        .padding()
//                        .background(Color(red: 0, green: 0, blue: 0.5))
//                        .foregroundStyle(.white)
//                        .font(.title3)
//                        .bold()
//                        .clipShape(Capsule())
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
                        await loadSearchArticles()
                    }
                    .searchable(text: $searchText, prompt: "Search Reports")
                    .animation(.default)
                    
                    Divider()
                }
                .padding()
                //               Shooting stars
            }
            .background(.black)
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
    
    func loadSearchArticles() async {
        errorOccurred = false
        loading = true
        
        do {
            let loadedArticles = try await getArticlesSearch(query: searchText )
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
