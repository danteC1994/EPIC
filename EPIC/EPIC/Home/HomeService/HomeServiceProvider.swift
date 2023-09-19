//
//  HomeService.swift
//  EPIC
//
//  Created by dante canizo on 18/09/2023.
//

import Foundation
import Combine

class HomeServiceProvider: ServiceProvider {
    func requestDates(imageType: String) -> AnyPublisher<ImageDates, Error> {
        let url = URL(string: "https://epic.gsfc.nasa.gov/api/enhanced/all")

        return URLSession.shared.dataTaskPublisher(for: url!)
            .map(\.data)
            .decode(type: ImageDates.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

class HomeServiceProviderMock: ServiceProvider {
    func requestDates(imageType: String) -> AnyPublisher<ImageDates, Error> {
        return Just(ImageDates(dates: []))
            .replaceError(with: ImageDates(dates: []))
            .mapError({_ in EPICAPIError.notFound})
            .eraseToAnyPublisher()
    }
}
