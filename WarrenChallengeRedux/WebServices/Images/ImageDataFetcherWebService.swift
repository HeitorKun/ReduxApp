//
//  ImageFetcherWebService.swift
//  WarrenChallengeRedux
//
//  Created by Heitor Feijó Kunrath on 16/11/22.
//
import Combine
import Foundation

protocol ImageDataFetcherService {
    
    func fetchImageData(from url: String) -> Future<Data,Error>
    
}

class ImageFetcherWebService: ImageDataFetcherService {
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchImageData(from urlStr: String) -> Future<Data, Error> {
        return Future<Data, Error> { [weak self] promise in
            
            guard let self = self, let url = URL(string: urlStr) else {
                return promise(.failure(NetworkError.badURL))
            }
            
            return URLSession.shared.dataTaskPublisher(for: url)
                .tryMap { (data, response) -> Data in
                    guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                        throw NetworkError.noData
                    }
                    return data
                }
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { (completionError) in
                    if case .failure(_) = completionError {
                        promise(.failure(NetworkError.noData))
                    }
                    
                }, receiveValue: {
                    promise(.success($0))
                })
                .store(in: &self.cancellables)
            
        }
    }
    
    
}
