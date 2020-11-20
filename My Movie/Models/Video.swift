
import Foundation


struct Video: Decodable {
    
    var id: Int?
    var results: [ResultVideo]?
}

struct ResultVideo: Decodable {
    
    var id: String?
    var iso31661: String?
    var iso6391: String?
    var key: String?
    var name: String?
    var site: String?
    var size: Int?
    var type: String?
}
