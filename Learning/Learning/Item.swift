//
//  Item.swift
//  Learning
//
//  Created by Baptiste Chachura on 03/05/2026.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
