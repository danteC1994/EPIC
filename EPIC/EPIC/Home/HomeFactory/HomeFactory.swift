//
//  HomeCoordinator.swift
//  EPIC
//
//  Created by dante canizo on 18/09/2023.
//

import SwiftUI

class HomeFactory {
    static func createHome() -> some View {
        let homeRepository = HomeRepository()
        let viewModel = HomeViewModel(HomeRepository: homeRepository)

        return HomeView(viewModel: viewModel)
    }
}
