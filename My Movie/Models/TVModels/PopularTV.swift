

import Foundation


struct PopularTV: Decodable {
    
    var page: Int?
    var results: [ResultPopularTV]?
    var totalPages: Int?
    var totalResults: Int?
}

struct ResultPopularTV: Decodable {
    
    var backdropPath: String?
    var firstAirDate: String?
    var genreIds: [Int]?
    var id: Int?
    var name: String?
    var originCountry: [String]?
    var originalLanguage: String?
    var originalName: String?
    var overview: String?
    var popularity: Float?
    var posterPath: String?
    var voteAverage: Float?
}
