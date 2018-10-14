//
//  Winner.swift
//  DauletKshibekov_iOS_CourseProject
//
//  Created by Daulet Kshibekov on 5/16/18.
//  Copyright © 2018 Daulet Kshibekov. All rights reserved.
//

import Foundation

struct Winner {
    let name: String
    let difficulty: String
    let timeSeconds: Int
    let timeFormatted: String
    
    init (name: String, difficulty: String, timeSeconds: Int, timeFormatted: String){
        self.name = name
        self.difficulty = difficulty
        self.timeSeconds = timeSeconds
        self.timeFormatted = timeFormatted
    }
}
