//
//  CatDetailViewModel.swift
//  CatsApp
//
//  Created by Agustin Russo on 05/02/2025.
//


import Foundation

class CatDetailViewModel: ObservableObject {
    @Published var cat: Cat?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    private let apiService: ApiServiceProtocol

    init(apiService: ApiServiceProtocol = ApiService.shared) {
        self.apiService = apiService
    }

    func fetchCatDetails(id: String) {
        isLoading = true
        apiService.fetchCatDetails(id: id) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let catDetails):
                    self.cat = catDetails
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
