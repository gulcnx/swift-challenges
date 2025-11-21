//
//  Activity.swift
//  BoredAPI
//
//  Created by gülçin çetin on 25.09.2025.
//

import SwiftUI

struct Activity: Codable, Hashable{
    var activity: String = "zort"
    var type: String = ""
    var participants: Int = 1
    var price: Double = 0
}
