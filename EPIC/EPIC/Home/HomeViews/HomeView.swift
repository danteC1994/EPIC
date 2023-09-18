//
//  HomeView.swift
//  EPIC
//
//  Created by dante canizo on 18/09/2023.
//

import SwiftUI

struct HomeView: View {
    let viewModel: HomeViewModel
    var body: some View {
        NavigationView {
            VStack {
                ProgressView()
                   .progressViewStyle(CircularProgressViewStyle())
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(HomeRepository: HomeRepository()))
    }
}
