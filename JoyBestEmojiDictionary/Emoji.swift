//
//  Emoji.swift
//  JoyBestEmojiDictionary
//
//  Created by JOY BEST on 9/20/19.
//  Copyright © 2019 JOY BEST. All rights reserved.
//

import Foundation
struct Emoji {
    var symbol: String
    var name:   String
    var description:    String
    var usage:  String
    init(symbol: String, name: String, description: String, usage: String) {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
}


