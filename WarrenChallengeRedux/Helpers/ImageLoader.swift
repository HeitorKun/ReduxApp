//
//  ImageLoader.swift
//  WarrenChallengeRedux
//
//  Created by Heitor Feijó Kunrath on 16/11/22.
//
import Combine
import Foundation

protocol ImageLoaderAbstraction: ObservableObject {
    var imageData: Data { get  }
    func fetch(urlString:String)

}

class ImageLoader: ImageLoaderAbstraction {
    @Published var imageData: Data = Data()
    
    private var dataService: ImageDataFetcherService
    
    private var subscriptions: Set<AnyCancellable> = []
    
    init(dataService: ImageDataFetcherService = ImageFetcherWebService()) {
        self.dataService = dataService
        self.fetch(urlString: "https://images.unsplash.com/photo-1463109598173-3864231fade5?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjg3NTU5fQ")
    }
    
    func fetch(urlString: String) {
        dataService.fetchImageData(from: urlString).sink { _ in
            
        } receiveValue: { [weak self] data in
            self?.imageData = data
            print("working")
        }.store(in: &subscriptions)
    }
    

}