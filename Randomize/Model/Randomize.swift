//
//  Randomize.swift
//  Randomize
//
//  Created by Rodrigo Sagebin on 3/2/18.
//  Copyright © 2018 Rodrigo Sagebin. All rights reserved.
//

import Foundation

class Entry: Codable {
    
    init (name: String) {
        self.name = name
    }
    var name: String
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    if lhs.name != rhs.name { return false }
    return true
}
