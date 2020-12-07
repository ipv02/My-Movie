

import Foundation


struct SearchMovie: Decodable {
    
    var results: [ResultSearchMovie]?
}

struct ResultSearchMovie: Decodable {
    
    var id: Int?
    var overview: String?
    var posterPath: String?
    var releaseDate: String?
    var title: String?
    var voteAverage: Float?
}
