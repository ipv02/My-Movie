

import Foundation


struct Upcoming: Decodable {
    
    var results: [ResultUpcoming]?
}

struct Date: Decodable {
    
    var maximum: String?
    var minimum: String?
}

struct ResultUpcoming: Decodable {
    
    var id: Int?
    var overview: String?
    var posterPath: String?
    var releaseDate: String?
    var title: String?
    var voteAverage: Float?
}
