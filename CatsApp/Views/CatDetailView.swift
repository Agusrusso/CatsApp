//
//  ItemDetailView.swift
//  CatsApp
//
//  Created by Agustin Russo on 05/02/2025.
//


import SwiftUI

struct CatDetailView: View {
    let catId: String
    @StateObject private var viewModel = CatDetailViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                if let cat = viewModel.cat {
                    AsyncImage(url: URL(string: cat.url)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 300, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                    Text(cat.breeds?.first?.name ?? "Really Cute Cat")
                        .font(.largeTitle)
                        .bold()
                        .shadow(radius: 1)

                    if let breed = cat.breeds?.first {
                        Text("Origin: \(breed.origin)")
                            .font(.headline)
                            .foregroundColor(.secondary)
                            .shadow(radius: 1)

                        Text("Temperament: \(breed.temperament)")
                            .font(.body)
                            .shadow(radius: 1)

                        Text("Description:")
                            .font(.headline)
                            .shadow(radius: 1)

                        Text(breed.description)
                            .font(.body)
                            .shadow(radius: 1)
                    }
                } else if viewModel.isLoading {
                    ProgressView("Loading details...")
                } else if let error = viewModel.errorMessage {
                    Text(error).foregroundColor(.red)
                }
            }
            .padding()
        }
        .navigationTitle("Details")
        .toolbarBackground(.opacity(0.01) , for: .navigationBar)
        .onAppear {
            viewModel.fetchCatDetails(id: catId)
        }
        .background(
            Image("background")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .scaledToFill()
                .ignoresSafeArea()
        )
    }
}
