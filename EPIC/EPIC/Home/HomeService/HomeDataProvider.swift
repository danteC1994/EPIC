//
//  HomeDataProvider.swift
//  EPIC
//
//  Created by dante canizo on 18/09/2023.
//

import Combine

protocol DBProvider {
    func requestDates() -> [ImageDate]
    func storeDates()
}

protocol ServiceProvider {
    func requestDates(imageType: String) -> AnyPublisher<[ImageDate], Error>
}
