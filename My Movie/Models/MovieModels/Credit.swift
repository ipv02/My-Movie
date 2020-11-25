
import Foundation

struct Credits: Decodable {
    
    var id: Int?
    var cast: [Cast]?
    var crew: [Crew]?
}

struct Cast: Decodable {
    
    var adult: Bool?
    var castId: Int?
    var character: String?
    var creditId: String?
    var gender: Int?
    var id: Int?
    var knownForDepartment: String?
    var name: String?
    var order: Int?
    var originalName: String?
    var popularity: Float?
    var profilePath: String?
}

struct Crew: Decodable {
    
    var adult: Bool?
    var creditId: String?
    var department: String?
    var gender: Int?
    var id: Int?
    var job: String?
    var knownForDepartment: String?
    var name: String?
    var originalName: String?
    var popularity: Float?
    var profilePath: String?
}
