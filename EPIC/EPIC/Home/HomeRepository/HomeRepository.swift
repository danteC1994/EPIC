//
//  HomeRepository.swift
//  EPIC
//
//  Created by dante canizo on 18/09/2023.
//

import Combine

class HomeRepository {
    let serviceProvider: ServiceProvider
    let dbProvider: DBProvider

    private var anyCancellables = Set<AnyCancellable>()
    private var dateImagesServiceSubject = PassthroughSubject<String, Error>()
    var dateImagesServicePublisher: AnyPublisher<ImageDates, Error>
    
    init(
        serviceProvider: ServiceProvider,
        dbProvider: DBProvider,
        monitor: Monitor
    ) {
        self.serviceProvider = serviceProvider
        self.dbProvider = dbProvider

        dateImagesServicePublisher = dateImagesServiceSubject
            .map { imageType in
                serviceProvider.requestDates(imageType: imageType)
            }
            .switchToLatest()
            .share()
            .eraseToAnyPublisher()
    }

    func fetchDates(imageType: String) {
        dateImagesServiceSubject.send(imageType)
    }

    func fetchStoredDates() {
        
    }
}
