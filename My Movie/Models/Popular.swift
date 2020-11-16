
import Foundation

struct Popular: Decodable {
    
    var page: Int?
    var results: [Result]?
    var totalPages: Int?
    var totalResults: Int?
}

struct Result: Decodable {
    
    var adult: Bool?
    var backdropPath: String?
    var genreIds: [Int]?
    var id: Int?
    var originalLanguage: String?
    var originalTitle: String?
    var overview: String?
    var popularity: Float?
    var poster_path: String? = "https://image.tmdb.org/t/p/w500/"
    var release_date: String?
    var title: String?
    var video: Bool?
    var vote_average: Float?
    var voteCount: Int?
}
