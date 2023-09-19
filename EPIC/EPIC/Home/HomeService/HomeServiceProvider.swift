//
//  HomeService.swift
//  EPIC
//
//  Created by dante canizo on 18/09/2023.
//

import Foundation
import Combine

class HomeServiceProvider: ServiceProvider {
    func requestDates(imageType: String) -> AnyPublisher<[ImageDate], Error> {
        let url = URL(string: "https://epic.gsfc.nasa.gov/api/enhanced/all")

        return URLSession.shared.dataTaskPublisher(for: url!)
            .map(\.data)
            .decode(type: [ImageDate].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

class HomeServiceProviderMock: ServiceProvider {
    func requestDates(imageType: String) -> AnyPublisher<[ImageDate], Error> {
        return Just([ImageDate]())
            .replaceError(with: [ImageDate]())
            .mapError({_ in EPICAPIError.notFound})
            .eraseToAnyPublisher()
    }
}
