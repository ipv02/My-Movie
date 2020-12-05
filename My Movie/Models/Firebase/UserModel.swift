

import Foundation
import FirebaseFirestore


struct UserModel {
    
    var email: String
    var id: String
    var userName: String
    var sex: String
    var avatarStringUrl: String
    
    
    init(email: String, id: String, userName: String, sex: String, avatarStringUrl: String) {
        self.email = email
        self.id = id
        self.userName = userName
        self.sex = sex
        self.avatarStringUrl = avatarStringUrl
    }
    
    init?(document: DocumentSnapshot) {
        guard let data = document.data() else { return nil }
        guard let email = data["email"] as? String,
              let id = data["uid"] as? String,
              let userName = data["userName"] as? String,
              let sex = data["sex"] as? String,
              let avatarStringUrl = data["avatarStringUrl"] as? String else { return nil }
        
        self.email = email
        self.id = id
        self.userName = userName
        self.sex = sex
        self.avatarStringUrl = avatarStringUrl
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        guard let email = data["email"] as? String,
              let id = data["uid"] as? String,
              let userName = data["userName"] as? String,
              let sex = data["sex"] as? String,
              let avatarStringUrl = data["avatarStringUrl"] as? String else { return nil }
        
        self.email = email
        self.id = id
        self.userName = userName
        self.sex = sex
        self.avatarStringUrl = avatarStringUrl
    }
    
    var represintation: [String: Any] {
        var rep = ["email": email]
        rep["uid"] = id
        rep["userName"] = userName
        rep["sex"] = sex
        rep["avatarStringUrl"] = avatarStringUrl
        return rep
    }
}


