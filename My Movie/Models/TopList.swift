
import Foundation

struct TopList: Decodable {
    
    var page: Int?
    var results: [ResultTop]?
    var totalPages: Int?
    var totalResults: Int?
}

struct ResultTop: Decodable {
    
    //var adult: Bool!
    //var backdropPath: String!
    //var genreIds: [Int]!
    var id: Int?
    //var originalLanguage: String!
    //var originalTitle: String!
    var overview: String?
    //var popularity: Float!
    var posterPath: String?
    var releaseDate: String?
    var title: String?
    //var video: Bool!
    var voteAverage: Float?
    //var voteCount: Int!
}
