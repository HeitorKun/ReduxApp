//
//  WideButtonStyle.swift
//  WarrenChallengeRedux
//
//  Created by Heitor Feijó Kunrath on 14/11/22.
//

import Foundation


import SwiftUI

struct WideButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        return configuration.label
            .padding([.bottom,.top])
            .font(.title3)
            .frame(minWidth: 0 , maxWidth: .infinity)
            .background(Color(VisualConstants.red))
            .foregroundColor(.white)
            .cornerRadius(VisualConstants.cornerRadius)
            .opacity(configuration.isPressed ? 0.7 : 1)
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            
            
    }
}
