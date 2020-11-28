

import Foundation


struct SearchTVShow: Decodable {
    
    var page: Int?
    var results: [ResultSearchTVShow]?
    var totalPages: Int?
    var totalResults: Int?
}


struct ResultSearchTVShow: Decodable {
    
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
    var voteCount: Int?
}
