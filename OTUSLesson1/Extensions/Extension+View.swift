//
//  Extension+View.swift
//  OTUSLesson1
//
//  Created by Dmitrii Pogonia on 06.05.2026.
//

import SwiftUI

struct PrimaryButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(.blue)
    }
}

extension View {
    func primaryButton() -> some View {
        self.modifier(PrimaryButtonModifier())
    }
}
