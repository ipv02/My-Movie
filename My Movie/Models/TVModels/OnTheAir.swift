

import Foundation

struct OnTheAir: Decodable {
    
    var results: [ResultOnTheAir]?
}

struct ResultOnTheAir: Decodable {
    
    var firstAirDate: String?
    var id: Int?
    var name: String?
    var overview: String?
    var posterPath: String?
    var voteAverage: Float?
}
