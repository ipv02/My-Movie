
import Foundation

struct Credits: Decodable {
    
    var cast: [Cast]?
}

struct Cast: Decodable {
    
    var name: String?
    var profilePath: String?
}
