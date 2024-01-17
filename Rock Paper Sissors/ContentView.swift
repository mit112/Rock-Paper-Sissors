//
//  ContentView.swift
//  Rock Paper Sissors
//
//  Created by Mit Sheth on 1/17/24.
//

import SwiftUI

struct ContentView: View {
    @State private var hands = ["Paper", "Paper", "Scissor"]
    @State private var currentChoice = ""
    @State private var shouldWin = Bool.random()
    @State private var currentScore = 0
    @State private var opponentHand = ""
    @State private var gameNum = 0
    @State private var gameIsOver = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                VStack {
                    Text("Your Score:- \(currentScore)")
                    Text("Your opponent plays:- \(opponentHand)")
                    Text("You should \(shouldWin ? "win" : "lose") this game!" as String)
                }
                .foregroundStyle(.black)
                .font(.title2)
                Spacer()
                
                
                HStack {
                    Button {
                        currentChoice = "Rock"
                        gameOver()
                        shouldWin.toggle()
                    }
                label: {
                    Image(systemName: "basketball")
                }
                    Button {
                        currentChoice = "Paper"
                        gameOver()
                        shouldWin.toggle()
                    }
                label: {
                    Image(systemName: "newspaper")
                }
                    Button {
                        currentChoice = "Scissor"
                        gameOver()
                        shouldWin.toggle()
                    }
                label: {
                    Image(systemName: "scissors")
                }
                }
                .font(.system(size: 80))
                .foregroundStyle(.black)
                Spacer()
                Spacer()
            }
            .navigationTitle("Rock Paper Scissors")
            .foregroundStyle(.white)
            .onAppear() {
                opponentHand = hands.randomElement() ?? ""
            }
            .alert("Game Over", isPresented: $gameIsOver) {
                Button("Start new game") {
                    gameNum = 0
                }
            } message: {
                Text("Your final score is: \(currentScore)")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.regularMaterial)
        }
        
    }
        
    
    
//    func winningCondition() {
//        
//        if (currentChoice == "Rock" && shouldWin == true && opponentHand == "Scissor") {
//            currentScore += 1
//            opponentHand = hands.randomElement() ?? ""
//        }
//        else if (currentChoice == "Rock" && shouldWin == false && opponentHand == "Paper") {
//            currentScore += 1
//            opponentHand = hands.randomElement() ?? ""
//        }
//        else if (currentChoice == "Paper" && shouldWin == true && opponentHand == "Rock") {
//            currentScore += 1
//            opponentHand = hands.randomElement() ?? ""
//        }
//        else if (currentChoice == "Paper" && shouldWin == false && opponentHand == "Scissor") {
//            currentScore += 1
//            opponentHand = hands.randomElement() ?? ""
//        }
//        else if (currentChoice == "Scissor" && shouldWin == true && opponentHand == "Paper") {
//            currentScore += 1
//            opponentHand = hands.randomElement() ?? ""
//        }
//        else if (currentChoice == "Scissor" && shouldWin == false && opponentHand == "Rock") {
//            currentScore += 1
//            opponentHand = hands.randomElement() ?? ""
//        }
//        else {
//            currentScore -= 1
//            opponentHand = hands.randomElement() ?? ""
//        }
//    }
    func winningCondition() {
        let winningChoices: [String: String] = ["Scissor": "Rock", "Rock": "Paper", "Paper": "Scissor"]
        
        let opponentWinningChoice = winningChoices[opponentHand] ?? ""
        
        if (currentChoice == opponentWinningChoice && shouldWin) || (currentChoice != opponentWinningChoice && !shouldWin) {
            currentScore += 1
        } else {
            currentScore -= 1
        }
        gameNum += 1
        
        opponentHand = hands.randomElement() ?? ""
    }
    func gameOver() {
        if (gameNum < 9) {
            winningCondition()
        } else {
            gameIsOver = true
            
        }
    }
        

}

#Preview {
    ContentView()
}
