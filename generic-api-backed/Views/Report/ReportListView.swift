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
                        await loadSearchReports(text: searchText)
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
//            .navigationTitle("Latest Reports")
            .searchable(text: $searchText, prompt: "Search Reports")
            .onChange(of: searchText) {
                Task {
                    await loadSearchReports(text: searchText)
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
    
    func loadSearchReports(text: String) async {
        errorOccurred = false
        loading = true
        
        do {
            let loadedReports = try await getReportsSearch(query: text)
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
