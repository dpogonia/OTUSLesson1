//
//  SecondTab.swift
//  OTUSLesson1
//
//  Created by Dmitrii Pogonia on 06.05.2026.
//

import SwiftUI

struct SecondTabView: View {
    @Binding var selectedTab: Int
    @Binding var openRandom: Bool
    @State private var selectedAnimal: String?
    private let animals = ["dog", "cat", "hare", "tortoise", "ladybug"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(animals, id: \.self) { animal in
                    NavigationLink("Show \(animal)") {
                        AnimalView(animal: animal)
                    }
                }
            }
            .navigationTitle("Animals")
            .navigationDestination(item: $selectedAnimal) { animal in
                AnimalView(animal: animal)
            }
        }
        .onAppear {
                    if openRandom {
                        selectedAnimal = animals.randomElement()
                        openRandom = false
                    }
                }
        .onChange(of: openRandom) { _, newValue in
            if newValue {
                selectedAnimal = animals.randomElement()
                openRandom = false
            }
        }
    }
}

struct AnimalView: View {
    let animal: String
    
    var body: some View {
        Image(systemName: animal)
            .font(.system(size: 100))
            .foregroundStyle(Color.orange)
    }
}

