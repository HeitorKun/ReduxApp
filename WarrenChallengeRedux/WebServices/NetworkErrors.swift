//
//  NetworkErros.swift
//  WarrenChallengeRedux
//
//  Created by Heitor Feijó Kunrath on 15/11/22.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case decodingError
    case noData
}
