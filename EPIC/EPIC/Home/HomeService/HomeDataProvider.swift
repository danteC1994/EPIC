//
//  HomeDataProvider.swift
//  EPIC
//
//  Created by dante canizo on 18/09/2023.
//

import Combine

protocol DBProvider {
    func requestDates() -> ImageDates
    func storeDates()
}

protocol ServiceProvider {
    func requestDates(imageType: String) -> AnyPublisher<ImageDates, Error>
}
