
import Foundation

struct TopList: Decodable {
    
    var results: [ResultTop]?

}

struct ResultTop: Decodable {
    
    var id: Int?
    var overview: String?
    var posterPath: String?
    var releaseDate: String?
    var title: String?
    var voteAverage: Float?
}
