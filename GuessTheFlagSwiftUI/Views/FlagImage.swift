//
//  FlagImage.swift
//  GuessTheFlagSwiftUI
//
//  Created by Sagun Raj Lage on 1/1/20.
//  Copyright © 2020 Sagun Raj Lage. All rights reserved.
//

import SwiftUI

struct FlagImage: View {
    
    let number: Int
    let countries: [String]
    let action: (_ number: Int) -> Void
    
    var body: some View {
        Button(action: {
            self.action(self.number)
        }) {
            Image(self.countries[number]).renderingMode(.original)
        }
        .clipShape(Capsule())
        .overlay(Capsule()
        .stroke(Color.black, lineWidth: 1))
        .shadow(color: .black, radius: 2)
    }
    
}
