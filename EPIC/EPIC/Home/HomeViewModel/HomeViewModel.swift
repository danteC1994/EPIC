//
//  HomeViewModel.swift
//  EPIC
//
//  Created by dante canizo on 18/09/2023.
//

import Combine

class HomeViewModel {
    let monitor: Monitor
    let HomeRepository: HomeRepository

    var anyCancellables = Set<AnyCancellable>()
    
    init(homeRepository: HomeRepository, monitor: Monitor) {
        self.HomeRepository = homeRepository
        self.monitor = monitor

        monitor.isConnected.sink { [weak self] isConnected in
            if isConnected {
                self?.HomeRepository.fetchDates(imageType: "enhanced")
            } else {
                self?.HomeRepository.fetchStoredDates()
            }
        }
        .store(in: &anyCancellables)
    }

    func fetchImages() {
        
    }
}
