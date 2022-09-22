//
//  GameData.swift
//  MyGameApp
//
//  Created by Jennifer Chukwuemeka on 18/09/2022.
//

import Foundation
struct GameData: Codable {
    let gameElement: GameElement
}
struct GameElement: Codable {
    let id: Int
    let title: String
    let thumbnail: String
    let shortDescription: String
    let gameURL: String?
   // let genre: Genre
   // let platform: Platform
    let publisher, developer, releaseDate: String
    let freetogameProfileURL: String

    enum CodingKeys: String, CodingKey {
        case id, title, thumbnail
        case shortDescription = "short_description"
        case gameURL = "game_url"
        case  publisher, developer
        case releaseDate = "release_date"
        case freetogameProfileURL = "freetogame_profile_url"
    }
}

//enum Genre: String, Codable {
//    case actionRPG = "Action RPG"
//    case arpg = "ARPG"
//    case battleRoyale = "Battle Royale"
//    case cardGame = "Card Game"
//    case fantasy = "Fantasy"
//    case fighting = "Fighting"
//    case genreMOBA = "MOBA"
//    case mmo = "MMO"
//    case mmoarpg = "MMOARPG"
//    case mmofps = "MMOFPS"
//    case mmorpg = "MMORPG"
//    case moba = "Moba"
//    case racing = "Racing"
//    case shooter = "Shooter"
//    case social = "Social"
//    case sports = "Sports"
//    case strategy = "Strategy"
//}

//enum Platform: String, Codable {
//    case pcWindows = "PC (Windows)"
//    case pcWindowsWebBrowser = "PC (Windows), Web Browser"
//}

typealias Game = [GameElement]
