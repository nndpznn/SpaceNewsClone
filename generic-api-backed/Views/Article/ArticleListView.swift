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
                            Text("New Articles")
                                .font(.title)
                                .foregroundStyle(.white)
                            .bold()
//                            Button("LAUNCH!") {
//                                Task {
//                                    await loadArticles()
//                                }
//                            }
//                            .frame(width: 100, height: 15)
//                            .padding()
//                            .background(Color(red: 0, green: 0, blue: 0.5))
//                            .foregroundStyle(.white)
//                            .font(.title3)
//                            .bold()
//                            .clipShape(Capsule())
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
                            await loadArticles()
                        }
                        Divider()
                    } 
                    .animation(.default)
                    
                    .padding()
                    .background(.black)
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
