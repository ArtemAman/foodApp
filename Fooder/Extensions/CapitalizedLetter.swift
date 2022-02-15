//
//  CapitalizedLetter.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 15.02.2022.
//

import Foundation


extension String {
    func captalizeFirstCharacter() -> String {
        var result = self

        let substr1 = String(self[startIndex]).uppercased()
        result.replaceSubrange(...startIndex, with: substr1)

        return result
    }
}
