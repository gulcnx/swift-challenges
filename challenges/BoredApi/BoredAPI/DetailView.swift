//
//  DetailView.swift
//  BoredAPI
//
//  Created by gülçin çetin on 25.09.2025.
//

import SwiftUI

struct DetailView: View {
    var activity: Activity

    var body: some View {
        VStack {
                Text(activity.activity)
                Text(activity.type)
                Text("Participants: \(activity.participants)")
                Text("Price: \(activity.price)")
        }
    }
}
