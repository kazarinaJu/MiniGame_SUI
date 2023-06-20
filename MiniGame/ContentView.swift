//
//  ContentView.swift
//  MiniGame
//
//  Created by Юлия Ястребова on 20.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = 0.0
    
    @State private var isPresented = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            HStack {
                Text("0")
                //slider
                Text("100")
            }
            
            Button("Проверь меня!") { isPresented.toggle() }
                .alert("Ваш счёт", isPresented: $isPresented, actions: {}) {
                    Text(computeScore().formatted())
                }
            
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
                currentValue = 0.0
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
            let difference = abs(targetValue - lround(Double(currentValue)))
            return 100 - difference
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
