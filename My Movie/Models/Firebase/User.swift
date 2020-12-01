

import Foundation
import FirebaseFirestore


struct UserModel {
    
    var email: String
    var id: String
    
    
    init(email: String, id: String) {
        self.email = email
        self.id = id
    }
    
    init?(document: DocumentSnapshot) {
        guard let data = document.data() else { return nil }
        guard let email = data["email"] as? String else { return nil }
        guard let id = data["uid"] as? String else { return nil }
        
        self.email = email
        self.id = id
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        guard let email = data["email"] as? String else { return nil }
        guard let id = data["uid"] as? String else { return nil }
        
        self.email = email
        self.id = id
    }
    
    var represintation: [String: Any] {
        var rep = ["email": email]
        rep["uid"] = id
        return rep
    }
}


