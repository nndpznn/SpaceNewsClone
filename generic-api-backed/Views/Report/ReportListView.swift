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
        .searchable(text: $searchText, prompt: "Search Reports")
        .onChange(of: searchText) {
            Task {
                await loadSearchReports(text: searchText)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
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
