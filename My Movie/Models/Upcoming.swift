

import Foundation


struct Upcoming: Decodable {
    
    var dates: Date?
    var page: Int?
    var results: [ResultUpcoming]?
    var totalPages: Int?
    var totalResults: Int?
}

struct Date: Decodable {
    
    var maximum: String?
    var minimum: String?
}

struct ResultUpcoming: Decodable {
    
    var adult: Bool?
    var backdropPath: String?
    var genreIds: [Int]?
    var id: Int?
    var originalLanguage: String?
    var originalTitle: String?
    var overview: String?
    var popularity: Float?
    var posterPath: String?
    var releaseDate: String?
    var title: String?
    var video: Bool?
    var voteAverage: Float?
    var voteCount: Int?
}
