//
//  AppReducer.swift
//  WarrenChallengeRedux
//
//  Created by Heitor Feijó Kunrath on 14/11/22.
//

import Foundation

func appReducer(_ state: AppState, _ action: Action) -> AppState {
    var state = state
    state.loginState = LoginReducer(state.loginState, action)
    state.portfolioState = PortfolioReducer(state.portfolioState, action)
    
    return state
}
