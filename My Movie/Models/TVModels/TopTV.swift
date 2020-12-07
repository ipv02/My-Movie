

import Foundation


struct TopTV: Decodable {
    
    var results: [ResultTopTV]?
}

struct ResultTopTV: Decodable {
    
    var firstAirDate: String?
    var id: Int?
    var name: String?
    var overview: String?
    var posterPath: String?
    var voteAverage: Float?
}
