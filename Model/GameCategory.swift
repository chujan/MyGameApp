//
//  GameCategory.swift
//  MyGameApp
//
//  Created by Jennifer Chukwuemeka on 19/09/2022.
//

import Foundation


struct GameCategory: Codable {
    let populargame: PopularGame
}
struct PopularGame: Codable {
    let id: Int
    let title: String
    let thumbnail: String
    let shortDescription: String
    let gameURL: String?
    let genre: Genre
    let platform: Platform
    let publisher, developer, releaseDate: String
    let freetogameProfileURL: String?

    enum CodingKeys: String, CodingKey {
        case id, title, thumbnail
        case shortDescription = "short_description"
        case gameURL = "game_url"
        case genre, platform, publisher, developer
        case releaseDate = "release_date"
        case freetogameProfileURL = "freetogame_profile_url"
    }
}

enum Genre: String, Codable {
    case battleRoyale = "Battle Royale"
    case fighting = "Fighting"
    case genreMOBA = "MOBA"
    case mmo = "MMO"
    case mmofps = "MMOFPS"
    case mmorpg = "MMORPG"
    case moba = "Moba"
    case shooter = "Shooter"
    case strategy = "Strategy"
}

enum Platform: String, Codable {
    case pcWindows = "PC (Windows)"
    case pcWindowsWebBrowser = "PC (Windows), Web Browser"
    case webBrowser = "Web Browser"
}

typealias PopularGames = [PopularGame]

