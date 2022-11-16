//
//  InvestmentWebService.swift
//  WarrenChallengeRedux
//
//  Created by Heitor Feijó Kunrath on 15/11/22.
//

import Foundation

protocol PortfolioFetcherWebService {
    
    func fetchPortfolio(with token: String) async -> PortfoliosFetchAnswer
    
}

struct PortfolioWebservice: PortfolioFetcherWebService {
    
    func fetchPortfolio(with token: String) async -> PortfoliosFetchAnswer {
        guard let url = URL(string: "https://enigmatic-bayou-48219.herokuapp.com/api/v2/portfolios/mine" ) else {
            return PortfoliosFetchAnswer.error(errorType: .badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue(token, forHTTPHeaderField: "access-token")
        
        do {
            
            let session = URLSession.shared
            
            let (responseData, _) = try await session.data(for: request)
            
            let decodedResponse = try JSONDecoder().decode(PortfoliosModel.self, from: responseData)
            return PortfoliosFetchAnswer.success(data: decodedResponse)
            
        } catch  {
            return PortfoliosFetchAnswer.error(errorType: .noData)
        }
        
    }
    
}
