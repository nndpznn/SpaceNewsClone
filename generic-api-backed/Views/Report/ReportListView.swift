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
    @State private var searchText: String = ""
    
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
                        ForEach(reports) { report in
                            NavigationLink {
                                ReportDetailView(report: report)
                            } label: {
                                ReportItemView(report: report)
                            }
                        }
                    } .task {
                        await loadSearchReports()
                    }
                    .searchable(text: $searchText, prompt: "Search Reports")
                    .animation(.default)
                    
                    Divider()
                }
                .padding()
                .background(.black)
//                .preferredColorScheme(.dark)
//               Shooting stars
//                ForEach(0..<200) { _ in // Adjust the number of stars as needed
//                    StarView()
//                }
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
    
    func loadSearchReports() async {
        errorOccurred = false
        loading = true
        
        do {
            let loadedReports = try await getReportsSearch(query: searchText )
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
