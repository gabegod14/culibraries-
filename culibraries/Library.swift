//
//  Library.swift
//  culibraries
//
//  Created by Gabriel Godoy on 11/27/22.
//

import Foundation
import UIKit

class Library: Codable {
    var id : Int
    var picture: String
    var name: String
    var rateL: String
    var rate: String
    var description: String
    var addressLabel: String
    var link : String
    var canReserve: Bool
    var star: Bool
    var open_hour : Int
    var close_hour : Int
    var map_image : String
    
    
    init(picture: String, name: String, addressLabel: String, description: String, rateL: String, rate: String, link : String, canReserve: Bool, star: Bool, id : Int, map_image : String, open_hour : Int, close_hour : Int) {
        self.id = id
        self.picture = picture
        self.name = name
        self.rateL = rateL
        self.rate = rate
        self.description = description
        self.addressLabel = addressLabel
        self.link = link
        self.canReserve = canReserve
        self.star = star
        self.open_hour = open_hour
        self.close_hour = close_hour
        self.map_image = map_image
    }

    }
