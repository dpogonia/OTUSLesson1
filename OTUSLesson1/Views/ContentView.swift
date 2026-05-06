//
//  ContentView.swift
//  OTUSLesson1
//
//  Created by Dmitrii Pogonia on 05.05.2026.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var selectedTab: Int = 0
    @State private var openRandom: Bool = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            FirstTabView(selectedTab: $selectedTab, openRandom: $openRandom)
                .tabItem {
                    Label("First Tab", systemImage: "1.circle.fill")
                }
                .tag(0)
            
            SecondTabView(selectedTab: $selectedTab, openRandom: $openRandom)
                .tabItem {
                    Label("Second Tab", systemImage: "2.circle.fill")
                }
                .tag(1)
            
            ThirdTabView()
                .tabItem {
                    Label("Third Tab", systemImage: "3.circle.fill")
                }
                .tag(2)
        }
    }
}

#Preview {
    ContentView()
}
