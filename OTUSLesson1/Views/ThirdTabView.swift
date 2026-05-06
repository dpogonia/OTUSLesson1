//
//  ThirdTab.swift
//  OTUSLesson1
//
//  Created by Dmitrii Pogonia on 06.05.2026.
//

import SwiftUI

struct ThirdTabView: View {
    @State private var showModal: Bool = false
    
    var body: some View {
        Button("To modal view", action: {
            showModal = true
        })
        .primaryButton()
        .sheet(isPresented: $showModal) {
            ModalView()
        }
    }
}
