//
//  ReportItemView.swift
//  generic-api-backed
//
//  Created by Nolan Nguyen on 2/13/24.
//

import SwiftUI

struct ReportItemView: View {
    var report: SpaceFlightReport
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 375, height: 100)
                .cornerRadius(20)
                .foregroundColor(Color(red: 0, green: 0, blue: 0.5))
            
            HStack(alignment: .center) {
                AsyncImage(url: URL(string: report.image_url)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 75, height: 75)
                .cornerRadius(5.0)
                
                VStack(alignment: .leading) {
                    Text(report.title)
                        .foregroundStyle(.white)
                        .bold()
                        .multilineTextAlignment(.leading)
                    Text("via \(report.news_site)")
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
    ReportItemView(report: SpaceFlightReport(
        id: 1522,
        title: "ISS Daily Summary Report – 2/06/2024",
        url: "https://blogs.nasa.gov/stationreport/2024/02/06/iss-daily-summary-report-2-06-2024/",
        image_url: "https://upload.wikimedia.org/wikipedia/commons/8/8a/ISS_after_completion_%28as_of_June_2006%29.jpg",
        news_site: "NASA",
        summary: "Private Astronaut Mission (PAM) Axiom 3: Outreach, Commercial, and Payload Activities: The Ax-3 crew continues to wait for an undock opportunity. Throughout the day, they have recorded several outreach events and taken outreach and payload imagery. The crew have completed additional work on their National Lab-sponsored payloads ISOC and Ready Pasta. Alongside these payload activities, Marcus …",
        published_at: "2024-02-06T19:06:00Z",
        updated_at: "2024-02-07T19:06:47.353000Z"
    ))
}
