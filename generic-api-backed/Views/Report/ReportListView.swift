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
                        
                        Text("Latest Reports")
                            .font(.title)
                            .foregroundStyle(.white)
                            .bold()
                        
                        Spacer()
                        
                        SearchButton(isSet: $notSearching)
                    }
                    if reports.count > 0 {
                        ScrollView {
                            ForEach(reports) { report in
                                NavigationLink {
                                    ReportDetailView(report: report)
                                } label: {
                                    ReportItemView(report: report)
                                }
                            }
                        }
                        .animation(Animation.bouncy(duration: 1.0), value: reports)
//                        .animation(Animation.bouncy(duration: 1.0), value: appearing)
//                        .onAppear() {
//                            appearing = true
//                        }
                        
                        .navigationBarTitle("Latest Reports", displayMode: .inline).navigationBarHidden(notSearching)
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
                    await loadSearchReports(text: searchText)
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
