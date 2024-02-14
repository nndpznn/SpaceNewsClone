//
//  ReportListView.swift
//  generic-api-backed
//
//  Created by Nolan Nguyen on 2/13/24.
//

import SwiftUI

struct ReportListView: View {
    @State var reports: [SpaceFlightReport] = []
    @State var loading = false
    @State var errorOccurred = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // Black background
            

            
            // Your existing view hierarchy
            NavigationStack {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "moon.stars.fill")
                            .foregroundStyle(.white)
                        Text("Latest Reports")
                            .font(.title)
                            .foregroundStyle(.white)
                            .bold()
                    }
                    ScrollView {
                        ForEach(reports) { report in
                            NavigationLink {
                                ReportDetailView(report: report)
                            } label: {
                                ReportItemView(report: report)
                            }
                        }
                    } .task {
                        await loadReports()
                    } .animation(.smooth)
                    
                    Divider()
                }
                .padding()
                .preferredColorScheme(.dark)
                // Shooting stars
                ForEach(0..<200) { _ in // Adjust the number of stars as needed
                    StarView()
                }
            }
        }
    }
    
    func loadReports() async {
        errorOccurred = false
        loading = true
        
        do {
            let loadedReports = try await getReports()
            loading = false
            reports = loadedReports.results
        } catch {
            errorOccurred = true
        }
        loading = false
    }
}


#Preview {
    ReportListView()
}
