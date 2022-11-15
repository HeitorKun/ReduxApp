//
//  LoginRedux.swift
//  WarrenChallengeRedux
//
//  Created by Heitor Feijó Kunrath on 14/11/22.
//

import Foundation

enum LoginStateCases {
    case loggedIn
    case fetchingLoginAnswer
    case notLoggedIn
    case loginFail
}

struct PostLogin: Action {
    let email: String
    let password: String
}

struct LoginState: ReduxState {
    let loginStateCase: LoginStateCases
    
    init() {
        if let _ = UserDefaultsHelper().fetchTokenFromMemory() {
            self.loginStateCase = .loggedIn
        } else {
            self.loginStateCase = .notLoggedIn
        }
    }
    
}

func LoginReducer(_ state: LoginState, _ action: Action) -> LoginState {
    var state = state
    
    switch action {
        //case let action as LoginPossibilities:
            //authenticate and get
        default:
            break
    }
    
    return state
}

