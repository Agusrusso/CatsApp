struct Cat: Codable, Identifiable, Equatable {
    let id: String
    let url: String
    let breeds: [Breed]?

    struct Breed: Codable, Equatable {
        let name: String
        let description: String
        let temperament: String
        let origin: String
    }

    static func == (lhs: Cat, rhs: Cat) -> Bool {
        return lhs.id == rhs.id
    }
}
