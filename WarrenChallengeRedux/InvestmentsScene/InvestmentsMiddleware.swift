//
//  InvestmentsMiddleware.swift
//  WarrenChallengeRedux
//
//  Created by Heitor Feijó Kunrath on 16/11/22.
//

import Foundation


func investmentsMiddleware() -> Middleware<AppState> {
    return { state, action, dispatch in
        
        switch action {
        case _ as FetchInvestments:
            
            Task {
                
                let portfolioWebService: PortfolioFetcherWebService = PortfolioWebservice()
                let tokenGetter: FetchTokenFromMemory = UserDefaultsHelper()
                
                let result = await  portfolioWebService.fetchPortfolio(with: tokenGetter.fetchTokenFromMemory() ?? "" )
                
                switch result {
                case .error(errorType: _):
                    dispatch(InvestmentsFetchingFailed())
                case .success(data: let portfolio):
                    dispatch(InvestmentsFetchingSuccess(portfolio: portfolio))
                }
            }
        default:
            break
        }
        
    }
    
}