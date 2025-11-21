//
//  ContentView.swift
//  rockspaper
//
//  Created by gülçin çetin on 20.07.2025.
//

import SwiftUI

struct ContentView: View{
    init() {
           // Change font size for normal state
           UISegmentedControl.appearance().setTitleTextAttributes(
               [.font: UIFont.systemFont(ofSize: 24)], // bigger font here
               for: .normal
           )
           // Change font size for selected state
           UISegmentedControl.appearance().setTitleTextAttributes(
               [.font: UIFont.boldSystemFont(ofSize: 24)], // bigger font here
               for: .selected
           )
       }
    
    @State private var showingAlert = false
    @State private var questionCount = 0
    @State private var shouldWinText = ""
    @State private var shouldWin = false
    @State private var score = 0
    @State private var feedback = ""
    
    @State private var yourMove = ""
    
    @State private var i = Int.random(in: 0..<3)
    @State private var moves = ["rock","paper" ,"scissors" ]
    
    var body: some View{
        ZStack {
            LinearGradient(colors: [.purple, .indigo, .cyan ,.blue], startPoint: .topLeading, endPoint: .bottomLeading)
                .ignoresSafeArea()
            VStack {
                Text("Computer's move: \(moves[i])").padding().font(.title).foregroundStyle(.white)
                
                Text("You should try to...\(shouldWinText)").padding().font(.title).foregroundStyle(.white)
                
                Button("Tap here to decide your destiny!"){
                    shouldWin.toggle()
                    (shouldWin == true) ? (shouldWinText = "win!") : (shouldWinText = "lose!")
                }.padding().font(.title3).background(Color.primary).clipShape(.capsule).foregroundStyle(.white)
                
                Text("Choose Your Move!").font(.title).padding().foregroundStyle(.white)
                
                Picker("your move:", selection: $yourMove){
                    ForEach(moves, id: \.self){ move in
                        Text(move)
                    }
                }.pickerStyle(.segmented)
                .padding()
                
                
            
            Button("Play!"){
                //Tap to see who wins
                whoWins(yourMove)
                
                questionCount += 1
                if questionCount == 10 {
                    showingAlert = true
                }
            }.padding()
            .font(.title)
            .background(Color.indigo)
            .clipShape(.capsule)
            .foregroundStyle(.white)
            .alert(("Game ended!"), isPresented: $showingAlert){
                Button("TRY AGAIN") { }
            }message: {
                 Text("You score is \(score)")
            }
            
        Text(feedback).font(.title).padding()
        
        Button("Next!"){
            i = Int.random(in: 0..<3)
        }.padding()
        .background(Color.purple)
        .clipShape(.capsule)
        .foregroundStyle(.white)
           
        }.padding()
    }
}
    //functions
    func whoWins(_ yourMove: String) {
       // LOGIC OF WINNING
        if shouldWin{
            if moves[i] == "rock" && yourMove == "paper" {
                feedback = "You Win!"
                score += 10
            }else if moves[i] == "scissors" && yourMove == "rock" {
                feedback = "You Win!"
                score += 10
            }else if moves[i] == "paper" && yourMove == "scissors" {
                feedback = "You Win!"
                score += 10
            }else {
                feedback = "You Lose."
            }
        }else{
            if moves[i] == "rock" && yourMove != "paper" {
                feedback = "You Win!"
                score += 10
            }else if moves[i] == "scissors" && yourMove != "rock" {
                feedback = "You Win!"
                score += 10
            }else if moves[i] == "paper" && yourMove != "scissors" {
                feedback = "You Win!"
                score += 10
            }else {
                feedback = "You Lose."
            }
        }
    }
}

    
#Preview {
        ContentView()
}
