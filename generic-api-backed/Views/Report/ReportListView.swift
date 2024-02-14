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
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Latest Reports")
                    .font(.title)
                    .bold()
                ScrollView {
                    ForEach(reports) { report in
                        NavigationLink {
                            ReportDetailView(report: report)
                        } label: {
                            ReportItemView(report: report)
                        }
                    }
                }
                .task {
                    await loadReports()
                }
            }
            .background(Color.gray)
        }
    }
    
    func loadReports() async {
        loading = true
        do {
            let loadedReports = try await getReports()
            loading = false
            reports = loadedReports.results
        } catch {
            // No-op: we’ll try again.
        }
    }
}

#Preview {
    ReportListView()
}
