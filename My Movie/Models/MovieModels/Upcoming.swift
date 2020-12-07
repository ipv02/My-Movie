

import Foundation


struct Upcoming: Decodable {
    
    var results: [ResultUpcoming]?
}

struct ResultUpcoming: Decodable {
    
    var id: Int?
    var overview: String?
    var posterPath: String?
    var releaseDate: String?
    var title: String?
    var voteAverage: Float?
}
