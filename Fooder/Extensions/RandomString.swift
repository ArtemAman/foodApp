//
//  RandomString.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 15.02.2022.
//

import Foundation

extension String {
    
    static func random(length: Int = 1) -> String {
        let base = "abcdefghijklmnopqrstuvwxyz0123456789"
        var randomString: String = ""

        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
}
