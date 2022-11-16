//
//  PortfoliosModel.swift
//  WarrenChallengeRedux
//
//  Created by Heitor Feijó Kunrath on 15/11/22.
//

import Foundation


enum PortfoliosFetchAnswer {
    case error(errorType: NetworkError)
    case success(data: PortfoliosModel)
}

struct PortfoliosModel: Decodable {
    var portfolios: [InvestmentModel]
}

struct InvestmentModel: Decodable {
    var _id: String
    var name: String
    var background: BackgroundImagesURLsModel
    var totalBalance: Double
    var goalAmount: Int?
    var goalDate: String
}

struct BackgroundImagesURLsModel: Decodable {
    var thumb: String
    var small: String
    var full: String
    var regular: String
    var raw: String
    
}
