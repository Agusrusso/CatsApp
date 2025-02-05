//
//  ItemListViewModel.swift
//  CatsApp
//
//  Created by Agustin Russo on 05/02/2025.
//


import Foundation

class CatListViewModel: ObservableObject {
    @Published var cats: [Cat] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    private let apiService: ApiServiceProtocol
    private var currentPage = 0
    private let limit = 10

    init(apiService: ApiServiceProtocol = ApiService()) { // Default to real API
            self.apiService = apiService
        }

    func fetchCats() {
        guard !isLoading else { return }
        isLoading = true

        ApiService.shared.fetchCats(page: currentPage, limit: limit) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let newCats):
                    self.cats.append(contentsOf: newCats)
                    self.currentPage += 1
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
