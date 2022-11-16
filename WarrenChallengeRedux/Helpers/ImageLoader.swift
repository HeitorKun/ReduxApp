//
//  ImageLoader.swift
//  WarrenChallengeRedux
//
//  Created by Heitor Feijó Kunrath on 16/11/22.
//
import Combine
import Foundation

class WebImageLoader: ObservableObject {
    @Published var imageData: Data = Data()
    
    private var dataService: ImageDataFetcherService
    
    private var subscriptions: Set<AnyCancellable> = []
    
    init(dataService: ImageDataFetcherService = ImageFetcherWebService()) {
        self.dataService = dataService
    }
    
    func fetch(urlString: String) {
        dataService.fetchImageData(from: urlString).sink { _ in
            
        } receiveValue: { [weak self] data in
            self?.imageData = data
        }.store(in: &subscriptions)
    }
    

}
