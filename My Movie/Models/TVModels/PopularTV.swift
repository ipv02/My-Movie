

import Foundation


struct PopularTV: Decodable {
    
    var results: [ResultPopularTV]?
}

struct ResultPopularTV: Decodable {
    
    var firstAirDate: String?
    var id: Int?
    var name: String?
    var overview: String?
    var posterPath: String?
    var voteAverage: Float?
}
