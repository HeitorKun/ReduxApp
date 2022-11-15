//
//  WarrenChallengeReduxApp.swift
//  WarrenChallengeRedux
//
//  Created by Heitor Feijó Kunrath on 13/11/22.
//

import SwiftUI

@main
struct WarrenChallengeReduxApp: App {
    
    let store = Store(reducer: appReducer, state: AppState(), middlewares: [])
    
    var body: some Scene {
        WindowGroup {
            LandingView().environmentObject(store)
        }
    }
}
