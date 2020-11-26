

import Foundation

struct OnTheAir: Decodable {
    
    //var page : Int!
    var results: [ResultOnTheAir]?
    //var totalPages : Int!
    //var totalResults : Int!
}

struct ResultOnTheAir: Decodable {
    
    //var backdropPath : String!
    var firstAirDate: String?
    //var genreIds : [Int]!
    var id: Int?
    var name: String?
   // var originCountry : [String]!
    //var originalLanguage : String!
    //var originalName : String!
    var overview: String?
    //var popularity : Float!
    var posterPath: String?
    var voteAverage: Float?
    //var voteCount : Int!
}
