//
//  ReportItemView.swift
//  generic-api-backed
//
//  Created by Nolan Nguyen on 2/13/24.
//

import SwiftUI

struct ArticleItemView: View {
    var article: SpaceFlightArticle
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 375, height: 120)
                .cornerRadius(20)
                .foregroundColor(Color(red: 0, green: 0, blue: 0.5))

            HStack(alignment: .center) {
                AsyncImage(url: URL(string: article.image_url)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 75, height: 75)
                .cornerRadius(15)

                VStack(alignment: .leading) {
                    Text(article.title)
                        .foregroundStyle(.white)
                        .bold()
                        .multilineTextAlignment(.leading)
                    Text("via \(article.news_site)")
                        .foregroundStyle(.white)
                        .italic()
            
                    
                }
                Spacer()
            }
            .padding(15)
        }
    }
}

#Preview {
    ArticleItemView(article: SpaceFlightArticle(
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
