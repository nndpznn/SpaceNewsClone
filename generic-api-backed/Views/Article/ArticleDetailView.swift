//
//  ArticleDetailView.swift
//  generic-api-backed
//
//  Created by Nolan Nguyen on 2/13/24.
//

import SwiftUI

struct ArticleDetailView: View {
    @State private var imageSelected = false
    
    var article: SpaceFlightArticle
    
    var body: some View {
        VStack {
            Text(article.news_site)
                .font(.title)
                .bold()
            Text(article.title)
                .italic()
            
            Spacer()
            
            ScrollView {
                AsyncImage(url: URL(string: article.image_url)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 350, height: 300)
                .cornerRadius(10)
                
                Text("Published \(article.published_at)")
                    .italic()
                Text("\(article.news_site) - \(article.summary)")
                    .padding()
            } 
//            .animation(.default)
            
            Link("Read more from \(article.news_site)", destination: URL(string: article.url)!)
                .frame(width: 300, height: 25)
                .padding()
                .background(Color(red: 0, green: 0, blue: 0.5))
                .foregroundStyle(.white)
                .font(.title3)
                .bold()
                .clipShape(Capsule())
        }
        .background(Color(red: 0.93, green: 0.93, blue: 0.93))
        Divider()
    }
}

#Preview {
    ArticleDetailView(article: SpaceFlightArticle(
        id: 25570,
        title: "Space Force continues to tweak plans to partner with commercial industry",
        url: "https://spacenews.com/space-force-continues-to-tweak-plans-to-partner-with-commercial-industry/",
        image_url: "https://i0.wp.com/spacenews.com/wp-content/uploads/2024/02/240213-F-LE393-1238-scaled.jpg",
        news_site: "SpaceNews",
        summary: "The long-awaited commercial strategy is currently is being coordinated with the Office of the Secretary of Defense",
        published_at: "2024-02-13T23:20:56Z",
        updated_at: "2024-02-13T23:26:20.061000Z",
        featured: false
    ))
}
