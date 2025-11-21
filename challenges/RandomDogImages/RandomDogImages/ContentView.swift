//
//  ContentView.swift
//  RandomDogImages
//
//  Created by gülçin çetin on 24.09.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            NavigationLink("Tap here to create random dog image", destination: CreateImage())
        }
    }
}

