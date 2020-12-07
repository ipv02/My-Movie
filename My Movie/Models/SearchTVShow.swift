

import Foundation


struct SearchTVShow: Decodable {
    
    var results: [ResultSearchTVShow]?
}

struct ResultSearchTVShow: Decodable {
    
    var firstAirDate: String?
    var id: Int?
    var name: String?
    var overview: String?
    var posterPath: String?
    var voteAverage: Float?
}
