import Foundation

protocol ApiServiceProtocol {
    func fetchCats(page: Int, limit: Int, completion: @escaping (Result<[Cat], Error>) -> Void)
    func fetchCatDetails(id: String, completion: @escaping (Result<Cat, Error>) -> Void)
}

class ApiService: ApiServiceProtocol {
    static let shared = ApiService()
    private let baseURL = "https://api.thecatapi.com/v1/images/search"
    private let apiKey = "live_fT1X80cL3R7HfBGrQ57HICVQnWqsjNMUt1SxaSTGqRbsZ83kEhJnCAcYVO3QdTbO" 

    func fetchCats(page: Int, limit: Int = 10, completion: @escaping (Result<[Cat], Error>) -> Void) {
        let urlString = "\(baseURL)?limit=\(limit)&page=\(page)&order=DESC&api_key=\(apiKey)"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else { return }

            do {
                let cats = try JSONDecoder().decode([Cat].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(cats))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    func fetchCatDetails(id: String, completion: @escaping (Result<Cat, Error>) -> Void) {
        let urlString = "https://api.thecatapi.com/v1/images/\(id)?api_key=\(apiKey)"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else { return }

            do {
                let cat = try JSONDecoder().decode(Cat.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(cat))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
