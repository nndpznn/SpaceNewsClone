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
    @State var notSearching: Bool = true
    @State var appearing: Bool = false
    
    var body: some View {

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
                        
                        Spacer()
                        
                        SearchButton(isSet: $notSearching)
                    }
                    if articles.count > 0 {
                        ScrollView {
                            ForEach(articles) { article in
                                NavigationLink {
                                    ArticleDetailView(article: article)
                                } label: {
                                    ArticleItemView(article: article)
                                }
                            }
                        }
                        .animation(Animation.bouncy(duration: 1.0), value:articles)
//                        .animation(Animation.bouncy(duration: 1.0), value: appearing)
//                        .onAppear() {
//                            appearing = true
//                        }
                        
                        .navigationBarTitle("Trending Articles", displayMode: .inline).navigationBarHidden(notSearching)
                    } else {
                        Divider()
                        VStack(alignment: .center) {
                            
                            Text("Sent our satellites out... couldn't find a thing.")
                                .foregroundStyle(.white)
                                .font(.headline)
                            
                            Spacer()
                            
                            Text("Maybe your answer is in these stars?")
                                .foregroundStyle(.white)
                                .font(.headline)
                        }
                    }
                } .task {
                    await loadSearchArticles(text: searchText)
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
