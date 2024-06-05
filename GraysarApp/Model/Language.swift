//
//  Language.swift
//  GraysarApp
//
//  Created by Madina Olzhabek on 04.06.2024.
//

import Foundation
import UIKit

class Language {
    var name: String
    var image: String
    var price: String
    var added: Bool
    
    init(name: String, image: String, price: String, added: Bool) {
        self.name = name
        self.image = image
        self.price = price
        self.added = added
    }
}
