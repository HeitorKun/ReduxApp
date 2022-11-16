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

struct LoginFail: Action {
    
}

struct LoginSuccess: Action {
    let token: String
}

struct LoginState: ReduxState {
    
    var loginStateCase: LoginStateCases
    
    init(loginStateCase: LoginStateCases) {
        self.loginStateCase = loginStateCase
    }
    
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
    case _ as LoginFail:
        state.loginStateCase = .loginFail
        
    case let action as LoginSuccess:
        state.loginStateCase = .loggedIn
        let tokenPersistence: SaveTokenInPersistence = UserDefaultsHelper()
        tokenPersistence.saveToken(token: action.token)
    default:
        break
    }
    
    return state
}

