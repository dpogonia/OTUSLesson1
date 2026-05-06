//
//  FirstTab.swift
//  OTUSLesson1
//
//  Created by Dmitrii Pogonia on 06.05.2026.
//

import SwiftUI

struct FirstTabView: View {
    @Binding var selectedTab: Int
    @Binding var openRandom: Bool
    
    var body: some View {
        Button("Open Second Tab Random View") {
            selectedTab = 1
            openRandom = true
        }
        .primaryButton()
    }
}
