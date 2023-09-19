//
//  HomeViewModel.swift
//  EPIC
//
//  Created by dante canizo on 18/09/2023.
//

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    private let homeRepository: HomeRepository
    @Published var imageDates = [ImageDate]()

    private var anyCancellables = Set<AnyCancellable>()
    
    init(homeRepository: HomeRepository) {
        self.homeRepository = homeRepository
        setSubscribers()
    }

    func fetchImages() {
        homeRepository.fetchDates(imageType: "enhanced")
    }

    func setSubscribers() {
        homeRepository.dateImagesServicePublisher
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case let .failure(error):
                    break
                case .finished:
                    break
                }
            }, receiveValue: { imageDates in
                self.imageDates = imageDates
            })
            .store(in: &anyCancellables)
    }
}
