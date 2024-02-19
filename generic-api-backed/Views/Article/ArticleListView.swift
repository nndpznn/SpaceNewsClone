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
                    .animation(.default)
//                    .navigationBarTitle("Latest Reports", displayMode: .inline)
//                    .background(NavigationConfigurator { nc in
//                        nc.navigationBar.barTintColor = .blue
//                        nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
//                    })
//                    .navigationBarTitleDisplayMode(.inline)
//                    .navigationBarBackButtonHidden(true)
                    
                    Divider()
                    
                }
                .padding()
            }
            .background(.black)
        }
        .searchable(text: $searchText, prompt: "Search Articles")
        .onChange(of: searchText) {
            Task {
                await loadSearchArticles(text: searchText)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
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
