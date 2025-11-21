//
//  CreateImage.swift
//  RandomDogImages
//
//  Created by gülçin çetin on 24.09.2025.
//

import SwiftUI

struct CreateImage: View {
    @State private var dog = Dog()
    
    var body: some View {
        AsyncImage(url: URL(string: dog.message)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the iamge.")
            } else {
                ProgressView()
            }
        }
        .task {
            await loadPic()
        }
    }
    func loadPic() async {
        guard let url = URL(string: "https://dog.ceo/api/breeds/image/random") else { print("Invalid URL")
            return
        }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Dog.self, from: data){
                dog = decodedResponse
            }
        }
        catch{
            print("Invalid data")
        }
    }
}
