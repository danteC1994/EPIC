//
//  HomeCoordinator.swift
//  EPIC
//
//  Created by dante canizo on 18/09/2023.
//

import SwiftUI

class HomeFactory {
    static func createHome() -> some View {
        

        let homeRepository = HomeRepository(
            serviceProvider: HomeServiceProvider(),
            dbProvider: HomeDBProvider(),
            monitor: NetworkMonitor()
        )
        let viewModel = HomeViewModel(homeRepository: homeRepository)

        return HomeView(viewModel: viewModel)
            .environmentObject(networkMonitor)
    }
}

extension HomeFactory {
    static func createHomeMocked() -> some View {
        let homeRepository = HomeRepository(
            serviceProvider: HomeServiceProviderMock(),
            dbProvider: HomeDBProvider(),
            monitor: NetworkMonitor()
        )
        let viewModel = HomeViewModel(homeRepository: homeRepository)

        return HomeView(viewModel: viewModel)
    }
}
