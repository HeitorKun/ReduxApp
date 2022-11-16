//
//  LoginMiddleware.swift
//  WarrenChallengeRedux
//
//  Created by Heitor Feijó Kunrath on 14/11/22.
//

import Foundation

func loginMiddleware() -> Middleware<AppState> {
    return { state, action, dispatch in
        
        switch action {
        case let action as PostLogin:
            Task {
                let postLoginService: PostLoginService = LoginWebservice()
                let result = await  postLoginService.postLogin(email: action.email, password: action.password)
                DispatchQueue.main.async {
                    switch result {
                    case .error(errorType: _):
                        dispatch(LoginFail())
                    case .success(tokens: let tokens):
                        dispatch(LoginSuccess(token: tokens.accessToken))
                    }
                }
            }
        default:
            break
        }
        
    }
    
}
