//
//  ContentView.swift
//  WarrenChallengeRedux
//
//  Created by Heitor Feijó Kunrath on 15/11/22.
//

import SwiftUI

struct ContentView: View {
    let store = Store(reducer: appReducer, state: AppState(), middlewares: [loginMiddleware(), investmentsMiddleware()])
    @State private var loggedIn: Bool = false
    var body: some View {
        HStack{
            if loggedIn {
                InvestmentsView()
            }
            else {
                LandingView()
                    .environmentObject(store)
            }
        }
        .onReceive(store.$state) { _ in
            loggedIn = store.state.loginState.loginStateCase  == .loggedIn
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
