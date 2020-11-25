
import Foundation

struct Popular: Decodable {
    
    var results: [ResultPopular]?
}

struct ResultPopular: Decodable {
    
    var id: Int?
    var overview: String?
    var posterPath: String?
    var releaseDate: String?
    var title: String?
    var voteAverage: Float?
}
