//
//  SpaceFlightReport.swift
//  generic-api-backed
//
//  Created by Nolan Nguyen on 2/12/24.
//

import Foundation

struct SpaceFlightReport: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var url: String
    var image_url: String
    var news_site: String
    var summary: String
    var published_at: String
    var updated_at: String
    
}

struct SpaceFlightAPIPage: Hashable, Codable {
    var count: Int
    var results: [SpaceFlightReport]
}
