//
//  CartItem.swift
//  GraysarApp
//
//  Created by Madina Olzhabek on 05.06.2024.
//

import Foundation
import UIKit

struct CartItem: Codable {
    var name: String
    var price: String
    var image: String
    
    
    init(name: String, price: String, image: String) {
        self.name = name
        self.price = price
        self.image = image
        
    }
    
}
