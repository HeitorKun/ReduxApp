//
//  InvestmentsRedux.swift
//  WarrenChallengeRedux
//
//  Created by Heitor Feijó Kunrath on 16/11/22.
//

import Foundation

enum PortfolioStateCases {
    case haventTriedToFetch
    case fetchingPortfolio
    case fetchingFail
    case fetchSuccess( portfolio: PortfoliosModel)
}

struct FetchInvestments: Action {
    
}

struct InvestmentsFetchingFailed: Action {
    
}

struct InvestmentsFetchingSuccess: Action {
    var portfolio: PortfoliosModel
}

struct PortfolioState: ReduxState {
    
    var portfolioStateCase: PortfolioStateCases = .haventTriedToFetch
    
}

func PortfolioReducer(_ state: PortfolioState, _ action: Action) -> PortfolioState {
    var state = state
    
    switch action {
        
        case _ as InvestmentsFetchingFailed:
            state.portfolioStateCase = .fetchingFail
    
        case let action as InvestmentsFetchingSuccess:
            state.portfolioStateCase = .fetchSuccess(portfolio: action.portfolio)
        
        default:
            break
    }
    
    return state
}

