//
//  Extentions.swift
//  Pokemon
//
//  Created by Felipe Goncalves de Toledo on 13.01.23.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
