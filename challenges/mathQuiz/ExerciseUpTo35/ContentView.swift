//
//  ContentView.swift
//  ExerciseUpTo35
//
//  Created by gülçin çetin on 10.08.2025.
//


import SwiftUI

struct Questions{
    var question: String
    var answers: [String]
    var correctAnswer: String
}

struct ContentView: View {
    @State private var currentIndex = 0
    @State private var answer = ""
    @State private var feedback = ""
    @State private var score = 0
    
    let questions = [
        Questions(question: "What is 2 x 2 = ?", answers: ["2", "4", "6"], correctAnswer: "4"),
        Questions(question: "What is 3 x 2 = ?", answers: ["2", "4", "6"], correctAnswer: "6"),
        Questions(question: "What is 3 x 3 = ?", answers: ["2", "4", "9"], correctAnswer: "9"),
        Questions(question: "What is 2 x 4 = ?", answers: ["2", "4", "8"], correctAnswer: "4")
    ]
    
    var body: some View {
        NavigationStack{
            ZStack {
                LinearGradient(colors: [.indigo, .mint, .orange, .yellow], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    Text((questions)[currentIndex].question).padding().font(.title)
                    
                    ForEach((questions)[currentIndex].answers, id: \.self) { ans in
                        HStack{
                            Image(systemName: "circle.fill")
                            Button(ans){
                                checkAnswer(ans)
                            }
                        }
                    }
                    .foregroundStyle(.indigo)
                    .font(.title2)
                    .padding()
                    
                    Text(feedback).font(.title3).padding()
                }
            }
            .navigationTitle("Math Quiz")
        }
    }
func checkAnswer(_ answer: String) {
        if answer == (questions)[currentIndex].correctAnswer{
            feedback = "Correct"
            score += 25
            currentIndex += 1
        } else {
            feedback = "Wrong"
            currentIndex += 1
        }
    }
}

#Preview {
    ContentView()
}
