
import Foundation

struct Popular: Decodable {
    
    //var page: Int?
    var results: [ResultPopular]?
    //var totalPages: Int?
    //var totalResults: Int?
}

struct ResultPopular: Decodable {
    
    // var adult: Bool?
    //var backdropPath: String?
    //var genreIds: [Int]?
    //var id: Int?
    //var originalLanguage: String?
    //var originalTitle: String?
    //var overview: String?
    //var popularity: Float?
    var posterPath: String?
    var releaseDate: String?
    var title: String?
    //var video: Bool?
    var voteAverage: Float?
    //var voteCount: Int?
}
