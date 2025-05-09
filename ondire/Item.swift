//
//  Item.swift
//  ondire
//
//  Created by ruizvi | VIDAL RUIZ VARGAS on 09/05/25.
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
