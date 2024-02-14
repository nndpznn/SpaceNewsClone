//
//  OurAPI.swift
//  generic-api-backed
//
//  Created by Nolan Nguyen on 2/12/24.
//

import Foundation

let SPACEFLIGHT_ROOT = "https://api.spaceflightnewsapi.net/v4"
let SPACEFLIGHT_ENDPOINT = "\(SPACEFLIGHT_ROOT)/reports/"

enum SpaceFlightAPIError: Error {
    case reportNotFound
    case unexpectedAPIError
}

func getReports() async throws -> SpaceFlightAPIPage {
    guard let url = URL(string: SPACEFLIGHT_ENDPOINT) else {
        fatalError("Should never happen, but just in case…URL didn’t work 😔")
    }

    let (data, _) = try await URLSession.shared.data(from: url)
    if let decodedReports = try? JSONDecoder().decode(SpaceFlightAPIPage.self, from: data) {
        return decodedReports
    } else {
        throw SpaceFlightAPIError.reportNotFound
    }
}

func getReportCount() async throws -> Int {
    guard let url = URL(string: SPACEFLIGHT_ENDPOINT) else {
        fatalError("Should never happen, but just in case…URL didn’t work 😔")
    }

    let (data, _) = try await URLSession.shared.data(from: url)
    if let decodedPage = try? JSONDecoder().decode(SpaceFlightAPIPage.self, from: data) {
        return decodedPage.count
    } else {
        // This shouldn’t really happen short of a breaking change in the API, but
        // we are obliged to do something.
        throw SpaceFlightAPIError.unexpectedAPIError
    }
}


let ARTICLESPACEFLIGHT_ENDPOINT = "\(SPACEFLIGHT_ROOT)/articles/"

func getArticles() async throws -> SpaceFlightArticleAPIPage {
    guard let url = URL(string: ARTICLESPACEFLIGHT_ENDPOINT) else {
        fatalError("Should never happen, but just in case…URL didn’t work 😔")
    }

    let (data, _) = try await URLSession.shared.data(from: url)
    if let decodedArticles = try? JSONDecoder().decode(SpaceFlightArticleAPIPage.self, from: data) {
        return decodedArticles
    } else {
        throw SpaceFlightAPIError.reportNotFound
    }
}

func getArticleCount() async throws -> Int {
    guard let url = URL(string: ARTICLESPACEFLIGHT_ENDPOINT) else {
        fatalError("Should never happen, but just in case…URL didn’t work 😔")
    }

    let (data, _) = try await URLSession.shared.data(from: url)
    if let decodedPage = try? JSONDecoder().decode(SpaceFlightArticleAPIPage.self, from: data) {
        return decodedPage.count
    } else {
        // This shouldn’t really happen short of a breaking change in the API, but
        // we are obliged to do something.
        throw SpaceFlightAPIError.unexpectedAPIError
    }
}
