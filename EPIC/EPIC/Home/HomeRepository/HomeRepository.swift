//
//  HomeRepository.swift
//  EPIC
//
//  Created by dante canizo on 18/09/2023.
//

import Combine

class HomeRepository {
    private let serviceProvider: ServiceProvider
    private let dbProvider: DBProvider
    private let monitor: Monitor

    private var anyCancellables = Set<AnyCancellable>()
    private var dateImagesServiceSubject = PassthroughSubject<String, Error>()
    private(set) var dateImagesServicePublisher: AnyPublisher<[ImageDate], Error>
    private(set) var networkAvailable: Bool = true
    @Published private(set) var imageDates = Set<ImageDate>()
    
    init(
        serviceProvider: ServiceProvider,
        dbProvider: DBProvider,
        monitor: Monitor
    ) {
        self.serviceProvider = serviceProvider
        self.dbProvider = dbProvider
        self.monitor = monitor

        dateImagesServicePublisher = dateImagesServiceSubject
            .map { imageType in
                serviceProvider.requestDates(imageType: imageType)
            }
            .switchToLatest()
            .share()
            .eraseToAnyPublisher()

        monitor.isConnected.sink { [weak self] isConnected in
            self?.networkAvailable = isConnected
        }
        .store(in: &anyCancellables)
    }

    func fetchDates(imageType: String) {
        if networkAvailable {
            fetchNetworkDates(imageType: imageType)
        } else {
            fetchStoredDates()
        }
    }
    
    private func fetchNetworkDates(imageType: String) {
        dateImagesServiceSubject.send(imageType)
    }

    private func fetchStoredDates() {
        
    }
}
