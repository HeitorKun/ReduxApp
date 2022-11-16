//
//  LoginModels.swift
//  WarrenChallengeRedux
//
//  Created by Heitor Feijó Kunrath on 15/11/22.
//

import Foundation

struct LoginTokens: Decodable {
    let accessToken: String
    let refreshToken: String
}

enum LoginAnswer {
    case error(errorType: NetworkError)
    case success(tokens: LoginTokens)
}
