//
//  ServerConstants.swift
//  Fooder
//
//  Created by Максим Чикинов on 08.02.2022.
//

import Foundation

enum ServerConstants {
    static let baseUrl = URL(string: "https://hotels4.p.rapidapi.com")!
    static let requestHeader: [String: String] = [
        "x-rapidapi-host" : "hotels4.p.rapidapi.com",
        "x-rapidapi-key" : apiKey
    ]
    static let apiKey = "2c56ed9c53mshcf9fdeca17c2e41p128a8fjsne1acb4412108"
}

