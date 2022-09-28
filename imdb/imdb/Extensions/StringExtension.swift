//
//  StringExtension.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 28/9/22.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}
