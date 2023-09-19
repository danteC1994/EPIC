//
//  HomeView.swift
//  EPIC
//
//  Created by dante canizo on 18/09/2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    var body: some View {
        NavigationView {
            VStack {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
            .isHidden(viewModel.imageDates.isEmpty)
            List {
                ForEach(viewModel.imageDates) { imageDate in
                    Text(imageDate.date)
                }
            }
        }
        .onAppear{
            viewModel.fetchImages()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFactory.createHomeMocked()
    }
}

extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}
