//
//  WarrenChallengeRedux
//
//  Created by Heitor Feijó Kunrath on 14/11/22.
//

import Foundation

protocol PostLoginProtocol {
    
    func postLogin(email: String, password: String) async -> LoginAnswer
    
}

struct LoginWebservice: PostLoginProtocol {
    
    func postLogin(email: String, password: String) async -> LoginAnswer {
        guard let url = URL(string: "https://enigmatic-bayou-48219.herokuapp.com/api/v2/account/login" ) else {
            return LoginAnswer.error(errorType: .badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        let body = [    "email": email,
                        "password": password
        ]
        
        do {
            let data = try JSONSerialization.data(
                withJSONObject: body,
                options: []
            )
            request.httpBody = data
            let session = URLSession.shared
            
            let (responseData, _) = try await session.upload(
                for: request,
                from: data
            )
            
            let decodedResponse = try JSONDecoder().decode(LoginTokens.self, from: responseData)
            return LoginAnswer.success(tokens: decodedResponse)
            
        } catch  {
            return LoginAnswer.error(errorType: .noData)
        }
        
    }
    
}
