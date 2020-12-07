
import Foundation


struct Video: Decodable {
    
    var results: [ResultVideo]?
}

struct ResultVideo: Decodable {
    
    var id: String?
    var key: String?
    var name: String?
    var site: String?
}
