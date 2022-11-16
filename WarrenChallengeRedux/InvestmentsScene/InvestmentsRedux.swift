//
//  InvestmentsRedux.swift
//  WarrenChallengeRedux
//
//  Created by Heitor Feijó Kunrath on 16/11/22.
//

import Foundation

struct FetchInvestments: Action {
    
}

struct InvestmentsFetchingFailed: Action {
    
}

struct InvestmentsFetchingSuccess: Action {
    var portfolio: PortfoliosModel
}

struct PortfolioState: ReduxState {
    
    var portfolio: PortfoliosModel = .init(portfolios: [])
    
}

func PortfolioReducer(_ state: PortfolioState, _ action: Action) -> PortfolioState {
    var state = state
    
    switch action {
    case _ as InvestmentsFetchingFailed:
        state.portfolio = .init(portfolios: [])
        
    case let action as InvestmentsFetchingSuccess:
        state.portfolio = action.portfolio
        
    default:
        break
    }
    
    return state
}

