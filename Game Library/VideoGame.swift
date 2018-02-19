//
//  VideoGame.swift
//  Game Library
//
//  Created by Devin Cook on 2/19/18.
//  Copyright © 2018 Devin Cook. All rights reserved.
//

import Foundation

class VideoGame {
    var name: String
    var rating: Int
    var CheckedIn: Bool = true
    
    init(name: String, rating: Int, CheckedIn: Bool){
        self.name = name
        self.rating = rating
        self.CheckedIn = CheckedIn
    }
}
