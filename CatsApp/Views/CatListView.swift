//
//  ItemListView.swift
//  CatsApp
//
//  Created by Agustin Russo on 05/02/2025.
//

import SwiftUI

struct CatListView: View {
    @StateObject private var viewModel = CatListViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.cats) { cat in
                    NavigationLink(destination: CatDetailView(catId: cat.id)) {
                        HStack {
                            AsyncImage(url: URL(string: cat.url)) { image in
                                image.resizable().scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 80, height: 80)
                            .clipShape(RoundedRectangle(cornerRadius: 10))

                            Text(cat.breeds?.first?.name ?? "Another Cute Cat")
                                .font(.headline)
                        }
                        .padding(4)
                        .background(.clear)
                        .cornerRadius(12)
                    }
                    .accessibilityIdentifier("catCell_\(cat.id)")
                    .onAppear {
                        if cat == viewModel.cats.last {
                            viewModel.fetchCats()
                        }
                    }
                }
                .background(.clear)
            }
            .scrollContentBackground(.hidden)
            .accessibilityIdentifier("catListView")
            .background(
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
            .navigationTitle("Cats")
            .toolbarBackground(.opacity(0.01) , for: .navigationBar)
            .onAppear {
                viewModel.fetchCats()
            }
            .overlay {
                if viewModel.isLoading && viewModel.cats.isEmpty {
                    ProgressView("Loading...")
                        .padding()
                        .frame(alignment: .center)
                }
            }
        }
    }
}
