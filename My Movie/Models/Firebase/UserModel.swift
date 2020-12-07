

import Foundation
import FirebaseFirestore


struct UserModel {
    
    //var id: String
    var email: String
    var password: String
    
    
    init(email: String, password: String) {
        //self.id = id
        self.email = email
        self.password = password
    }
    
    init?(document: DocumentSnapshot) {
        guard let data = document.data() else { return nil }
        guard let email = data["email"] as? String,
              //let id = data["uid"] as? String,
              let password = data["password"] as? String else { return nil }
        
        self.email = email
        //self.id = id
        self.password = password
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        guard let email = data["email"] as? String,
              //let id = data["uid"] as? String,
              let password = data["password"] as? String else { return nil }
        
        self.email = email
        //self.id = id
        self.password = password
    }
    
    var represintation: [String: Any] {
        var rep = ["email": email]
        //rep["uid"] = id
        rep["password"] = password
        return rep
    }
}


